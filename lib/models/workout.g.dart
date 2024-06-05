// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseTemplateImpl _$$ExerciseTemplateImplFromJson(
        Map<String, dynamic> json) =>
    _$ExerciseTemplateImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      muscle: json['muscle'] as String,
      additionalMuscle: json['additionalMuscle'] as String,
      type: json['type'] as String,
      equipment: json['equipment'] as String,
      difficulty: json['difficulty'] as String,
      photosUrls: (json['photosUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ExerciseTemplateImplToJson(
        _$ExerciseTemplateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'muscle': instance.muscle,
      'additionalMuscle': instance.additionalMuscle,
      'type': instance.type,
      'equipment': instance.equipment,
      'difficulty': instance.difficulty,
      'photosUrls': instance.photosUrls,
    };

_$ExerciseImpl _$$ExerciseImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseImpl(
      id: (json['id'] as num?)?.toInt(),
      template:
          ExerciseTemplate.fromJson(json['template'] as Map<String, dynamic>),
      setsCount: (json['setsCount'] as num).toInt(),
      goalSetsCount: (json['goalSetsCount'] as num).toInt(),
    );

Map<String, dynamic> _$$ExerciseImplToJson(_$ExerciseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'template': instance.template,
      'setsCount': instance.setsCount,
      'goalSetsCount': instance.goalSetsCount,
    };

_$WorkoutTemplateImpl _$$WorkoutTemplateImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutTemplateImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => ExerciseTemplate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkoutTemplateImplToJson(
        _$WorkoutTemplateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'exercises': instance.exercises,
    };

_$WorkoutImpl _$$WorkoutImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutImpl(
      id: (json['id'] as num?)?.toInt(),
      template:
          WorkoutTemplate.fromJson(json['template'] as Map<String, dynamic>),
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
      completionDate: DateTime.parse(json['completionDate'] as String),
    );

Map<String, dynamic> _$$WorkoutImplToJson(_$WorkoutImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'template': instance.template,
      'exercises': instance.exercises,
      'completionDate': instance.completionDate.toIso8601String(),
    };
