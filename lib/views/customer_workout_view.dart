import 'package:flutter/material.dart';

class CustomerWorkoutView extends StatelessWidget {
  const CustomerWorkoutView({super.key, required this.workoutId});

  final int workoutId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
    );
  }

  AppBar appBar() {
    return AppBar();
  }
}
