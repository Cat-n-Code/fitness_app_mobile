// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiaryEntryImpl _$$DiaryEntryImplFromJson(Map<String, dynamic> json) =>
    _$DiaryEntryImpl(
      feeling: $enumDecode(_$DiaryMoodEnumMap, json['feeling']),
      reason: $enumDecodeNullable(_$DiaryMoodReasonEnumMap, json['reason']),
      note: json['note'] as String? ?? '',
      voiceRecordId: (json['file_entity_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DiaryEntryImplToJson(_$DiaryEntryImpl instance) =>
    <String, dynamic>{
      'feeling': _$DiaryMoodEnumMap[instance.feeling]!,
      'reason': _$DiaryMoodReasonEnumMap[instance.reason],
      'note': instance.note,
      'file_entity_id': instance.voiceRecordId,
    };

const _$DiaryMoodEnumMap = {
  DiaryMood.angry: 'ANGRY',
  DiaryMood.sad: 'SAD',
  DiaryMood.neutral: 'NEUTRAL',
  DiaryMood.calm: 'CALM',
  DiaryMood.excited: 'EXCITED',
};

const _$DiaryMoodReasonEnumMap = {
  DiaryMoodReason.family: 'FAMILY',
  DiaryMoodReason.selfEsteem: 'SELF_ESTEEM',
  DiaryMoodReason.work: 'WORK',
  DiaryMoodReason.weather: 'WEATHER',
  DiaryMoodReason.sleep: 'SLEEP',
  DiaryMoodReason.food: 'FOOD',
  DiaryMoodReason.social: 'SOCIAL',
};
