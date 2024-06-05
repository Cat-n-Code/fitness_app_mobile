import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    int? id,
    required String name,
    required String muscle,
    required String additionalMuscle,
    required String type,
    required String equipment,
    required String difficulty,
    required List<String> photosUrls,
    required bool isCompleted,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, Object?> json) =>
      _$ExerciseFromJson(json);
}

@freezed
class Workout with _$Workout {
  const factory Workout({
    int? id,
    required String name,
    required String description,
    required DateTime completionDate,
    required List<Exercise> exercises,
  }) = _Workout;

  factory Workout.fromJson(Map<String, Object?> json) =>
      _$WorkoutFromJson(json);
}
