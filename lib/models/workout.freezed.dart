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

ExerciseTemplate _$ExerciseTemplateFromJson(Map<String, dynamic> json) {
  return _ExerciseTemplate.fromJson(json);
}

/// @nodoc
mixin _$ExerciseTemplate {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get muscle => throw _privateConstructorUsedError;
  String get additionalMuscle => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get equipment => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  List<String> get photosUrls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseTemplateCopyWith<ExerciseTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseTemplateCopyWith<$Res> {
  factory $ExerciseTemplateCopyWith(
          ExerciseTemplate value, $Res Function(ExerciseTemplate) then) =
      _$ExerciseTemplateCopyWithImpl<$Res, ExerciseTemplate>;
  @useResult
  $Res call(
      {int? id,
      String name,
      String muscle,
      String additionalMuscle,
      String type,
      String equipment,
      String difficulty,
      List<String> photosUrls});
}

/// @nodoc
class _$ExerciseTemplateCopyWithImpl<$Res, $Val extends ExerciseTemplate>
    implements $ExerciseTemplateCopyWith<$Res> {
  _$ExerciseTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? muscle = null,
    Object? additionalMuscle = null,
    Object? type = null,
    Object? equipment = null,
    Object? difficulty = null,
    Object? photosUrls = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      muscle: null == muscle
          ? _value.muscle
          : muscle // ignore: cast_nullable_to_non_nullable
              as String,
      additionalMuscle: null == additionalMuscle
          ? _value.additionalMuscle
          : additionalMuscle // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      photosUrls: null == photosUrls
          ? _value.photosUrls
          : photosUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseTemplateImplCopyWith<$Res>
    implements $ExerciseTemplateCopyWith<$Res> {
  factory _$$ExerciseTemplateImplCopyWith(_$ExerciseTemplateImpl value,
          $Res Function(_$ExerciseTemplateImpl) then) =
      __$$ExerciseTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      String muscle,
      String additionalMuscle,
      String type,
      String equipment,
      String difficulty,
      List<String> photosUrls});
}

