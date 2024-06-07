import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/mini_chip.dart';
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
    final workout = this.workout.valueOrNull ?? Workout.mock();

    return Skeletonizer(
      enabled: this.workout.isLoading,
      child: SizedBox(
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
      fit: StackFit.loose,
      children: [
        Positioned.fill(
          child: Material(
            color: colorScheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(20.0),
            elevation: 0.5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: _buildContent(workout, dateFormat, colorScheme, textTheme),
        ),
        Positioned.fill(
          child: Material(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(20.0),
            type: MaterialType.transparency,
            child:
                InkResponse(onTap: onTap, highlightShape: BoxShape.rectangle),
          ),
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
              const SizedBox(height: 8.0),
              MiniChip(
                icon: const Icon(Icons.event),
                text: Text(
                  dateFormat.format(workout.completionDate),
                ),
              ),
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
}
