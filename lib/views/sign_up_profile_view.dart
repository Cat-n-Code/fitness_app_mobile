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
import 'package:fitness_app/widgets/fields/birth_date_field.dart';
import 'package:fitness_app/widgets/fields/exercise_preferences_field.dart';
import 'package:fitness_app/widgets/fields/fitness_level_field.dart';
import 'package:fitness_app/widgets/fields/sex_field.dart';
import 'package:fitness_app/widgets/fields/user_goal_field.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SignUpProfileView extends ConsumerStatefulWidget {
  const SignUpProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SignUpProfileViewState();
  }
}

class _SignUpProfileViewState extends ConsumerState<SignUpProfileView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 5,
      vsync: this,
      animationDuration: Durations.short2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      resizeToAvoidBottomInset: false,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: _onBackButtonPressed,
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _buildBody() {
    final colorScheme = Theme.of(context).colorScheme;
    final form = ref.watch(userRegistrationNotifierProvider);
    final notifier = ref.watch(userRegistrationNotifierProvider.notifier);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 96.0, 16.0, 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: _buildTabBarView(form, notifier)),
          const SizedBox(height: 24.0),
          Skeletonizer(
            enabled: _isLoading,
            child: _SignUpProfileBottomButtons(
              onSkipPressed: () => _onSkipPressed(),
              onContinuePressed: () => _onContinuePressed(),
            ),
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TabPageSelector(
                controller: _tabController,
                selectedColor: colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabBarView(
    UserRegistrationForm form,
    UserRegistrationNotifier notifier,
  ) {
    return TabBarView(
      controller: _tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _SignUpProfileTab(
          titleText: 'sign_up_profile_view.goal_title'.tr(context: context),
          body: UserGoalField(
            goal: form.goal,
            onValueChanged: (goal) => notifier.updateForm(
              form.copyWith(goal: goal),
            ),
          ),
        ),
        _SignUpProfileTab(
          titleText: 'sign_up_profile_view.sex_title'.tr(context: context),
          body: SexField(
            sex: form.sex,
            onValueChanged: (sex) => notifier.updateForm(
              form.copyWith(sex: sex),
            ),
          ),
        ),
        _SignUpProfileTab(
          titleText:
              'sign_up_profile_view.birth_date_title'.tr(context: context),
          body: BirthDateField(
            birthDate: form.birthDate,
            onValueChanged: (birthDate) => notifier.updateForm(
              form.copyWith(birthDate: birthDate),
            ),
          ),
        ),
        _SignUpProfileTab(
          titleText:
              'sign_up_profile_view.fitness_level_title'.tr(context: context),
          body: FitnessLevelField(
            fitnessLevel: form.level,
            onValueChanged: (level) => notifier.updateForm(
              form.copyWith(level: level),
            ),
          ),
        ),
        _SignUpProfileTab(
          titleText: 'sign_up_profile_view.exercise_preference_title'
              .tr(context: context),
          body: ExercisePreferencesField(
            preference: form.preference,
            onValueChanged: (preference) {
              if (!_isLoading) {
                notifier.updateForm(form.copyWith(preference: preference));
              }
            },
          ),
        ),
      ],
    );
  }

  void _onBackButtonPressed() {
    if (_isLoading) {
      return;
    }

    if (_tabController.index == 0) {
      context.pop();
    } else {
      _tabController.animateTo(_tabController.index - 1);
    }
  }

  void _onSkipPressed() {
    if (_isLoading) {
      return;
    }

    final form = ref.read(userRegistrationNotifierProvider);
    final notifier = ref.read(userRegistrationNotifierProvider.notifier);

    final UserRegistrationForm newForm;
    switch (_tabController.index) {
      case 0:
        newForm = form.copyWith(goal: null);
      case 1:
        newForm = form.copyWith(sex: null);
      case 2:
        newForm = form.copyWith(birthDate: null);
      case 3:
        newForm = form.copyWith(level: null);
      case 4:
        newForm = form.copyWith(preference: null);
      case _:
        newForm = form;
    }

    notifier.updateForm(newForm);

    if (_tabController.index == _tabController.length - 1) {
      _submitForm();
    } else {
      _tabController.animateTo(_tabController.index + 1);
    }
  }

  void _onContinuePressed() {
    if (_isLoading) {
      return;
    }

    if (_tabController.index == _tabController.length - 1) {
      _submitForm();
    } else {
      _tabController.animateTo(_tabController.index + 1);
    }
  }

  void _submitForm() async {
    setState(() => _isLoading = true);

    final notifier = ref.read(userRegistrationNotifierProvider.notifier);
    final result = await notifier.registerUser();

    setState(() => _isLoading = false);

    switch (result) {
      case Left():
        if (mounted) {
          context.go('/');
        }
      case Right(value: final exception):
        if (exception.statusCode == HttpStatus.conflict) {
          final snackBar = buildInfoSnackBar('errors.same_user_exists'.tr());
          ref.read(scaffoldMessengerProvider)?.showSnackBar(snackBar);
        } else {
          presentError(exception, widgetRef: ref);
          if (mounted) {
            context.go('/startup');
          }
        }
    }
  }
}

class _SignUpProfileTab extends StatelessWidget {
  const _SignUpProfileTab({
    required this.titleText,
    required this.body,
  });

  final String titleText;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          titleText,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge,
        ),
        Expanded(child: Center(child: body)),
      ],
    );
  }
}

class _SignUpProfileBottomButtons extends StatelessWidget {
  const _SignUpProfileBottomButtons({
    required this.onSkipPressed,
    required this.onContinuePressed,
  });

  final void Function() onSkipPressed;
  final void Function() onContinuePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Skeleton.leaf(
          child: OutlinedButton(
            onPressed: onSkipPressed,
            style: darkOutlinedButton,
            child: Text.rich(
              TextSpan(children: [
                TextSpan(text: 'common.skip_button'.tr(context: context)),
                const WidgetSpan(child: SizedBox(width: 8.0)),
                const WidgetSpan(child: Icon(Icons.arrow_forward))
              ]),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Skeleton.leaf(
          child: FilledButton(
            onPressed: onContinuePressed,
            style: darkButton,
            child: Text.rich(
              TextSpan(children: [
                TextSpan(text: 'common.continue_button'.tr(context: context)),
                const WidgetSpan(child: SizedBox(width: 8.0)),
                const WidgetSpan(child: Icon(Icons.arrow_forward))
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
