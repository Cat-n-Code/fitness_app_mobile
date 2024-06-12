// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgressEntryImpl _$$ProgressEntryImplFromJson(Map<String, dynamic> json) =>
    _$ProgressEntryImpl(
      id: (json['id'] as num).toInt(),
      steps: (json['steps'] as num).toInt(),
      waterVolume: (json['waterVolume'] as num?)?.toDouble() ?? 0.0,
      timestamp: DateTime.parse(json['date_field'] as String),
    );

Map<String, dynamic> _$$ProgressEntryImplToJson(_$ProgressEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'steps': instance.steps,
      'waterVolume': instance.waterVolume,
      'date_field': instance.timestamp.toIso8601String(),
    };
