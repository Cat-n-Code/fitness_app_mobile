import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    super.key,
    required this.workout,
    required this.onTap,
  });

  static const defaultHeight = 150.0;

  final AsyncValue<Workout> workout;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final workout = this.workout;

    return Skeletonizer(
      enabled: workout.isLoading,
      child: SizedBox(
        height: defaultHeight,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          clipBehavior: Clip.hardEdge,
          child: !workout.isLoading
              ? _buildBody(workout.asData!.value, theme.textTheme)
              : const Bone(),
        ),
      ),
    );
  }

  Widget _buildBody(Workout workout, TextTheme textTheme) {
    final bodyMedium = textTheme.bodyMedium!.copyWith(
      color: workout.foregroundColor,
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(color: workout.backgroundColor),
        Image.asset(workout.backgroundAsset, alignment: Alignment.centerRight),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildContent(workout, bodyMedium, textTheme.titleMedium!),
        ),
        Material(
          type: MaterialType.transparency,
          child: InkResponse(onTap: onTap, highlightShape: BoxShape.rectangle),
        )
      ],
    );
  }

  Widget _buildContent(
    Workout workout,
    TextStyle textStyle,
    TextStyle titleMedium,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FractionallySizedBox(
          widthFactor: 0.7,
          child: Text(
            workout.title,
            style: titleMedium.copyWith(
              fontSize: 20.0,
              color: workout.foregroundColor,
            ),
          ),
        ),
        Text(workout.subtitle, style: textStyle),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildChip(
                workout,
                textStyle,
                Icons.timer_outlined,
                'workout_card.minutes_chip'.tr(
                  args: [workout.durationMinutes.toString()],
                ),
              ),
              const SizedBox(width: 4.0),
              _buildChip(
                workout,
                textStyle,
                Icons.bolt,
                'workout_card.points_chip'.tr(
                  args: [workout.pointsReward.toString()],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildChip(
    Workout workout,
    TextStyle textStyle,
    IconData icon,
    String content,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: workout.foregroundColor,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 12.0, 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: workout.foregroundColor),
          const SizedBox(width: 4.0),
          Text(content, style: textStyle)
        ],
      ),
    );
  }
}
