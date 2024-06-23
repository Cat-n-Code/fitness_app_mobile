// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StepsEntry _$StepsEntryFromJson(Map<String, dynamic> json) {
  return _StepsEntry.fromJson(json);
}

/// @nodoc
mixin _$StepsEntry {
  int get steps => throw _privateConstructorUsedError;
  @JsonKey(name: 'goal_steps')
  int? get goalSteps => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_field')
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepsEntryCopyWith<StepsEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepsEntryCopyWith<$Res> {
  factory $StepsEntryCopyWith(
          StepsEntry value, $Res Function(StepsEntry) then) =
      _$StepsEntryCopyWithImpl<$Res, StepsEntry>;
  @useResult
  $Res call(
      {int steps,
      @JsonKey(name: 'goal_steps') int? goalSteps,
      @JsonKey(name: 'date_field') DateTime timestamp});
}

/// @nodoc
class _$StepsEntryCopyWithImpl<$Res, $Val extends StepsEntry>
    implements $StepsEntryCopyWith<$Res> {
  _$StepsEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? goalSteps = freezed,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      goalSteps: freezed == goalSteps
          ? _value.goalSteps
          : goalSteps // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StepsEntryImplCopyWith<$Res>
    implements $StepsEntryCopyWith<$Res> {
  factory _$$StepsEntryImplCopyWith(
          _$StepsEntryImpl value, $Res Function(_$StepsEntryImpl) then) =
      __$$StepsEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int steps,
      @JsonKey(name: 'goal_steps') int? goalSteps,
      @JsonKey(name: 'date_field') DateTime timestamp});
}

