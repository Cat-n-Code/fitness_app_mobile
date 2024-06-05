// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseImpl _$$ExerciseImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseImpl(
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
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$$ExerciseImplToJson(_$ExerciseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'muscle': instance.muscle,
      'additionalMuscle': instance.additionalMuscle,
      'type': instance.type,
      'equipment': instance.equipment,
      'difficulty': instance.difficulty,
      'photosUrls': instance.photosUrls,
      'isCompleted': instance.isCompleted,
    };

_$WorkoutImpl _$$WorkoutImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      completionDate: DateTime.parse(json['completionDate'] as String),
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkoutImplToJson(_$WorkoutImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'completionDate': instance.completionDate.toIso8601String(),
      'exercises': instance.exercises,
    };
