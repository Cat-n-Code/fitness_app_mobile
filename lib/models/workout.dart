import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fitness_app/utils/json_converters.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

enum WorkoutType {
  @JsonValue('WEIGHTLIFT')
  weightlift('common.workout_type.weightlift', Icons.fitness_center),
  @JsonValue('YOGA')
  yoga('common.workout_type.yoga', Icons.self_improvement),
  @JsonValue('CARDIO')
  cardio('common.workout_type.cardio', Icons.monitor_heart_outlined),
  @JsonValue('JOGGING')
  jogging('common.workout_type.jogging', Icons.directions_run),
  @JsonValue('WALKING')
  walking('common.workout_type.walking', Icons.directions_walk),
  @JsonValue('OTHER')
  other('common.workout_type.other', Icons.settings);

  const WorkoutType(this.translationKey, this.icon);

  final String translationKey;
  final IconData icon;
}

enum WorkoutBodyPart {
  @JsonValue('UPPER_BODY')
  upperBody('common.workout_body_part.upperBody'),
  @JsonValue('LOWER_BODY')
  lowerBody('common.workout_body_part.lowerBody'),
  @JsonValue('FULL_BODY')
  fullBody('common.workout_body_part.fullBody'),
  @JsonValue('CORE')
  core('common.workout_body_part.core');

  const WorkoutBodyPart(this.translationKey);

  final String translationKey;
}

@freezed
class Workout with _$Workout {
  const Workout._();

  const factory Workout({
    required int id,
    required String title,
    required String subtitle,
    required WorkoutType type,
    required WorkoutBodyPart bodyPart,
    required int durationMinutes,
    required int pointsReward,
    required String backgroundAsset,
    @ColorConverter() required Color foregroundColor,
    @ColorConverter() required Color backgroundColor,
  }) = _Workout;

  factory Workout.fromJson(Map<String, Object?> json) =>
      _$WorkoutFromJson(json);
}
