import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

@freezed
class ExerciseTemplate with _$ExerciseTemplate {
  const factory ExerciseTemplate({
    int? id,
    required String name,
    required String muscle,
    required String additionalMuscle,
    required String type,
    required String equipment,
    required String difficulty,
    required List<String> photosUrls,
  }) = _ExerciseTemplate;

  factory ExerciseTemplate.fromJson(Map<String, Object?> json) =>
      _$ExerciseTemplateFromJson(json);

  factory ExerciseTemplate.mock() => ExerciseTemplate(
        name: BoneMock.words(1),
        muscle: BoneMock.words(1),
        additionalMuscle: BoneMock.words(1),
        type: BoneMock.words(1),
        equipment: BoneMock.words(1),
        difficulty: BoneMock.words(1),
        photosUrls: [],
      );
}

@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    int? id,
    required ExerciseTemplate template,
    required int setsCount,
    required int goalSetsCount,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, Object?> json) =>
      _$ExerciseFromJson(json);

  factory Exercise.mock() => Exercise(
        template: ExerciseTemplate.mock(),
        setsCount: 3,
        goalSetsCount: 10,
      );
}

@freezed
class WorkoutTemplate with _$WorkoutTemplate {
  const factory WorkoutTemplate({
    int? id,
    required String name,
    required String description,
    required List<ExerciseTemplate> exercises,
  }) = _WorkoutTemplate;

  factory WorkoutTemplate.fromJson(Map<String, Object?> json) =>
      _$WorkoutTemplateFromJson(json);

  factory WorkoutTemplate.mock() => WorkoutTemplate(
        name: BoneMock.words(2),
        description: BoneMock.words(3),
        exercises: [
          ExerciseTemplate.mock(),
          ExerciseTemplate.mock(),
          ExerciseTemplate.mock(),
        ],
      );
}

@freezed
class Workout with _$Workout {
  const Workout._();

  const factory Workout({
    int? id,
    required WorkoutTemplate template,
    required List<Exercise> exercises,
    required DateTime completionDate,
  }) = _Workout;

  factory Workout.fromJson(Map<String, Object?> json) =>
      _$WorkoutFromJson(json);

  factory Workout.mock() => Workout(
        template: WorkoutTemplate.mock(),
        exercises: [
          Exercise.mock(),
          Exercise.mock(),
          Exercise.mock(),
        ],
        completionDate: DateTime.now(),
      );

  double get progress {
    if (exercises.isEmpty) {
      return 0;
    }

    final n = exercises
        .map((e) => e.setsCount)
        .reduce((value, element) => value + element);
    final m = exercises
        .map((e) => e.goalSetsCount)
        .reduce((value, element) => value + element);
    return n.toDouble() / m;
  }
}
