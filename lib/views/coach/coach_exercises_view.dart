import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CoachExercisesView extends StatelessWidget {
  const CoachExercisesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('coach_exercises_view.title').tr(),
      actions: [
        Tooltip(
          message: 'coach_exercises_view.add_exercise_tooltip'.tr(
            context: context,
          ),
          child: IconButton(onPressed: () => (), icon: const Icon(Icons.add)),
        )
      ],
    );
  }
}
