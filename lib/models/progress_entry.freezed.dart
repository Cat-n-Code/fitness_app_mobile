// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProgressEntry _$ProgressEntryFromJson(Map<String, dynamic> json) {
  return _ProgressEntry.fromJson(json);
}

/// @nodoc
mixin _$ProgressEntry {
  int get id => throw _privateConstructorUsedError;
  int get steps => throw _privateConstructorUsedError;
  double get waterVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_field')
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgressEntryCopyWith<ProgressEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressEntryCopyWith<$Res> {
  factory $ProgressEntryCopyWith(
          ProgressEntry value, $Res Function(ProgressEntry) then) =
      _$ProgressEntryCopyWithImpl<$Res, ProgressEntry>;
  @useResult
  $Res call(
      {int id,
      int steps,
      double waterVolume,
      @JsonKey(name: 'date_field') DateTime timestamp});
}

/// @nodoc
class _$ProgressEntryCopyWithImpl<$Res, $Val extends ProgressEntry>
    implements $ProgressEntryCopyWith<$Res> {
  _$ProgressEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? steps = null,
    Object? waterVolume = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      waterVolume: null == waterVolume
          ? _value.waterVolume
          : waterVolume // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgressEntryImplCopyWith<$Res>
    implements $ProgressEntryCopyWith<$Res> {
  factory _$$ProgressEntryImplCopyWith(
          _$ProgressEntryImpl value, $Res Function(_$ProgressEntryImpl) then) =
      __$$ProgressEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int steps,
      double waterVolume,
      @JsonKey(name: 'date_field') DateTime timestamp});
}

/// @nodoc
class __$$ProgressEntryImplCopyWithImpl<$Res>
    extends _$ProgressEntryCopyWithImpl<$Res, _$ProgressEntryImpl>
    implements _$$ProgressEntryImplCopyWith<$Res> {
  __$$ProgressEntryImplCopyWithImpl(
      _$ProgressEntryImpl _value, $Res Function(_$ProgressEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? steps = null,
    Object? waterVolume = null,
    Object? timestamp = null,
  }) {
    return _then(_$ProgressEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      waterVolume: null == waterVolume
          ? _value.waterVolume
          : waterVolume // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgressEntryImpl implements _ProgressEntry {
  const _$ProgressEntryImpl(
      {required this.id,
      required this.steps,
      this.waterVolume = 0.0,
      @JsonKey(name: 'date_field') required this.timestamp});

  factory _$ProgressEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgressEntryImplFromJson(json);

  @override
  final int id;
  @override
  final int steps;
  @override
  @JsonKey()
  final double waterVolume;
  @override
  @JsonKey(name: 'date_field')
  final DateTime timestamp;

  @override
  String toString() {
    return 'ProgressEntry(id: $id, steps: $steps, waterVolume: $waterVolume, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.waterVolume, waterVolume) ||
                other.waterVolume == waterVolume) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, steps, waterVolume, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressEntryImplCopyWith<_$ProgressEntryImpl> get copyWith =>
      __$$ProgressEntryImplCopyWithImpl<_$ProgressEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgressEntryImplToJson(
      this,
    );
  }
}

abstract class _ProgressEntry implements ProgressEntry {
  const factory _ProgressEntry(
          {required final int id,
          required final int steps,
          final double waterVolume,
          @JsonKey(name: 'date_field') required final DateTime timestamp}) =
      _$ProgressEntryImpl;

  factory _ProgressEntry.fromJson(Map<String, dynamic> json) =
      _$ProgressEntryImpl.fromJson;

  @override
  int get id;
  @override
  int get steps;
  @override
  double get waterVolume;
  @override
  @JsonKey(name: 'date_field')
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$ProgressEntryImplCopyWith<_$ProgressEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
