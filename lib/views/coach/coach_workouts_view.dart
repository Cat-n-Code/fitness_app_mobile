import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CoachWorkoutsView extends StatelessWidget {
  const CoachWorkoutsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('coach_workouts_view.title').tr(),
      actions: [
        Tooltip(
          message: 'coach_workouts_view.add_workout_tooltip'.tr(
            context: context,
          ),
          child: IconButton(onPressed: () => (), icon: const Icon(Icons.add)),
        )
      ],
    );
  }
}
