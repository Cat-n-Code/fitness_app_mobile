// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiaryEntry _$DiaryEntryFromJson(Map<String, dynamic> json) {
  return _DiaryEntry.fromJson(json);
}

/// @nodoc
mixin _$DiaryEntry {
  DiaryMood get feeling => throw _privateConstructorUsedError;
  DiaryMoodReason? get reason => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_entity_id')
  int? get voiceRecordId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryEntryCopyWith<DiaryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryEntryCopyWith<$Res> {
  factory $DiaryEntryCopyWith(
          DiaryEntry value, $Res Function(DiaryEntry) then) =
      _$DiaryEntryCopyWithImpl<$Res, DiaryEntry>;
  @useResult
  $Res call(
      {DiaryMood feeling,
      DiaryMoodReason? reason,
      String note,
      @JsonKey(name: 'file_entity_id') int? voiceRecordId});
}

/// @nodoc
class _$DiaryEntryCopyWithImpl<$Res, $Val extends DiaryEntry>
    implements $DiaryEntryCopyWith<$Res> {
  _$DiaryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feeling = null,
    Object? reason = freezed,
    Object? note = null,
    Object? voiceRecordId = freezed,
  }) {
    return _then(_value.copyWith(
      feeling: null == feeling
          ? _value.feeling
          : feeling // ignore: cast_nullable_to_non_nullable
              as DiaryMood,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as DiaryMoodReason?,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      voiceRecordId: freezed == voiceRecordId
          ? _value.voiceRecordId
          : voiceRecordId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiaryEntryImplCopyWith<$Res>
    implements $DiaryEntryCopyWith<$Res> {
  factory _$$DiaryEntryImplCopyWith(
          _$DiaryEntryImpl value, $Res Function(_$DiaryEntryImpl) then) =
      __$$DiaryEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DiaryMood feeling,
      DiaryMoodReason? reason,
      String note,
      @JsonKey(name: 'file_entity_id') int? voiceRecordId});
}

/// @nodoc
class __$$DiaryEntryImplCopyWithImpl<$Res>
    extends _$DiaryEntryCopyWithImpl<$Res, _$DiaryEntryImpl>
    implements _$$DiaryEntryImplCopyWith<$Res> {
  __$$DiaryEntryImplCopyWithImpl(
      _$DiaryEntryImpl _value, $Res Function(_$DiaryEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feeling = null,
    Object? reason = freezed,
    Object? note = null,
    Object? voiceRecordId = freezed,
  }) {
    return _then(_$DiaryEntryImpl(
      feeling: null == feeling
          ? _value.feeling
          : feeling // ignore: cast_nullable_to_non_nullable
              as DiaryMood,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as DiaryMoodReason?,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      voiceRecordId: freezed == voiceRecordId
          ? _value.voiceRecordId
          : voiceRecordId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiaryEntryImpl implements _DiaryEntry {
  const _$DiaryEntryImpl(
      {required this.feeling,
      this.reason,
      this.note = '',
      @JsonKey(name: 'file_entity_id') this.voiceRecordId});

  factory _$DiaryEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiaryEntryImplFromJson(json);

  @override
  final DiaryMood feeling;
  @override
  final DiaryMoodReason? reason;
  @override
  @JsonKey()
  final String note;
  @override
  @JsonKey(name: 'file_entity_id')
  final int? voiceRecordId;

  @override
  String toString() {
    return 'DiaryEntry(feeling: $feeling, reason: $reason, note: $note, voiceRecordId: $voiceRecordId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiaryEntryImpl &&
            (identical(other.feeling, feeling) || other.feeling == feeling) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.voiceRecordId, voiceRecordId) ||
                other.voiceRecordId == voiceRecordId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, feeling, reason, note, voiceRecordId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiaryEntryImplCopyWith<_$DiaryEntryImpl> get copyWith =>
      __$$DiaryEntryImplCopyWithImpl<_$DiaryEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiaryEntryImplToJson(
      this,
    );
  }
}

abstract class _DiaryEntry implements DiaryEntry {
  const factory _DiaryEntry(
          {required final DiaryMood feeling,
          final DiaryMoodReason? reason,
          final String note,
          @JsonKey(name: 'file_entity_id') final int? voiceRecordId}) =
      _$DiaryEntryImpl;

  factory _DiaryEntry.fromJson(Map<String, dynamic> json) =
      _$DiaryEntryImpl.fromJson;

  @override
  DiaryMood get feeling;
  @override
  DiaryMoodReason? get reason;
  @override
  String get note;
  @override
  @JsonKey(name: 'file_entity_id')
  int? get voiceRecordId;
  @override
  @JsonKey(ignore: true)
  _$$DiaryEntryImplCopyWith<_$DiaryEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
