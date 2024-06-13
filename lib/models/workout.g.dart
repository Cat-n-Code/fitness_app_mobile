// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoUploadImpl _$$PhotoUploadImplFromJson(Map<String, dynamic> json) =>
    _$PhotoUploadImpl(
      id: (json['id'] as num).toInt(),
      filename: json['filename'] as String,
    );

Map<String, dynamic> _$$PhotoUploadImplToJson(_$PhotoUploadImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
    };

_$ExerciseTemplateImpl _$$ExerciseTemplateImplFromJson(
        Map<String, dynamic> json) =>
    _$ExerciseTemplateImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      name: json['name'] as String,
      muscle: json['muscle'] as String?,
      additionalMuscle: json['additionalMuscle'] as String?,
      type: $enumDecodeNullable(_$ExerciseTypeEnumMap, json['type']),
      equipment: json['equipment'] as String?,
      difficulty:
          $enumDecodeNullable(_$ExerciseDifficultyEnumMap, json['difficulty']),
      description: json['description'] as String?,
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => PhotoUpload.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ExerciseTemplateImplToJson(
        _$ExerciseTemplateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'muscle': instance.muscle,
      'additionalMuscle': instance.additionalMuscle,
      'type': _$ExerciseTypeEnumMap[instance.type],
      'equipment': instance.equipment,
      'difficulty': _$ExerciseDifficultyEnumMap[instance.difficulty],
      'description': instance.description,
      'photos': instance.photos,
    };

const _$ExerciseTypeEnumMap = {
  ExerciseType.base: 'Базовое',
  ExerciseType.isolated: 'Изолирующее',
};

const _$ExerciseDifficultyEnumMap = {
  ExerciseDifficulty.beginner: 'Начинающий',
  ExerciseDifficulty.middle: 'Средний',
  ExerciseDifficulty.professional: 'Профессионал',
};

_$ExerciseImpl _$$ExerciseImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseImpl(
      id: (json['id'] as num?)?.toInt(),
      exerciseId: (json['exercise_id'] as num).toInt(),
      workoutId: (json['workout_id'] as num).toInt(),
      order: (json['num_order'] as num).toInt(),
      setsCount: (json['num_sets'] as num?)?.toInt(),
      setsDoneCount: (json['num_sets_done'] as num?)?.toInt(),
      repeatsCount: (json['num_reps'] as num?)?.toInt(),
      stage: $enumDecode(_$ExerciseStageEnumMap, json['stage']),
      exercise: json['exercise'] == null
          ? null
          : ExerciseTemplate.fromJson(json['exercise'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExerciseImplToJson(_$ExerciseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exercise_id': instance.exerciseId,
      'workout_id': instance.workoutId,
      'num_order': instance.order,
      'num_sets': instance.setsCount,
      'num_sets_done': instance.setsDoneCount,
      'num_reps': instance.repeatsCount,
      'stage': _$ExerciseStageEnumMap[instance.stage]!,
      'exercise': instance.exercise,
    };

const _$ExerciseStageEnumMap = {
  ExerciseStage.warmup: 'WARM_UP',
  ExerciseStage.main: 'MAIN',
  ExerciseStage.coolDown: 'COOL_DOWN',
};

_$WorkoutImpl _$$WorkoutImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutImpl(
      id: (json['id'] as num?)?.toInt(),
      coachId: (json['coach_id'] as num?)?.toInt(),
      customerId: (json['customer_id'] as num?)?.toInt(),
      chatId: (json['chat_id'] as num?)?.toInt(),
      name: json['name'] as String,
      type: $enumDecodeNullable(_$WorkoutTypeEnumMap, json['type_connection']),
      startTime: json['time_start'] == null
          ? null
          : DateTime.parse(json['time_start'] as String),
      exercises: (json['exercise_workouts'] as List<dynamic>?)
              ?.map((e) => Exercise.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$WorkoutImplToJson(_$WorkoutImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coach_id': instance.coachId,
      'customer_id': instance.customerId,
      'chat_id': instance.chatId,
      'name': instance.name,
      'type_connection': _$WorkoutTypeEnumMap[instance.type],
      'time_start': instance.startTime?.toIso8601String(),
      'exercise_workouts': instance.exercises,
    };

const _$WorkoutTypeEnumMap = {
  WorkoutType.online: 'ONLINE',
  WorkoutType.offline: 'OFFLINE',
};
