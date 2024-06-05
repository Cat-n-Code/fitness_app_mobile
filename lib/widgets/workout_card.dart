import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key, required this.workout, this.onTap});

  static const defaultHeight = 110.0;

  final void Function()? onTap;
  final AsyncValue<Workout> workout;

  @override
  Widget build(BuildContext context) {
    final workout = this.workout.valueOrNull ??
        Workout(
          template: WorkoutTemplate(
            name: BoneMock.words(1),
            description: BoneMock.words(3),
            exercises: [],
          ),
          completionDate: DateTime.now(),
          exercises: [],
        );

    return Skeletonizer(
      enabled: this.workout.isLoading,
      child: SizedBox(
        height: defaultHeight,
        child: Skeleton.leaf(child: _buildBody(workout, context)),
      ),
    );
  }

  Widget _buildBody(Workout workout, BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final locale = EasyLocalization.of(context)!.locale;
    final dateFormat = DateFormat.MMMd(locale.toLanguageTag());

    return Stack(
      fit: StackFit.expand,
      children: [
        Material(
          color: colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(20.0),
          elevation: 0.5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: _buildContent(workout, dateFormat, colorScheme, textTheme),
        ),
        Material(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(20.0),
          type: MaterialType.transparency,
          child: InkResponse(onTap: onTap, highlightShape: BoxShape.rectangle),
        )
      ],
    );
  }

  Widget _buildContent(
    Workout workout,
    DateFormat dateFormat,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildProgress(workout, colorScheme, textTheme),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(workout.template.name, style: textTheme.titleMedium),
              Text(
                workout.template.description,
                style: textTheme.bodyMedium!.copyWith(
                  color: darkColor,
                ),
              ),
              const Expanded(child: SizedBox()),
              _buildChip(
                Icons.event,
                dateFormat.format(workout.completionDate),
                colorScheme,
                textTheme,
              )
            ],
          ),
        ),
        const SizedBox(width: 16.0),
        const Icon(Icons.chevron_right, color: darkColor)
      ],
    );
  }

  Widget _buildProgress(
    Workout workout,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    final progress = workout.progress;

    return SizedBox(
      width: 64.0,
      height: 64.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Text(
              '${(progress * 100.0).toStringAsFixed(0)}%',
              style: textTheme.bodyMedium!.copyWith(color: darkColor),
            ),
          ),
          CircularProgressIndicator(
            value: progress,
            strokeCap: StrokeCap.round,
            strokeWidth: 6.0,
            strokeAlign: -1.0,
            color: colorScheme.primary,
            // backgroundColor: darkColor.withAlpha(40),
          )
        ],
      ),
    );
  }

  Widget _buildChip(
    IconData icon,
    String content,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: colorScheme.primary,
      ),
      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 12.0, 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: darkColor),
          const SizedBox(width: 4.0),
          Text(content, style: textTheme.bodySmall)
        ],
      ),
    );
  }
}
