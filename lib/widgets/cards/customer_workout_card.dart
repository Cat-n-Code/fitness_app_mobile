import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/mini_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomerWorkoutCard extends StatefulWidget {
  const CustomerWorkoutCard({
    super.key,
    required this.workout,
  });

  final AsyncValue<Workout> workout;

  @override
  State<CustomerWorkoutCard> createState() => _CustomerWorkoutCardState();
}

class _CustomerWorkoutCardState extends State<CustomerWorkoutCard> {
  bool _areDetailsShowed = false;

  @override
  Widget build(BuildContext context) {
    final workout = this.widget.workout.valueOrNull ?? Workout.mock();

    return Skeletonizer(
      enabled: !this.widget.workout.hasValue,
      child: Skeleton.leaf(
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          clipBehavior: Clip.hardEdge,
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 22.0, 16.0, 14.0),
            child: _buildBody(workout, context),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(Workout workout, BuildContext context) {
    final locale = EasyLocalization.of(context)!.locale;
    final dateFormat = DateFormat.MMMd(locale.toLanguageTag()).add_jm();

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(workout.name, style: textTheme.titleLarge)),
            Tooltip(
              message: 'customer_workout_card.edit_tooltip'.tr(),
              child: IconButton(
                onPressed: () => context.push('/workout/${workout.id}/edit'),
                icon: const Icon(Icons.edit),
              ),
            )
          ],
        ),
        const SizedBox(height: 12.0),
        Wrap(
          runSpacing: 4.0,
          spacing: 4.0,
          alignment: WrapAlignment.spaceBetween,
          children: [
            if (workout.type != null)
              MiniChip(
                icon: const Icon(Icons.star),
                text: Text(workout.type!.translationKey).tr(),
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
          ],
        ),
        const SizedBox(height: 12.0),
        TextButton(
          onPressed: () => setState(
            () => _areDetailsShowed = !_areDetailsShowed,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _areDetailsShowed
                    ? 'customer_workout_card.hide_details_button'
                    : 'customer_workout_card.show_details_button',
              ).tr(),
              Icon(
                _areDetailsShowed ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              ),
            ],
          ),
        ),
        if (_areDetailsShowed) _buildDetails(workout, textTheme, colorScheme),
      ],
    );
  }

  Widget _buildDetails(
    Workout workout,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    final exercises = workout.sortedExercises;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'customer_workout_card.total_percentage',
                style: textTheme.titleMedium,
              ).tr(),
            ),
            Text(
              '${(workout.progress * 100.0).toStringAsFixed(0)}%',
              style: textTheme.titleMedium!.copyWith(
                color: colorScheme.primary,
              ),
            )
          ],
        ),
        for (var stage in ExerciseStage.values) ...[
          const SizedBox(height: 16.0),
          Text(stage.translationKey, style: textTheme.titleMedium).tr(),
          for (var exercise in exercises[stage]!) ...[
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: darkColor, width: 1.0),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  Expanded(child: Text(exercise.exercise!.name)),
                  Text(
                    '${(exercise.progress * 100.0).toStringAsFixed(0)}%',
                    style: TextStyle(color: colorScheme.primary),
                  )
                ],
              ),
            ),
          ]
        ],
        const SizedBox(height: 16.0),
        OutlinedButton(
          onPressed: () => context.push('/chat?chatId=${workout.chatId!}'),
          style: darkOutlinedButton,
          child: Row(
            children: [
              Expanded(
                child: const Text('customer_workout_card.chat_button').tr(),
              ),
              const Icon(Icons.forum),
            ],
          ),
        )
      ],
    );
  }
}
