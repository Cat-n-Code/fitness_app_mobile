import 'package:fitness_app/widgets/lists/exercises_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoachExercisesView extends StatelessWidget {
  const CoachExercisesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildBody(BuildContext context) {
    return ExercisesList(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      hasAddButton: true,
      onTap: (exercise) => context.push(
        '/exercise_template?id=${exercise.id}',
      ),
      onAddTap: () => context.push('/exercise_template'),
    );
  }
}
