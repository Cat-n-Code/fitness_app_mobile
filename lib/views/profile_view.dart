import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/radio_tile_style.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/auth.dart';
import 'package:fitness_app/providers/users.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fitness_app/widgets/customer_goals.dart';
import 'package:fitness_app/widgets/fields/exercise_preferences_field.dart';
import 'package:fitness_app/widgets/radio_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(context, ref),
      body: SingleChildScrollView(child: _buildBody(context, ref)),
      resizeToAvoidBottomInset: false,
    );
  }

  AppBar _buildAppBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text('profile_view.title').tr(),
      actions: [
        Tooltip(
          message: 'common.profile_edit_tooltip'.tr(context: context),
          child: IconButton(
            onPressed: () => context.push('/profile/edit'),
            icon: const Icon(Icons.edit),
          ),
        ),
        Tooltip(
          message: 'common.logout_tooltip'.tr(context: context),
          child: IconButton(
            onPressed: () => _onLogout(context, ref),
            icon: const Icon(Icons.logout),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final userValue = ref.watch(currentUserNotifierProvider);
    final user = userValue.valueOrNull?.toNullable() ?? User.mock();

    final customerValue = ref.watch(currentCustomerNotifierProvider);
    final customer = customerValue.valueOrNull?.toNullable() ?? Customer.mock();

    final coachValue = ref.watch(currentCoachNotifierProvider);
    final coach = coachValue.valueOrNull?.toNullable() ?? Coach.mock();

    return Skeletonizer(
      enabled: userValue.isLoading,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildUserCard(user, context, textTheme),
            const SizedBox(height: 16.0),
            if (user.role == Role.customer)
              Skeletonizer(
                enabled: customerValue.isLoading,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLevelCard(context, textTheme, colorScheme),
                    const SizedBox(height: 16.0),
                    Text(
                      'profile_view.goal_label',
                      style: textTheme.labelLarge,
                    ).tr(),
                    const SizedBox(height: 4.0),
                    _buildUserGoalField(customer, context, ref),
                    const SizedBox(height: 16.0),
                    Text(
                      'profile_view.fitness_level_label',
                      style: textTheme.labelLarge,
                    ).tr(),
                    const SizedBox(height: 4.0),
                    _buildFitnessLevelChips(customer, ref),
                    const SizedBox(height: 16.0),
                    Text(
                      'profile_view.exercise_preference_label',
                      style: textTheme.labelLarge,
                    ).tr(),
                    const SizedBox(height: 4.0),
                    _buildExercisePreference(customer, ref),
                    const SizedBox(height: 16.0),
                    Text(
                      'profile_view.daily_goals_label',
                      style: primaryTitleTextStyle,
                    ).tr(),
                    const SizedBox(height: 4.0),
                    const CustomerGoals(editable: true)
                  ],
                ),
              ),
            if (user.role == Role.coach)
              Skeletonizer(
                enabled: coachValue.isLoading,
                child: _buildSpecialty(coach, context, ref),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildUserCard(User user, BuildContext context, TextTheme textTheme) {
    final dateFormat = DateFormat.yMMMd(context.locale.toLanguageTag());
    final textStyle = textTheme.bodyMedium!.copyWith(color: darkColor);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(backgroundImage: user.photo, radius: 48.0),
        const SizedBox(width: 24.0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(user.name, style: textTheme.titleLarge),
              const SizedBox(height: 8.0),
              Skeleton.unite(
                child: Row(
                  children: [
                    const Icon(Icons.email, size: 20.0, color: darkColor),
                    Text(' ${user.email}', style: textStyle),
                  ],
                ),
              ),
              if (user.birthDate != null) ...[
                const SizedBox(height: 8.0),
                Skeleton.unite(
                  child: Row(
                    children: [
                      const Icon(Icons.cake, size: 20.0, color: darkColor),
                      Text(
                        ' ${dateFormat.format(user.birthDate!)}',
                        style: textStyle,
                      )
                    ],
                  ),
                )
              ],
              const SizedBox(height: 8.0),
              Skeleton.unite(
                child: Row(
                  children: [
                    const Icon(Icons.bolt, size: 20.0, color: darkColor),
                    Text(
                      ' ${'common.points_value'.tr(
                        context: context,
                        args: ['197'],
                      )}',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildLevelCard(
    BuildContext context,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  MarkdownBody(
                    data: 'profile_view.motivation_text'.tr(
                      context: context,
                      args: ['300', '4'],
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  OutlinedButton(
                    style: tertiaryOutlinedButton,
                    onPressed: () => (),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.local_fire_department_outlined),
                        const Text('profile_view.streaks_button')
                            .tr(args: ['25'])
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 48.0),
          _buildLevelProgress(textTheme, colorScheme),
        ],
      ),
    );
  }

  Widget _buildLevelProgress(TextTheme textTheme, ColorScheme colorScheme) {
    return SizedBox(
      width: 100.0,
      height: 100.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '3',
                style: textTheme.bodyLarge!.copyWith(
                  fontSize: 36.0,
                  fontWeight: FontWeight.w700,
                  height: 0.8,
                  color: colorScheme.primary,
                ),
              ),
              Text(
                'common.level',
                style: textTheme.bodyMedium!.copyWith(color: darkColor),
              ).tr()
            ],
          ),
          CircularProgressIndicator(
            value: 0.3,
            color: colorScheme.primary,
            backgroundColor: colorScheme.surfaceDim,
            strokeCap: StrokeCap.round,
            strokeWidth: 8.0,
            strokeAlign: -1.0,
          ),
        ],
      ),
    );
  }

  Widget _buildFitnessLevelChips(Customer customer, WidgetRef ref) {
    final tileStyle = primaryRadioTileStyle.copyWith(
      selectedColor: primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      textStyle: darkTextStyle.copyWith(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      ),
      selectedTextStyle: darkTextStyle.copyWith(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      ),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: FitnessLevel.values.indexed
          .map((t) => Skeleton.leaf(
                child: SizedBox(
                  width: 61.0,
                  height: 53.0,
                  child: RadioTile(
                    style: tileStyle as RadioTileStyle,
                    value: t.$2,
                    addRadio: false,
                    groupValue: customer.level,
                    onChanged: (level) async {
                      final notifier = ref.read(
                        currentCustomerNotifierProvider.notifier,
                      );
                      final result = await notifier.updateCustomer(
                        customer.copyWith(
                          level: customer.level != level ? level : null,
                        ),
                      );
                      if (result case Right(value: final error)) {
                        presentError(error, widgetRef: ref);
                      }
                    },
                    child: Text(
                      '${t.$1 + 1}/${FitnessLevel.values.length}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildUserGoalField(
    Customer customer,
    BuildContext context,
    WidgetRef ref,
  ) {
    return DropdownMenu(
      initialSelection: customer.goal,
      inputDecorationTheme: outlinedPrimaryInputDecoration,
      expandedInsets: EdgeInsets.zero,
      dropdownMenuEntries: UserGoal.values
          .map(
            (goal) => DropdownMenuEntry(
              value: goal,
              label: goal.translationKey.tr(context: context),
            ),
          )
          .toList(),
      onSelected: (goal) async {
        final notifier = ref.read(
          currentCustomerNotifierProvider.notifier,
        );
        final result = await notifier.updateCustomer(
          customer.copyWith(goal: goal),
        );
        if (result case Right(value: final error)) {
          presentError(error, widgetRef: ref);
        }
      },
    );
  }

  Widget _buildExercisePreference(Customer customer, WidgetRef ref) {
    return ExercisePreferencesField(
      preference: customer.preference,
      onValueChanged: (preference) async {
        final notifier = ref.read(
          currentCustomerNotifierProvider.notifier,
        );
        final result = await notifier.updateCustomer(
          customer.copyWith(
            preference: customer.preference != preference ? preference : null,
          ),
        );
        if (result case Right(value: final error)) {
          presentError(error, widgetRef: ref);
        }
      },
    );
  }

  Widget _buildSpecialty(Coach coach, BuildContext context, WidgetRef ref) {
    return DropdownMenu(
      initialSelection: coach.speciality,
      inputDecorationTheme: outlinedPrimaryInputDecoration,
      expandedInsets: EdgeInsets.zero,
      dropdownMenuEntries: CoachSpecialty.values
          .map(
            (specialty) => DropdownMenuEntry(
              value: specialty,
              label: specialty.translationKey.tr(context: context),
            ),
          )
          .toList(),
      onSelected: (specialty) async {
        if (specialty == null) {
          return;
        }

        final notifier = ref.read(
          currentCoachNotifierProvider.notifier,
        );
        final result = await notifier.updateCoach(
          coach.copyWith(speciality: specialty),
        );
        if (result case Right(value: final error)) {
          presentError(error, widgetRef: ref);
        }
      },
    );
  }

  void _onLogout(BuildContext context, WidgetRef ref) async {
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        // icon: const Icon(Icons.logout),
        title: const Text('common.logout_dialog_title').tr(),
        content: const Text('common.logout_dialog_body').tr(),
        actions: [
          TextButton(
            onPressed: () => context.pop(false),
            child: const Text('common.dialog_no').tr(),
          ),
          TextButton(
            onPressed: () => context.pop(true),
            child: const Text('common.dialog_yes').tr(),
          ),
        ],
      ),
    ) as bool?;

    if (result != null && result && context.mounted) {
      context.go('/startup');
      final auth = ref.read(authTokenNotifierProvider.notifier);
      await auth.resetToken();
    }
  }
}
