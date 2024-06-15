import 'package:fitness_app/widgets/lists/exercises_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CoachExercisesView extends ConsumerWidget {
  const CoachExercisesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: _buildBody(context, ref),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    return ExercisesList(
      hasAddButton: true,
      hasSearchInput: true,
      onTap: (exercise) => context.push(
        '/exercise_template/${exercise.id}/edit',
      ),
      onAddTap: () => context.push('/exercise_template/create'),
    );
  }
}
