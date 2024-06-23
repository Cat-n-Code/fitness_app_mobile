import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary.freezed.dart';
part 'diary.g.dart';

enum DiaryMood {
  @JsonValue('ANGRY')
  angry('common.moods.angry', 'assets/images/moods/angry.png'),
  @JsonValue('SAD')
  sad('common.moods.sad', 'assets/images/moods/sad.png'),
  @JsonValue('NEUTRAL')
  neutral('common.moods.neutral', 'assets/images/moods/neutral.png'),
  @JsonValue('CALM')
  calm('common.moods.calm', 'assets/images/moods/calm.png'),
  @JsonValue('EXCITED')
  excited('common.moods.excited', 'assets/images/moods/excited.png');

  const DiaryMood(this.translationKey, this.iconAsset);

  final String translationKey;
  final String iconAsset;
}

enum DiaryMoodReason {
  @JsonValue('FAMILY')
  family('common.mood_reasons.family'),
  @JsonValue('SELF_ESTEEM')
  selfEsteem('common.mood_reasons.self_esteem'),
  @JsonValue('WORK')
  work('common.mood_reasons.work'),
  @JsonValue('WEATHER')
  weather('common.mood_reasons.weather'),
  @JsonValue('SLEEP')
  sleep('common.mood_reasons.sleep'),
  @JsonValue('FOOD')
  food('common.mood_reasons.food'),
  @JsonValue('SOCIAL')
  social('common.mood_reasons.social');

  const DiaryMoodReason(this.translationKey);

  final String translationKey;
}

@freezed
class DiaryEntry with _$DiaryEntry {
  const factory DiaryEntry({
    required DiaryMood feeling,
    DiaryMoodReason? reason,
    @Default('') String note,
    @JsonKey(name: 'file_entity_id') int? voiceRecordId,
  }) = _DiaryEntry;

  factory DiaryEntry.fromJson(Map<String, Object?> json) =>
      _$DiaryEntryFromJson(json);
}