/// @nodoc
class __$$ExerciseTemplateImplCopyWithImpl<$Res>
    extends _$ExerciseTemplateCopyWithImpl<$Res, _$ExerciseTemplateImpl>
    implements _$$ExerciseTemplateImplCopyWith<$Res> {
  __$$ExerciseTemplateImplCopyWithImpl(_$ExerciseTemplateImpl _value,
      $Res Function(_$ExerciseTemplateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? muscle = null,
    Object? additionalMuscle = null,
    Object? type = null,
    Object? equipment = null,
    Object? difficulty = null,
    Object? photosUrls = null,
  }) {
    return _then(_$ExerciseTemplateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      muscle: null == muscle
          ? _value.muscle
          : muscle // ignore: cast_nullable_to_non_nullable
              as String,
      additionalMuscle: null == additionalMuscle
          ? _value.additionalMuscle
          : additionalMuscle // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      photosUrls: null == photosUrls
          ? _value._photosUrls
          : photosUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseTemplateImpl implements _ExerciseTemplate {
  const _$ExerciseTemplateImpl(
      {this.id,
      required this.name,
      required this.muscle,
      required this.additionalMuscle,
      required this.type,
      required this.equipment,
      required this.difficulty,
      required final List<String> photosUrls})
      : _photosUrls = photosUrls;

  factory _$ExerciseTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseTemplateImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final String muscle;
  @override
  final String additionalMuscle;
  @override
  final String type;
  @override
  final String equipment;
  @override
  final String difficulty;
  final List<String> _photosUrls;
  @override
  List<String> get photosUrls {
    if (_photosUrls is EqualUnmodifiableListView) return _photosUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photosUrls);
  }

  @override
  String toString() {
    return 'ExerciseTemplate(id: $id, name: $name, muscle: $muscle, additionalMuscle: $additionalMuscle, type: $type, equipment: $equipment, difficulty: $difficulty, photosUrls: $photosUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.muscle, muscle) || other.muscle == muscle) &&
            (identical(other.additionalMuscle, additionalMuscle) ||
                other.additionalMuscle == additionalMuscle) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            const DeepCollectionEquality()
                .equals(other._photosUrls, _photosUrls));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      muscle,
      additionalMuscle,
      type,
      equipment,
      difficulty,
      const DeepCollectionEquality().hash(_photosUrls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseTemplateImplCopyWith<_$ExerciseTemplateImpl> get copyWith =>
      __$$ExerciseTemplateImplCopyWithImpl<_$ExerciseTemplateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseTemplateImplToJson(
      this,
    );
  }
}

abstract class _ExerciseTemplate implements ExerciseTemplate {
  const factory _ExerciseTemplate(
      {final int? id,
      required final String name,
      required final String muscle,
      required final String additionalMuscle,
      required final String type,
      required final String equipment,
      required final String difficulty,
      required final List<String> photosUrls}) = _$ExerciseTemplateImpl;

  factory _ExerciseTemplate.fromJson(Map<String, dynamic> json) =
      _$ExerciseTemplateImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  String get muscle;
  @override
  String get additionalMuscle;
  @override
  String get type;
  @override
  String get equipment;
  @override
  String get difficulty;
  @override
  List<String> get photosUrls;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseTemplateImplCopyWith<_$ExerciseTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return _Exercise.fromJson(json);
}

/// @nodoc
mixin _$Exercise {
  int? get id => throw _privateConstructorUsedError;
  ExerciseTemplate get template => throw _privateConstructorUsedError;
  int get setsCount => throw _privateConstructorUsedError;
  int get goalSetsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseCopyWith<Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseCopyWith<$Res> {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) then) =
      _$ExerciseCopyWithImpl<$Res, Exercise>;
  @useResult
  $Res call(
      {int? id, ExerciseTemplate template, int setsCount, int goalSetsCount});

  $ExerciseTemplateCopyWith<$Res> get template;
}

/// @nodoc
class _$ExerciseCopyWithImpl<$Res, $Val extends Exercise>
    implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? template = null,
    Object? setsCount = null,
    Object? goalSetsCount = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as ExerciseTemplate,
      setsCount: null == setsCount
          ? _value.setsCount
          : setsCount // ignore: cast_nullable_to_non_nullable
              as int,
      goalSetsCount: null == goalSetsCount
          ? _value.goalSetsCount
          : goalSetsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExerciseTemplateCopyWith<$Res> get template {
    return $ExerciseTemplateCopyWith<$Res>(_value.template, (value) {
      return _then(_value.copyWith(template: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExerciseImplCopyWith<$Res>
    implements $ExerciseCopyWith<$Res> {
  factory _$$ExerciseImplCopyWith(
          _$ExerciseImpl value, $Res Function(_$ExerciseImpl) then) =
      __$$ExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id, ExerciseTemplate template, int setsCount, int goalSetsCount});

  @override
  $ExerciseTemplateCopyWith<$Res> get template;
}

/// @nodoc
class __$$ExerciseImplCopyWithImpl<$Res>
    extends _$ExerciseCopyWithImpl<$Res, _$ExerciseImpl>
    implements _$$ExerciseImplCopyWith<$Res> {
  __$$ExerciseImplCopyWithImpl(
      _$ExerciseImpl _value, $Res Function(_$ExerciseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? template = null,
    Object? setsCount = null,
    Object? goalSetsCount = null,
  }) {
    return _then(_$ExerciseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as ExerciseTemplate,
      setsCount: null == setsCount
          ? _value.setsCount
          : setsCount // ignore: cast_nullable_to_non_nullable
              as int,
      goalSetsCount: null == goalSetsCount
          ? _value.goalSetsCount
          : goalSetsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseImpl implements _Exercise {
  const _$ExerciseImpl(
      {this.id,
      required this.template,
      required this.setsCount,
      required this.goalSetsCount});

  factory _$ExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseImplFromJson(json);

  @override
  final int? id;
  @override
  final ExerciseTemplate template;
  @override
  final int setsCount;
  @override
  final int goalSetsCount;

  @override
  String toString() {
    return 'Exercise(id: $id, template: $template, setsCount: $setsCount, goalSetsCount: $goalSetsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.template, template) ||
                other.template == template) &&
            (identical(other.setsCount, setsCount) ||
                other.setsCount == setsCount) &&
            (identical(other.goalSetsCount, goalSetsCount) ||
                other.goalSetsCount == goalSetsCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, template, setsCount, goalSetsCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      __$$ExerciseImplCopyWithImpl<_$ExerciseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseImplToJson(
      this,
    );
  }
}

abstract class _Exercise implements Exercise {
  const factory _Exercise(
      {final int? id,
      required final ExerciseTemplate template,
      required final int setsCount,
      required final int goalSetsCount}) = _$ExerciseImpl;

  factory _Exercise.fromJson(Map<String, dynamic> json) =
      _$ExerciseImpl.fromJson;

  @override
  int? get id;
  @override
  ExerciseTemplate get template;
  @override
  int get setsCount;
  @override
  int get goalSetsCount;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkoutTemplate _$WorkoutTemplateFromJson(Map<String, dynamic> json) {
  return _WorkoutTemplate.fromJson(json);
}

/// @nodoc
mixin _$WorkoutTemplate {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<ExerciseTemplate> get exercises => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutTemplateCopyWith<WorkoutTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutTemplateCopyWith<$Res> {
  factory $WorkoutTemplateCopyWith(
          WorkoutTemplate value, $Res Function(WorkoutTemplate) then) =
      _$WorkoutTemplateCopyWithImpl<$Res, WorkoutTemplate>;
  @useResult
  $Res call(
      {int? id,
      String name,
      String description,
      List<ExerciseTemplate> exercises});
}

/// @nodoc
class _$WorkoutTemplateCopyWithImpl<$Res, $Val extends WorkoutTemplate>
    implements $WorkoutTemplateCopyWith<$Res> {
  _$WorkoutTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? exercises = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<ExerciseTemplate>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutTemplateImplCopyWith<$Res>
    implements $WorkoutTemplateCopyWith<$Res> {
  factory _$$WorkoutTemplateImplCopyWith(_$WorkoutTemplateImpl value,
          $Res Function(_$WorkoutTemplateImpl) then) =
      __$$WorkoutTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      String description,
      List<ExerciseTemplate> exercises});
}

/// @nodoc
class __$$WorkoutTemplateImplCopyWithImpl<$Res>
    extends _$WorkoutTemplateCopyWithImpl<$Res, _$WorkoutTemplateImpl>
    implements _$$WorkoutTemplateImplCopyWith<$Res> {
  __$$WorkoutTemplateImplCopyWithImpl(
      _$WorkoutTemplateImpl _value, $Res Function(_$WorkoutTemplateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? exercises = null,
  }) {
    return _then(_$WorkoutTemplateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<ExerciseTemplate>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutTemplateImpl implements _WorkoutTemplate {
  const _$WorkoutTemplateImpl(
      {this.id,
      required this.name,
      required this.description,
      required final List<ExerciseTemplate> exercises})
      : _exercises = exercises;

  factory _$WorkoutTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutTemplateImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final String description;
  final List<ExerciseTemplate> _exercises;
  @override
  List<ExerciseTemplate> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'WorkoutTemplate(id: $id, name: $name, description: $description, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      const DeepCollectionEquality().hash(_exercises));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutTemplateImplCopyWith<_$WorkoutTemplateImpl> get copyWith =>
      __$$WorkoutTemplateImplCopyWithImpl<_$WorkoutTemplateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutTemplateImplToJson(
      this,
    );
  }
}

abstract class _WorkoutTemplate implements WorkoutTemplate {
  const factory _WorkoutTemplate(
      {final int? id,
      required final String name,
      required final String description,
      required final List<ExerciseTemplate> exercises}) = _$WorkoutTemplateImpl;

  factory _WorkoutTemplate.fromJson(Map<String, dynamic> json) =
      _$WorkoutTemplateImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  String get description;
  @override
  List<ExerciseTemplate> get exercises;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutTemplateImplCopyWith<_$WorkoutTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return _Workout.fromJson(json);
}

/// @nodoc
mixin _$Workout {
  int? get id => throw _privateConstructorUsedError;
  WorkoutTemplate get template => throw _privateConstructorUsedError;
  List<Exercise> get exercises => throw _privateConstructorUsedError;
  DateTime get completionDate => throw _privateConstructorUsedError;

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
      {int? id,
      WorkoutTemplate template,
      List<Exercise> exercises,
      DateTime completionDate});

  $WorkoutTemplateCopyWith<$Res> get template;
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
    Object? id = freezed,
    Object? template = null,
    Object? exercises = null,
    Object? completionDate = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as WorkoutTemplate,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
      completionDate: null == completionDate
          ? _value.completionDate
          : completionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkoutTemplateCopyWith<$Res> get template {
    return $WorkoutTemplateCopyWith<$Res>(_value.template, (value) {
      return _then(_value.copyWith(template: value) as $Val);
    });
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
      {int? id,
      WorkoutTemplate template,
      List<Exercise> exercises,
      DateTime completionDate});

  @override
  $WorkoutTemplateCopyWith<$Res> get template;
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
    Object? id = freezed,
    Object? template = null,
    Object? exercises = null,
    Object? completionDate = null,
  }) {
    return _then(_$WorkoutImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as WorkoutTemplate,
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
      completionDate: null == completionDate
          ? _value.completionDate
          : completionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutImpl extends _Workout {
  const _$WorkoutImpl(
      {this.id,
      required this.template,
      required final List<Exercise> exercises,
      required this.completionDate})
      : _exercises = exercises,
        super._();

  factory _$WorkoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutImplFromJson(json);

  @override
  final int? id;
  @override
  final WorkoutTemplate template;
  final List<Exercise> _exercises;
  @override
  List<Exercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  final DateTime completionDate;

  @override
  String toString() {
    return 'Workout(id: $id, template: $template, exercises: $exercises, completionDate: $completionDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.template, template) ||
                other.template == template) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises) &&
            (identical(other.completionDate, completionDate) ||
                other.completionDate == completionDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, template,
      const DeepCollectionEquality().hash(_exercises), completionDate);

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
      {final int? id,
      required final WorkoutTemplate template,
      required final List<Exercise> exercises,
      required final DateTime completionDate}) = _$WorkoutImpl;
  const _Workout._() : super._();

  factory _Workout.fromJson(Map<String, dynamic> json) = _$WorkoutImpl.fromJson;

  @override
  int? get id;
  @override
  WorkoutTemplate get template;
  @override
  List<Exercise> get exercises;
  @override
  DateTime get completionDate;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
