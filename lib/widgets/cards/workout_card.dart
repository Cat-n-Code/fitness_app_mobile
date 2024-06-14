import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/widgets/mini_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum WorkoutCardType {
  a(
    Color.fromARGB(255, 148, 187, 195),
    Colors.white,
    'assets/images/workouts/1.png',
  ),
  b(
    Color.fromARGB(255, 222, 234, 185),
    Color.fromARGB(255, 75, 71, 71),
    'assets/images/workouts/2.png',
  ),
  c(
    Color.fromARGB(255, 231, 231, 231),
    Color.fromARGB(255, 75, 71, 71),
    'assets/images/workouts/3.png',
  );

  const WorkoutCardType(
    this.backgroundColor,
    this.foregroundColor,
    this.backgroundImage,
  );

  final Color backgroundColor;
  final Color foregroundColor;
  final String backgroundImage;

  static WorkoutCardType fromId(int id) => switch (id % 3) {
        0 => WorkoutCardType.c,
        1 => WorkoutCardType.a,
        _ => WorkoutCardType.b,
      };
}

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    super.key,
    required this.type,
    required this.workout,
    required this.onTap,
  });

  static const defaultHeight = 160.0;

  final WorkoutCardType type;
  final AsyncValue<Workout> workout;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final workout = this.workout;

    return Skeletonizer(
      enabled: !workout.hasValue,
      child: SizedBox(
        height: defaultHeight,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          clipBehavior: Clip.hardEdge,
          child: workout.hasValue
              ? _buildBody(workout.asData!.value, context)
              : const Bone(),
        ),
      ),
    );
  }

  Widget _buildBody(Workout workout, BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(color: type.backgroundColor),
        Image.asset(type.backgroundImage, alignment: Alignment.centerRight),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 22.0),
          child: _buildContent(workout, context),
        ),
        Material(
          type: MaterialType.transparency,
          child: InkResponse(onTap: onTap, highlightShape: BoxShape.rectangle),
        )
      ],
    );
  }

  Widget _buildContent(Workout workout, BuildContext context) {
    final locale = EasyLocalization.of(context)!.locale;
    final dateFormat = DateFormat.MMMd(locale.toLanguageTag()).add_jm();

    return FractionallySizedBox(
      widthFactor: 0.7,
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            workout.name,
            style: TextStyle(fontSize: 20.0, color: type.foregroundColor),
          ),
          Wrap(
            runSpacing: 4.0,
            spacing: 4.0,
            children: [
              if (workout.type != null)
                MiniChip(
                  icon: const Icon(Icons.location_on),
                  text: Text(workout.type!.translationKey.tr()),
                  backgroundColor: Colors.transparent,
                  foregroundColor: type.foregroundColor,
                ),
              if (workout.startTime != null)
                MiniChip(
                  icon: const Icon(Icons.event),
                  text: Text(dateFormat.format(workout.startTime!)),
                  backgroundColor: Colors.transparent,
                  foregroundColor: type.foregroundColor,
                )
            ],
          )
        ],
      ),
    );
  }
}
