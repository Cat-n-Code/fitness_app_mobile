import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/radio_tile_style.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/auth.dart';
import 'package:fitness_app/providers/users.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fitness_app/widgets/fields/exercise_preferences_field.dart';
import 'package:fitness_app/widgets/radio_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomerProfileView extends ConsumerWidget {
  const CustomerProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(context, ref),
      body: _buildBody(context, ref),
      resizeToAvoidBottomInset: false,
    );
  }

  AppBar _buildAppBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text('customer_profile_view.title').tr(),
      actions: [
        Tooltip(
          message: 'common.profile_edit_tooltip'.tr(context: context),
          child: IconButton(
            onPressed: () => context.push('/customer/profile/edit'),
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
    final user = userValue.valueOrNull?.toNullable() ??
        User(
          id: 1,
          name: BoneMock.name,
          email: BoneMock.email,
        );

    return Skeletonizer(
      enabled: userValue.isLoading,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildUserCard(user, context, textTheme),
            const SizedBox(height: 16.0),
            Text(
              'customer_profile_view.goal_label',
              style: textTheme.labelLarge,
            ).tr(),
            const SizedBox(height: 4.0),
            _buildUserGoalField(user, context, ref),
            const SizedBox(height: 16.0),
            Text(
              'customer_profile_view.fitness_level_label',
              style: textTheme.labelLarge,
            ).tr(),
            const SizedBox(height: 4.0),
            _buildFitnessLevelChips(user, ref),
            const SizedBox(height: 16.0),
            Text(
              'customer_profile_view.exercise_preference_label',
              style: textTheme.labelLarge,
            ).tr(),
            const SizedBox(height: 4.0),
            _buildExercisePreference(user, ref),
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
            ],
          ),
        )
      ],
    );
  }

  Widget _buildFitnessLevelChips(User user, WidgetRef ref) {
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
                    groupValue: user.level,
                    onChanged: (level) async {
                      final notifier = ref.read(
                        currentUserNotifierProvider.notifier,
                      );
                      final result = await notifier.updateUser(
                        user.copyWith(
                          level: user.level != level ? level : null,
                        ),
                      );
                      if (result case Right(value: final error)) {
                        presentError(error);
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

  Widget _buildUserGoalField(User user, BuildContext context, WidgetRef ref) {
    return DropdownMenu(
      initialSelection: user.goal,
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
          currentUserNotifierProvider.notifier,
        );
        final result = await notifier.updateUser(
          user.copyWith(goal: goal),
        );
        if (result case Right(value: final error)) {
          presentError(error);
        }
      },
    );
  }

  Widget _buildExercisePreference(User user, WidgetRef ref) {
    return ExercisePreferencesField(
      preference: user.preference,
      onValueChanged: (preference) async {
        final notifier = ref.read(
          currentUserNotifierProvider.notifier,
        );
        final result = await notifier.updateUser(
          user.copyWith(
            preference: user.preference != preference ? preference : null,
          ),
        );
        if (result case Right(value: final error)) {
          presentError(error);
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
