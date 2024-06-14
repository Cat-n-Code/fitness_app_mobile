import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/providers/workouts.dart';
import 'package:fitness_app/widgets/cards/workout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutsList extends ConsumerWidget {
  const WorkoutsList({super.key, this.padding, this.header, this.onTap});

  static const pageSize = 10;

  final EdgeInsetsGeometry? padding;
  final Widget? header;
  final void Function(Workout)? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        ref.invalidate(myWorkoutsProvider);
        await ref.read(myWorkoutsProvider(0, pageSize).future);
      },
      child: ListView.builder(
        padding: padding,
        itemBuilder: (context, index) {
          if (header != null) {
            if (index == 0) {
              return header;
            } else {
              index--;
            }
          }

          final page = index ~/ pageSize;
          final pageIndex = index - page * pageSize;
          final workouts = ref.watch(myWorkoutsProvider(page, pageSize));
          final workout = workouts.map(
            data: (data) => pageIndex < data.value.length
                ? AsyncData(data.value[pageIndex])
                : null,
            error: (error) => AsyncError<Workout>(
              error.error,
              error.stackTrace,
            ),
            loading: (loading) => const AsyncLoading<Workout>(),
          );

          if (workout == null) {
            return null;
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: WorkoutCard(
              type: WorkoutCardType.fromId(workout.valueOrNull?.id ?? 0),
              workout: workout,
              onTap: () {
                if (onTap != null) {
                  onTap!(workout.valueOrNull!);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
