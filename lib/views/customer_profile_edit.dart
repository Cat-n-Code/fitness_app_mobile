import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/providers/scaffold_messenger.dart';
import 'package:fitness_app/widgets/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/users.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fitness_app/utils/validators.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomerProfileEditView extends ConsumerStatefulWidget {
  const CustomerProfileEditView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomerProfileEditViewState();
}

class _CustomerProfileEditViewState
    extends ConsumerState<CustomerProfileEditView> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _sexController = TextEditingController();
  Sex? _sex;

  @override
  void initState() {
    super.initState();

    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: _buildAppBar(theme.textTheme, theme.colorScheme),
      body: _buildBody(theme.textTheme),
    );
  }

  void _loadUser() async {
    final userOption = await ref.read(currentUserNotifierProvider.future);
    final User user;
    switch (userOption) {
      case None():
        if (mounted) {
          context.go('/');
        }
        return;
      case Some(value: final u):
        user = u;
    }

    if (!mounted) {
      return;
    }

    setState(() {
      _emailController.text = user.email;
      _nameController.text = user.name;
      _birthDateController.text = user.birthDate != null
          ? _getDateFormat().format(user.birthDate!)
          : '';
      _sexController.text =
          user.sex != null ? user.sex!.translationKey.tr(context: context) : '';
      _sex = user.sex;
    });
  }

  DateFormat _getDateFormat() {
    final locale = EasyLocalization.of(context)!.locale;
    return DateFormat.yMd(locale.toLanguageTag());
  }

  AppBar _buildAppBar(TextTheme textTheme, ColorScheme colorScheme) {
    return AppBar(
      title: const Text('customer_profile_edit_view.title').tr(),
    );
  }

  Widget _buildBody(TextTheme textTheme) {
    final userValue = ref.watch(currentUserNotifierProvider);
    final user = userValue.valueOrNull?.toNullable() ??
        User(
          email: BoneMock.email,
          name: BoneMock.name,
          birthDate: DateTime.now(),
          sex: Sex.male,
        );

    return Skeletonizer(
      enabled: userValue.isLoading,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: _buildForm(user),
        ),
      ),
    );
  }

  Widget _buildForm(User user) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'common.email_field_label',
            style: textTheme.labelMedium,
          ).tr(),
          const SizedBox(height: 8.0),
          Skeleton.shade(
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: emailValidator,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'common.name_field_label',
            style: textTheme.labelMedium,
          ).tr(),
          const SizedBox(height: 8.0),
          Skeleton.shade(
            child: TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              validator: nonEmptyValidator,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'common.sex_field_label',
            style: textTheme.labelMedium,
          ).tr(),
          const SizedBox(height: 8.0),
          Skeleton.shade(
            child: DropdownMenu(
              controller: _sexController,
              expandedInsets: EdgeInsets.zero,
              dropdownMenuEntries: Sex.values
                  .map(
                    (sex) => DropdownMenuEntry(
                        value: sex,
                        label: sex.translationKey.tr(context: context)),
                  )
                  .toList(),
              onSelected: (sex) => _sex = sex,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'common.birth_date_field_label',
            style: textTheme.labelMedium,
          ).tr(),
          const SizedBox(height: 8.0),
          Skeleton.shade(
            child: TextFormField(
              controller: _birthDateController,
              keyboardType: TextInputType.none,
              readOnly: true,
              onTap: () async {
                final locale = EasyLocalization.of(context)!.locale;
                final date = await showDatePicker(
                  context: context,
                  locale: locale,
                  firstDate: DateTime.now().subtract(
                    const Duration(days: 30 * 12 * 99),
                  ),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  setState(
                    () => _birthDateController.text =
                        _getDateFormat().format(date),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 24.0),
          FilledButton(
            onPressed: _onFormSubmitted,
            style: secondaryButton,
            child: const Text('common.save_button').tr(),
          ),
        ],
      ),
    );
  }

  void _onFormSubmitted() async {
    if (_formKey.currentState!.validate()) {
      final user = ref
          .read(
            currentUserNotifierProvider,
          )
          .valueOrNull
          ?.toNullable();
      final newUser = user!.copyWith(
        email: _emailController.text,
        name: _nameController.text,
        sex: _sex,
      );
      final notifier = ref.read(currentUserNotifierProvider.notifier);
      final result = await notifier.updateUser(newUser);
      if (result case Right(value: final error)) {
        if (error.statusCode == HttpStatus.conflict) {
          final snackBar = buildInfoSnackBar('errors.same_user_exists'.tr());
          ref.read(scaffoldMessengerProvider)?.showSnackBar(snackBar);
        } else {
          presentError(error);
        }
      }
    }
  }
}
