import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/widgets/mini_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum ExerciseCardType {
  a(Color.fromARGB(255, 148, 187, 195), Colors.white),
  b(Color.fromARGB(255, 147, 144, 144), Colors.white),
  c(Color.fromARGB(255, 229, 191, 41), Colors.white);

  const ExerciseCardType(
    this.backgroundColor,
    this.foregroundColor,
  );

  final Color backgroundColor;
  final Color foregroundColor;

  static ExerciseCardType fromId(int id) => switch (id % 3) {
        0 => ExerciseCardType.c,
        1 => ExerciseCardType.a,
        _ => ExerciseCardType.b,
      };
}

class ExerciseTemplateCard extends StatelessWidget {
  const ExerciseTemplateCard({
    super.key,
    required this.type,
    required this.exercise,
    this.onTap,
  });

  final ExerciseCardType type;
  final AsyncValue<ExerciseTemplate> exercise;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: !exercise.hasValue,
      child: Material(
        color: type.backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          child: exercise.hasValue
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 22.0,
                  ),
                  child: _buildContent(exercise.valueOrNull!, context),
                )
              : const Bone(height: 113.0),
        ),
      ),
    );
  }

  Widget _buildContent(ExerciseTemplate exercise, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                exercise.name,
                style: TextStyle(fontSize: 20.0, color: type.foregroundColor),
              ),
            ),
            if (exercise.muscle != null)
              SizedBox(
                width: 120.0,
                child: Text(
                  exercise.muscle!,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 16.0, color: type.foregroundColor),
                ),
              )
          ],
        ),
        const SizedBox(height: 12.0),
        Wrap(
          runSpacing: 4.0,
          spacing: 4.0,
          alignment: WrapAlignment.spaceBetween,
          children: [
            if (exercise.difficulty != null)
              MiniChip(
                icon: const Icon(Icons.star),
                text: Text(
                  exercise.difficulty!.translationKey,
                ).tr(),
                backgroundColor: Colors.transparent,
                foregroundColor: type.foregroundColor,
              ),
            if (exercise.equipment != null)
              MiniChip(
                icon: const Icon(Icons.fitness_center),
                text: Text(exercise.equipment!),
                backgroundColor: Colors.transparent,
                foregroundColor: type.foregroundColor,
              ),
            if (exercise.type != null)
              MiniChip(
                text: Text(exercise.type!.translationKey).tr(),
                backgroundColor: Colors.transparent,
                foregroundColor: type.foregroundColor,
              ),
          ],
        )
      ],
    );
  }
}
