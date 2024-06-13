import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/users.dart';
import 'package:fitness_app/utils/validators.dart';

class SignUpEmailView extends StatelessWidget {
  const SignUpEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _SignUpEmailViewBody(),
      resizeToAvoidBottomInset: false,
    );
  }
}

class _SignUpEmailViewBody extends ConsumerStatefulWidget {
  const _SignUpEmailViewBody();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SignUpEmailViewBodyState();
  }
}

class _SignUpEmailViewBodyState extends ConsumerState<_SignUpEmailViewBody> {
  final _signUpFormKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future(() {
      final notifier = ref.read(userRegistrationNotifierProvider.notifier);
      notifier.updateForm(const UserRegistrationForm());
    });

    ref.listenManual(
      userRegistrationNotifierProvider,
      (previous, next) {},
      fireImmediately: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'sign_up_email_view.title',
            textAlign: TextAlign.center,
            style: textTheme.titleLarge,
          ).tr(),
          _buildForm(context, textTheme),
          Text(
            'common.tos_disclaimer',
            style: textTheme.bodySmall,
            textAlign: TextAlign.center,
          ).tr()
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context, TextTheme textTheme) {
    return Form(
      key: _signUpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'sign_up_email_view.name_field_label',
            style: textTheme.labelMedium,
          ).tr(),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.text,
            validator: nonEmptyValidator,
            onSaved: (v) => _onSubmitted(context),
          ),
          const SizedBox(height: 16.0),
          Text(
            'sign_up_email_view.email_field_label',
            style: textTheme.labelMedium,
          ).tr(),
          const SizedBox(height: 8.0),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            validator: emailValidator,
            onSaved: (v) => _onSubmitted(context),
          ),
          const SizedBox(height: 16.0),
          Text(
            'sign_up_email_view.password_field_label',
            style: textTheme.labelMedium,
          ).tr(),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            validator: passwordValidator,
            onSaved: (v) => _onSubmitted(context),
          ),
          const SizedBox(height: 16.0),
          FilledButton(
            onPressed: () => _onSubmitted(context),
            child: const Text('common.sign_up_button').tr(),
          )
        ],
      ),
    );
  }

  void _onSubmitted(BuildContext context) {
    if (_signUpFormKey.currentState!.validate()) {
      final form = ref.read(userRegistrationNotifierProvider);
      final formNotifier = ref.read(userRegistrationNotifierProvider.notifier);
      formNotifier.updateForm(form.copyWith(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      ));

      context.push('/sign_up/profile');
    }
  }
}