/// @nodoc
class __$$StepsEntryImplCopyWithImpl<$Res>
    extends _$StepsEntryCopyWithImpl<$Res, _$StepsEntryImpl>
    implements _$$StepsEntryImplCopyWith<$Res> {
  __$$StepsEntryImplCopyWithImpl(
      _$StepsEntryImpl _value, $Res Function(_$StepsEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? goalSteps = freezed,
    Object? timestamp = null,
  }) {
    return _then(_$StepsEntryImpl(
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      goalSteps: freezed == goalSteps
          ? _value.goalSteps
          : goalSteps // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StepsEntryImpl extends _StepsEntry {
  const _$StepsEntryImpl(
      {required this.steps,
      @JsonKey(name: 'goal_steps') this.goalSteps,
      @JsonKey(name: 'date_field') required this.timestamp})
      : super._();

  factory _$StepsEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$StepsEntryImplFromJson(json);

  @override
  final int steps;
  @override
  @JsonKey(name: 'goal_steps')
  final int? goalSteps;
  @override
  @JsonKey(name: 'date_field')
  final DateTime timestamp;

  @override
  String toString() {
    return 'StepsEntry(steps: $steps, goalSteps: $goalSteps, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepsEntryImpl &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.goalSteps, goalSteps) ||
                other.goalSteps == goalSteps) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, steps, goalSteps, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StepsEntryImplCopyWith<_$StepsEntryImpl> get copyWith =>
      __$$StepsEntryImplCopyWithImpl<_$StepsEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StepsEntryImplToJson(
      this,
    );
  }
}

abstract class _StepsEntry extends StepsEntry {
  const factory _StepsEntry(
          {required final int steps,
          @JsonKey(name: 'goal_steps') final int? goalSteps,
          @JsonKey(name: 'date_field') required final DateTime timestamp}) =
      _$StepsEntryImpl;
  const _StepsEntry._() : super._();

  factory _StepsEntry.fromJson(Map<String, dynamic> json) =
      _$StepsEntryImpl.fromJson;

  @override
  int get steps;
  @override
  @JsonKey(name: 'goal_steps')
  int? get goalSteps;
  @override
  @JsonKey(name: 'date_field')
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$StepsEntryImplCopyWith<_$StepsEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WaterEntry _$WaterEntryFromJson(Map<String, dynamic> json) {
  return _WaterEntry.fromJson(json);
}

/// @nodoc
mixin _$WaterEntry {
  @JsonKey(name: 'water_volume')
  int get waterVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'goal_water_volume')
  int? get goalWaterVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_field')
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WaterEntryCopyWith<WaterEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaterEntryCopyWith<$Res> {
  factory $WaterEntryCopyWith(
          WaterEntry value, $Res Function(WaterEntry) then) =
      _$WaterEntryCopyWithImpl<$Res, WaterEntry>;
  @useResult
  $Res call(
      {@JsonKey(name: 'water_volume') int waterVolume,
      @JsonKey(name: 'goal_water_volume') int? goalWaterVolume,
      @JsonKey(name: 'date_field') DateTime timestamp});
}

/// @nodoc
class _$WaterEntryCopyWithImpl<$Res, $Val extends WaterEntry>
    implements $WaterEntryCopyWith<$Res> {
  _$WaterEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? waterVolume = null,
    Object? goalWaterVolume = freezed,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      waterVolume: null == waterVolume
          ? _value.waterVolume
          : waterVolume // ignore: cast_nullable_to_non_nullable
              as int,
      goalWaterVolume: freezed == goalWaterVolume
          ? _value.goalWaterVolume
          : goalWaterVolume // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaterEntryImplCopyWith<$Res>
    implements $WaterEntryCopyWith<$Res> {
  factory _$$WaterEntryImplCopyWith(
          _$WaterEntryImpl value, $Res Function(_$WaterEntryImpl) then) =
      __$$WaterEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'water_volume') int waterVolume,
      @JsonKey(name: 'goal_water_volume') int? goalWaterVolume,
      @JsonKey(name: 'date_field') DateTime timestamp});
}

/// @nodoc
class __$$WaterEntryImplCopyWithImpl<$Res>
    extends _$WaterEntryCopyWithImpl<$Res, _$WaterEntryImpl>
    implements _$$WaterEntryImplCopyWith<$Res> {
  __$$WaterEntryImplCopyWithImpl(
      _$WaterEntryImpl _value, $Res Function(_$WaterEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? waterVolume = null,
    Object? goalWaterVolume = freezed,
    Object? timestamp = null,
  }) {
    return _then(_$WaterEntryImpl(
      waterVolume: null == waterVolume
          ? _value.waterVolume
          : waterVolume // ignore: cast_nullable_to_non_nullable
              as int,
      goalWaterVolume: freezed == goalWaterVolume
          ? _value.goalWaterVolume
          : goalWaterVolume // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WaterEntryImpl extends _WaterEntry {
  const _$WaterEntryImpl(
      {@JsonKey(name: 'water_volume') required this.waterVolume,
      @JsonKey(name: 'goal_water_volume') this.goalWaterVolume,
      @JsonKey(name: 'date_field') required this.timestamp})
      : super._();

  factory _$WaterEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WaterEntryImplFromJson(json);

  @override
  @JsonKey(name: 'water_volume')
  final int waterVolume;
  @override
  @JsonKey(name: 'goal_water_volume')
  final int? goalWaterVolume;
  @override
  @JsonKey(name: 'date_field')
  final DateTime timestamp;

  @override
  String toString() {
    return 'WaterEntry(waterVolume: $waterVolume, goalWaterVolume: $goalWaterVolume, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaterEntryImpl &&
            (identical(other.waterVolume, waterVolume) ||
                other.waterVolume == waterVolume) &&
            (identical(other.goalWaterVolume, goalWaterVolume) ||
                other.goalWaterVolume == goalWaterVolume) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, waterVolume, goalWaterVolume, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WaterEntryImplCopyWith<_$WaterEntryImpl> get copyWith =>
      __$$WaterEntryImplCopyWithImpl<_$WaterEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WaterEntryImplToJson(
      this,
    );
  }
}

abstract class _WaterEntry extends WaterEntry {
  const factory _WaterEntry(
          {@JsonKey(name: 'water_volume') required final int waterVolume,
          @JsonKey(name: 'goal_water_volume') final int? goalWaterVolume,
          @JsonKey(name: 'date_field') required final DateTime timestamp}) =
      _$WaterEntryImpl;
  const _WaterEntry._() : super._();

  factory _WaterEntry.fromJson(Map<String, dynamic> json) =
      _$WaterEntryImpl.fromJson;

  @override
  @JsonKey(name: 'water_volume')
  int get waterVolume;
  @override
  @JsonKey(name: 'goal_water_volume')
  int? get goalWaterVolume;
  @override
  @JsonKey(name: 'date_field')
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$WaterEntryImplCopyWith<_$WaterEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
