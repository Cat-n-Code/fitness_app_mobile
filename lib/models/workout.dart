import 'dart:collection';

import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

enum ExerciseType {
  @JsonValue('Базовое')
  base('common.exercise_type.base'),
  @JsonValue('Изолирующее')
  isolated('common.exercise_type.isolated');

  const ExerciseType(this.translationKey);

  final String translationKey;
}

enum ExerciseDifficulty {
  @JsonValue('Начинающий')
  beginner('common.exercise_difficulty.beginner'),
  @JsonValue('Средний')
  middle('common.exercise_difficulty.middle'),
  @JsonValue('Профессионал')
  professional('common.exercise_difficulty.professional');

  const ExerciseDifficulty(this.translationKey);

  final String translationKey;
}

enum ExerciseStage {
  @JsonValue('WARM_UP')
  warmup('common.exercise_stage.warm_up'),
  @JsonValue('MAIN')
  main('common.exercise_stage.main'),
  @JsonValue('COOL_DOWN')
  coolDown('common.exercise_stage.cool_down');

  const ExerciseStage(this.translationKey);

  final String translationKey;
}

enum WorkoutType {
  @JsonValue('ONLINE')
  online('common.workout_type.online'),
  @JsonValue('OFFLINE')
  offline('common.workout_type.offline');

  const WorkoutType(this.translationKey);

  final String translationKey;
}

@freezed
class PhotoUpload with _$PhotoUpload {
  const factory PhotoUpload({
    required int id,
    required String filename,
    @JsonKey(name: 'full_url') required String url,
  }) = _PhotoUpload;

  factory PhotoUpload.fromJson(Map<String, Object?> json) =>
      _$PhotoUploadFromJson(json);
}

@freezed
class ExerciseTemplate with _$ExerciseTemplate {
  const factory ExerciseTemplate({
    int? id,
    @JsonKey(name: 'user_id') int? userId,
    required String name,
    String? muscle,
    String? additionalMuscle,
    ExerciseType? type,
    String? equipment,
    ExerciseDifficulty? difficulty,
    String? description,
    @Default([]) List<PhotoUpload> photos,
  }) = _ExerciseTemplate;

  factory ExerciseTemplate.fromJson(Map<String, Object?> json) =>
      _$ExerciseTemplateFromJson(json);

  factory ExerciseTemplate.mock() => ExerciseTemplate(
        id: 1,
        userId: 1,
        name: BoneMock.name,
        muscle: BoneMock.words(1),
        additionalMuscle: BoneMock.words(1),
        type: ExerciseType.base,
        equipment: BoneMock.words(3),
        difficulty: ExerciseDifficulty.beginner,
        description: '',
        photos: [],
      );
}

@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    int? id,
    @JsonKey(name: 'exercise_id') required int exerciseId,
    @JsonKey(name: 'workout_id') required int workoutId,
    @JsonKey(name: 'num_order') required int order,
    @JsonKey(name: 'num_sets') int? setsCount,
    @JsonKey(name: 'num_sets_done') int? setsDoneCount,
    @JsonKey(name: 'num_reps') int? repeatsCount,
    required ExerciseStage stage,
    ExerciseTemplate? exercise,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, Object?> json) =>
      _$ExerciseFromJson(json);

  factory Exercise.mock() => Exercise(
        id: 1,
        exerciseId: 1,
        workoutId: 1,
        order: 1,
        setsCount: 10,
        setsDoneCount: 4,
        repeatsCount: 1,
        stage: ExerciseStage.warmup,
        exercise: ExerciseTemplate.mock(),
      );
}

@freezed
class Workout with _$Workout {
  const Workout._();

  const factory Workout({
    int? id,
    @JsonKey(name: 'coach_id') int? coachId,
    @JsonKey(name: 'customer_id') int? customerId,
    @JsonKey(name: 'chat_id') int? chatId,
    required String name,
    @JsonKey(name: 'type_connection') WorkoutType? type,
    @JsonKey(name: 'time_start') DateTime? startTime,
    @Default([]) @JsonKey(name: 'exercise_workouts') List<Exercise> exercises,
  }) = _Workout;

  factory Workout.fromJson(Map<String, Object?> json) =>
      _$WorkoutFromJson(json);

  factory Workout.mock() => Workout(
        id: 0,
        coachId: 1,
        customerId: 1,
        chatId: 1,
        name: BoneMock.name,
        type: WorkoutType.online,
        startTime: DateTime.now(),
        exercises: [],
      );

  double get progress {
    if (exercises.isEmpty) {
      return 0.0;
    }

    var setsDone = 0;
    var totalSets = 0;
    for (var exercise in exercises) {
      if (exercise.setsDoneCount != null) {
        setsDone += exercise.setsDoneCount!;
      }

      if (exercise.setsCount != null) {
        totalSets += exercise.setsCount!;
      }
    }

    return setsDone / totalSets;
  }

  Map<ExerciseStage, List<Exercise>> get sortedExercises {
    final map = <ExerciseStage, List<Exercise>>{};

    for (var stage in ExerciseStage.values) {
      map[stage] = exercises
          .filter((e) => e.stage == stage)
          .sortWith((e) => e.order, Order.orderInt)
          .toList();
    }

    return map;
  }
}
