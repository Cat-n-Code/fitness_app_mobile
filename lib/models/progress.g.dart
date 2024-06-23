// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StepsEntryImpl _$$StepsEntryImplFromJson(Map<String, dynamic> json) =>
    _$StepsEntryImpl(
      steps: (json['steps'] as num).toInt(),
      goalSteps: (json['goal_steps'] as num?)?.toInt(),
      timestamp: DateTime.parse(json['date_field'] as String),
    );

Map<String, dynamic> _$$StepsEntryImplToJson(_$StepsEntryImpl instance) =>
    <String, dynamic>{
      'steps': instance.steps,
      'goal_steps': instance.goalSteps,
      'date_field': instance.timestamp.toIso8601String(),
    };

_$WaterEntryImpl _$$WaterEntryImplFromJson(Map<String, dynamic> json) =>
    _$WaterEntryImpl(
      waterVolume: (json['water_volume'] as num).toInt(),
      goalWaterVolume: (json['goal_water_volume'] as num?)?.toInt(),
      timestamp: DateTime.parse(json['date_field'] as String),
    );

Map<String, dynamic> _$$WaterEntryImplToJson(_$WaterEntryImpl instance) =>
    <String, dynamic>{
      'water_volume': instance.waterVolume,
      'goal_water_volume': instance.goalWaterVolume,
      'date_field': instance.timestamp.toIso8601String(),
    };
