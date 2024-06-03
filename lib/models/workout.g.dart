// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutImpl _$$WorkoutImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      type: $enumDecode(_$WorkoutTypeEnumMap, json['type']),
      bodyPart: $enumDecode(_$WorkoutBodyPartEnumMap, json['bodyPart']),
      durationMinutes: (json['durationMinutes'] as num).toInt(),
      pointsReward: (json['pointsReward'] as num).toInt(),
      backgroundAsset: json['backgroundAsset'] as String,
      foregroundColor:
          const ColorConverter().fromJson(json['foregroundColor'] as String),
      backgroundColor:
          const ColorConverter().fromJson(json['backgroundColor'] as String),
    );

Map<String, dynamic> _$$WorkoutImplToJson(_$WorkoutImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'type': _$WorkoutTypeEnumMap[instance.type]!,
      'bodyPart': _$WorkoutBodyPartEnumMap[instance.bodyPart]!,
      'durationMinutes': instance.durationMinutes,
      'pointsReward': instance.pointsReward,
      'backgroundAsset': instance.backgroundAsset,
      'foregroundColor':
          const ColorConverter().toJson(instance.foregroundColor),
      'backgroundColor':
          const ColorConverter().toJson(instance.backgroundColor),
    };

const _$WorkoutTypeEnumMap = {
  WorkoutType.weightlift: 'WEIGHTLIFT',
  WorkoutType.yoga: 'YOGA',
  WorkoutType.cardio: 'CARDIO',
  WorkoutType.jogging: 'JOGGING',
  WorkoutType.walking: 'WALKING',
  WorkoutType.other: 'OTHER',
};

const _$WorkoutBodyPartEnumMap = {
  WorkoutBodyPart.upperBody: 'UPPER_BODY',
  WorkoutBodyPart.lowerBody: 'LOWER_BODY',
  WorkoutBodyPart.fullBody: 'FULL_BODY',
  WorkoutBodyPart.core: 'CORE',
};
