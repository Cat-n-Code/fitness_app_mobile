import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/providers/workouts.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/cards/workout_card.dart';
import 'package:fitness_app/widgets/mini_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WorkoutView extends ConsumerWidget {
  const WorkoutView({super.key, required this.workoutId});

  static const double cardHeight = 440.0;

  final int workoutId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutValue = ref.watch(workoutNotifierProvider(workoutId));

    return Scaffold(
      appBar: _buildAppBar(),
      body: Skeletonizer(
        enabled: !workoutValue.hasValue,
        child: SingleChildScrollView(child: _buildBody(workoutValue, context)),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  AppBar _buildAppBar() {
    return AppBar();
  }

  Widget _buildBody(
    AsyncValue<Option<Workout>> workoutValue,
    BuildContext context,
  ) {
    final theme = Theme.of(context);
    final workout = workoutValue.valueOrNull?.toNullable() ?? Workout.mock();
    final cardType = WorkoutCardType.fromId(workout.id!);

    return Column(
      children: [
        _buildCard(workout, cardType, theme.textTheme),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 16.0, 30.0, 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildChips(workout, context),
              const SizedBox(height: 16.0),
              _buildDetails(workout, theme.textTheme, theme.colorScheme),
              const SizedBox(height: 16.0),
              if (workout.coachId != null)
                FilledButton(
                  onPressed: () => context.push(
                    '/workout/${workout.id!}/exercises',
                  ),
                  child: const Text('common.start_button').tr(),
                ),
              if (workout.chatId != null) ...[
                const SizedBox(height: 16.0),
                OutlinedButton(
                  onPressed: () => context.push(
                    '/chat?chatId=${workout.chatId!}',
                  ),
                  style: onBackgroundButton,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('workout_view.chat_button').tr(),
                      const Icon(Icons.forum_outlined)
                    ],
                  ),
                ),
              ],
            ],
          ),
        )
      ],
    );
  }

  Widget _buildChips(Workout workout, BuildContext context) {
    final locale = EasyLocalization.of(context)!.locale;
    final dateFormat = DateFormat.MMMd(locale.toLanguageTag()).add_jm();

    return Wrap(
      runSpacing: 8.0,
      spacing: 8.0,
      children: [
        if (workout.type != null)
          MiniChip(
            icon: const Icon(Icons.location_on),
            text: Text(workout.type!.translationKey.tr()),
            backgroundColor: Colors.transparent,
            foregroundColor: darkColor,
          ),
        if (workout.startTime != null)
          MiniChip(
            icon: const Icon(Icons.event),
            text: Text(dateFormat.format(workout.startTime!)),
            backgroundColor: Colors.transparent,
            foregroundColor: darkColor,
          ),
        MiniChip(
          icon: const Icon(Icons.directions_run),
          text: const Text('workout_view.exercise_count_value').tr(
            args: [workout.exercises.length.toString()],
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: darkColor,
        ),
      ],
    );
  }

  Widget _buildCard(
    Workout workout,
    WorkoutCardType cardType,
    TextTheme textTheme,
  ) {
    return Skeleton.leaf(
      child: SizedBox(
        width: double.infinity,
        height: cardHeight,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(color: cardType.backgroundColor),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(45.0, 32.0, 45.0, 0.0),
                    child: Text(
                      workout.name,
                      style: TextStyle(
                        color: cardType.foregroundColor,
                        fontSize: 32.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: cardHeight * 0.8,
                  child: Image.asset(
                    cardType.backgroundImage,
                    alignment: Alignment.bottomRight,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetails(
    Workout workout,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    final exerciseMap = workout.sortedExercises;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('workout_view.details_title', style: textTheme.titleLarge).tr(),
        const SizedBox(height: 8.0),
        Skeleton.leaf(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: colorScheme.surfaceContainerHigh,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: exerciseMap.entries.map((t) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      t.key.translationKey,
                      style: textTheme.titleMedium?.copyWith(),
                    ).tr(),
                    const SizedBox(height: 8.0),
                    ...t.value.indexed.map(
                        (t) => Text('${t.$1 + 1}. ${t.$2.exercise!.name}')),
                    const SizedBox(height: 16.0),
                  ],
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
