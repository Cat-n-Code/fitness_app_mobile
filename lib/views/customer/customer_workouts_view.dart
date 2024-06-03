import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/widgets/workout_card.dart';
import 'package:flutter/material.dart';

class CustomerWorkoutsView extends StatelessWidget {
  const CustomerWorkoutsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14.0,
            vertical: 8.0,
          ),
          child: WorkoutCard(onTap: () => ()),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('customer_workouts_view.title').tr(),
    );
  }
}
