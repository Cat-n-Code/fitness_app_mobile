// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return _Workout.fromJson(json);
}

/// @nodoc
mixin _$Workout {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  WorkoutType get type => throw _privateConstructorUsedError;
  WorkoutBodyPart get bodyPart => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;
  int get pointsReward => throw _privateConstructorUsedError;
  String get backgroundAsset => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get foregroundColor => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get backgroundColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutCopyWith<Workout> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutCopyWith<$Res> {
  factory $WorkoutCopyWith(Workout value, $Res Function(Workout) then) =
      _$WorkoutCopyWithImpl<$Res, Workout>;
  @useResult
  $Res call(
      {int id,
      String title,
      String subtitle,
      WorkoutType type,
      WorkoutBodyPart bodyPart,
      int durationMinutes,
      int pointsReward,
      String backgroundAsset,
      @ColorConverter() Color foregroundColor,
      @ColorConverter() Color backgroundColor});
}

/// @nodoc
class _$WorkoutCopyWithImpl<$Res, $Val extends Workout>
    implements $WorkoutCopyWith<$Res> {
  _$WorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? type = null,
    Object? bodyPart = null,
    Object? durationMinutes = null,
    Object? pointsReward = null,
    Object? backgroundAsset = null,
    Object? foregroundColor = null,
    Object? backgroundColor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WorkoutType,
      bodyPart: null == bodyPart
          ? _value.bodyPart
          : bodyPart // ignore: cast_nullable_to_non_nullable
              as WorkoutBodyPart,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      pointsReward: null == pointsReward
          ? _value.pointsReward
          : pointsReward // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundAsset: null == backgroundAsset
          ? _value.backgroundAsset
          : backgroundAsset // ignore: cast_nullable_to_non_nullable
              as String,
      foregroundColor: null == foregroundColor
          ? _value.foregroundColor
          : foregroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutImplCopyWith<$Res> implements $WorkoutCopyWith<$Res> {
  factory _$$WorkoutImplCopyWith(
          _$WorkoutImpl value, $Res Function(_$WorkoutImpl) then) =
      __$$WorkoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String subtitle,
      WorkoutType type,
      WorkoutBodyPart bodyPart,
      int durationMinutes,
      int pointsReward,
      String backgroundAsset,
      @ColorConverter() Color foregroundColor,
      @ColorConverter() Color backgroundColor});
}

/// @nodoc
class __$$WorkoutImplCopyWithImpl<$Res>
    extends _$WorkoutCopyWithImpl<$Res, _$WorkoutImpl>
    implements _$$WorkoutImplCopyWith<$Res> {
  __$$WorkoutImplCopyWithImpl(
      _$WorkoutImpl _value, $Res Function(_$WorkoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? type = null,
    Object? bodyPart = null,
    Object? durationMinutes = null,
    Object? pointsReward = null,
    Object? backgroundAsset = null,
    Object? foregroundColor = null,
    Object? backgroundColor = null,
  }) {
    return _then(_$WorkoutImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WorkoutType,
      bodyPart: null == bodyPart
          ? _value.bodyPart
          : bodyPart // ignore: cast_nullable_to_non_nullable
              as WorkoutBodyPart,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      pointsReward: null == pointsReward
          ? _value.pointsReward
          : pointsReward // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundAsset: null == backgroundAsset
          ? _value.backgroundAsset
          : backgroundAsset // ignore: cast_nullable_to_non_nullable
              as String,
      foregroundColor: null == foregroundColor
          ? _value.foregroundColor
          : foregroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutImpl extends _Workout {
  const _$WorkoutImpl(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.type,
      required this.bodyPart,
      required this.durationMinutes,
      required this.pointsReward,
      required this.backgroundAsset,
      @ColorConverter() required this.foregroundColor,
      @ColorConverter() required this.backgroundColor})
      : super._();

  factory _$WorkoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final WorkoutType type;
  @override
  final WorkoutBodyPart bodyPart;
  @override
  final int durationMinutes;
  @override
  final int pointsReward;
  @override
  final String backgroundAsset;
  @override
  @ColorConverter()
  final Color foregroundColor;
  @override
  @ColorConverter()
  final Color backgroundColor;

  @override
  String toString() {
    return 'Workout(id: $id, title: $title, subtitle: $subtitle, type: $type, bodyPart: $bodyPart, durationMinutes: $durationMinutes, pointsReward: $pointsReward, backgroundAsset: $backgroundAsset, foregroundColor: $foregroundColor, backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.bodyPart, bodyPart) ||
                other.bodyPart == bodyPart) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.pointsReward, pointsReward) ||
                other.pointsReward == pointsReward) &&
            (identical(other.backgroundAsset, backgroundAsset) ||
                other.backgroundAsset == backgroundAsset) &&
            (identical(other.foregroundColor, foregroundColor) ||
                other.foregroundColor == foregroundColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      subtitle,
      type,
      bodyPart,
      durationMinutes,
      pointsReward,
      backgroundAsset,
      foregroundColor,
      backgroundColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      __$$WorkoutImplCopyWithImpl<_$WorkoutImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutImplToJson(
      this,
    );
  }
}

abstract class _Workout extends Workout {
  const factory _Workout(
      {required final int id,
      required final String title,
      required final String subtitle,
      required final WorkoutType type,
      required final WorkoutBodyPart bodyPart,
      required final int durationMinutes,
      required final int pointsReward,
      required final String backgroundAsset,
      @ColorConverter() required final Color foregroundColor,
      @ColorConverter() required final Color backgroundColor}) = _$WorkoutImpl;
  const _Workout._() : super._();

  factory _Workout.fromJson(Map<String, dynamic> json) = _$WorkoutImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get subtitle;
  @override
  WorkoutType get type;
  @override
  WorkoutBodyPart get bodyPart;
  @override
  int get durationMinutes;
  @override
  int get pointsReward;
  @override
  String get backgroundAsset;
  @override
  @ColorConverter()
  Color get foregroundColor;
  @override
  @ColorConverter()
  Color get backgroundColor;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
