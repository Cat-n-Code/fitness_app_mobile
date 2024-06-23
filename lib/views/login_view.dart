import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:fitness_app/providers/auth.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fitness_app/utils/exceptions.dart';
import 'package:fitness_app/utils/validators.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: media.size.height - media.viewPadding.vertical - 56.0,
          ),
          child: _LoginViewBody(),
        ),
      ),
    );
  }
}

class _LoginViewBody extends ConsumerStatefulWidget {
  @override
  ConsumerState<_LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends ConsumerState<_LoginViewBody> {
  final _loginFormKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorTextKey;

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() => setState(() => _errorTextKey = null));
    _passwordController.addListener(() => setState(() => _errorTextKey = null));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'login_view.title',
            textAlign: TextAlign.center,
            style: textTheme.titleLarge,
          ).tr(),
          _buildForm(textTheme, theme.colorScheme),
          Text(
            'common.tos_disclaimer',
            style: textTheme.bodySmall,
            textAlign: TextAlign.center,
          ).tr()
        ],
      ),
    );
  }

  Widget _buildForm(TextTheme textTheme, ColorScheme colorScheme) {
    return Form(
      key: _loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'common.email_field_label',
            style: textTheme.labelMedium,
          ).tr(),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: compositeValidator([nonEmptyValidator, emailValidator]),
            enabled: !_isLoading,
            onFieldSubmitted: (text) => _onSubmitted(),
          ),
          const SizedBox(height: 16.0),
          Text(
            'common.password_field_label',
            style: textTheme.labelMedium,
          ).tr(),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            validator: passwordValidator,
            enabled: !_isLoading,
            onFieldSubmitted: (text) => _onSubmitted(),
          ),
          const SizedBox(height: 8.0),
          if (_errorTextKey != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                _errorTextKey!,
                style: textTheme.bodySmall!.copyWith(color: colorScheme.error),
              ).tr(),
            ),
          const SizedBox(height: 8.0),
          Skeletonizer(
            enabled: _isLoading,
            child: FilledButton(
              onPressed: () => _onSubmitted(),
              style: secondaryButton,
              child: const Text('common.login_button').tr(),
            ),
          )
        ],
      ),
    );
  }

  void _onSubmitted() async {
    if (!_loginFormKey.currentState!.validate() || _isLoading) {
      return;
    }

    setState(() {
      _isLoading = true;
      _errorTextKey = null;
    });

    final authNotifier = ref.read(authTokenNotifierProvider.notifier);
    final result = await authNotifier.authorize(
      _emailController.text,
      _passwordController.text,
    );

    switch (result) {
      case Left():
        final user = await ref.read(currentUserNotifierProvider.future);
        if (mounted) {
          switch (user.toNullable()!.role) {
            case Role.customer:
              context.go('/customer');
            case Role.coach:
              context.go('/coach');
          }
        }
      case Right(value: final exception):
        if (exception case ApiException(response: final response)
            when response.statusCode == HttpStatus.unauthorized) {
          setState(() {
            _errorTextKey = 'errors.invalid_credentials';
            _isLoading = false;
          });
        } else {
          presentError(exception, widgetRef: ref);
        }
    }
  }
}
