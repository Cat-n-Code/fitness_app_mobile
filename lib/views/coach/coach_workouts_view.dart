import 'package:fitness_app/widgets/lists/workouts_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoachWorkoutsView extends StatelessWidget {
  const CoachWorkoutsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WorkoutsList(
        hasAddButton: true,
        hasSearchInput: true,
        onTap: (workout) => context.push('/workout/${workout.id!}/edit'),
        onAddTap: () => context.push('/workout/create'),
      ),
    );
  }
}
