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

PhotoUpload _$PhotoUploadFromJson(Map<String, dynamic> json) {
  return _PhotoUpload.fromJson(json);
}

/// @nodoc
mixin _$PhotoUpload {
  int get id => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_url')
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoUploadCopyWith<PhotoUpload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoUploadCopyWith<$Res> {
  factory $PhotoUploadCopyWith(
          PhotoUpload value, $Res Function(PhotoUpload) then) =
      _$PhotoUploadCopyWithImpl<$Res, PhotoUpload>;
  @useResult
  $Res call({int id, String filename, @JsonKey(name: 'full_url') String url});
}

/// @nodoc
class _$PhotoUploadCopyWithImpl<$Res, $Val extends PhotoUpload>
    implements $PhotoUploadCopyWith<$Res> {
  _$PhotoUploadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filename = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoUploadImplCopyWith<$Res>
    implements $PhotoUploadCopyWith<$Res> {
  factory _$$PhotoUploadImplCopyWith(
          _$PhotoUploadImpl value, $Res Function(_$PhotoUploadImpl) then) =
      __$$PhotoUploadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String filename, @JsonKey(name: 'full_url') String url});
}

/// @nodoc
class __$$PhotoUploadImplCopyWithImpl<$Res>
    extends _$PhotoUploadCopyWithImpl<$Res, _$PhotoUploadImpl>
    implements _$$PhotoUploadImplCopyWith<$Res> {
  __$$PhotoUploadImplCopyWithImpl(
      _$PhotoUploadImpl _value, $Res Function(_$PhotoUploadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filename = null,
    Object? url = null,
  }) {
    return _then(_$PhotoUploadImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotoUploadImpl implements _PhotoUpload {
  const _$PhotoUploadImpl(
      {required this.id,
      required this.filename,
      @JsonKey(name: 'full_url') required this.url});

  factory _$PhotoUploadImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoUploadImplFromJson(json);

  @override
  final int id;
  @override
  final String filename;
  @override
  @JsonKey(name: 'full_url')
  final String url;

  @override
  String toString() {
    return 'PhotoUpload(id: $id, filename: $filename, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoUploadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, filename, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoUploadImplCopyWith<_$PhotoUploadImpl> get copyWith =>
      __$$PhotoUploadImplCopyWithImpl<_$PhotoUploadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoUploadImplToJson(
      this,
    );
  }
}

abstract class _PhotoUpload implements PhotoUpload {
  const factory _PhotoUpload(
          {required final int id,
          required final String filename,
          @JsonKey(name: 'full_url') required final String url}) =
      _$PhotoUploadImpl;

  factory _PhotoUpload.fromJson(Map<String, dynamic> json) =
      _$PhotoUploadImpl.fromJson;

  @override
  int get id;
  @override
  String get filename;
  @override
  @JsonKey(name: 'full_url')
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$PhotoUploadImplCopyWith<_$PhotoUploadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExerciseTemplate _$ExerciseTemplateFromJson(Map<String, dynamic> json) {
  return _ExerciseTemplate.fromJson(json);
}

/// @nodoc
mixin _$ExerciseTemplate {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get muscle => throw _privateConstructorUsedError;
  String? get additionalMuscle => throw _privateConstructorUsedError;
  ExerciseType? get type => throw _privateConstructorUsedError;
  String? get equipment => throw _privateConstructorUsedError;
  ExerciseDifficulty? get difficulty => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<PhotoUpload> get photos => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'user_id') int? userId,
      String name,
      String? muscle,
      String? additionalMuscle,
      ExerciseType? type,
      String? equipment,
      ExerciseDifficulty? difficulty,
      String? description,
      List<PhotoUpload> photos});
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
    Object? userId = freezed,
    Object? name = null,
    Object? muscle = freezed,
    Object? additionalMuscle = freezed,
    Object? type = freezed,
    Object? equipment = freezed,
    Object? difficulty = freezed,
    Object? description = freezed,
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      muscle: freezed == muscle
          ? _value.muscle
          : muscle // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalMuscle: freezed == additionalMuscle
          ? _value.additionalMuscle
          : additionalMuscle // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ExerciseType?,
      equipment: freezed == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as ExerciseDifficulty?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoUpload>,
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
      @JsonKey(name: 'user_id') int? userId,
      String name,
      String? muscle,
      String? additionalMuscle,
      ExerciseType? type,
      String? equipment,
      ExerciseDifficulty? difficulty,
      String? description,
      List<PhotoUpload> photos});
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
    Object? userId = freezed,
    Object? name = null,
    Object? muscle = freezed,
    Object? additionalMuscle = freezed,
    Object? type = freezed,
    Object? equipment = freezed,
    Object? difficulty = freezed,
    Object? description = freezed,
    Object? photos = null,
  }) {
    return _then(_$ExerciseTemplateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      muscle: freezed == muscle
          ? _value.muscle
          : muscle // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalMuscle: freezed == additionalMuscle
          ? _value.additionalMuscle
          : additionalMuscle // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ExerciseType?,
      equipment: freezed == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as ExerciseDifficulty?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoUpload>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseTemplateImpl implements _ExerciseTemplate {
  const _$ExerciseTemplateImpl(
      {this.id,
      @JsonKey(name: 'user_id') this.userId,
      required this.name,
      this.muscle,
      this.additionalMuscle,
      this.type,
      this.equipment,
      this.difficulty,
      this.description,
      final List<PhotoUpload> photos = const []})
      : _photos = photos;

  factory _$ExerciseTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseTemplateImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  final String name;
  @override
  final String? muscle;
  @override
  final String? additionalMuscle;
  @override
  final ExerciseType? type;
  @override
  final String? equipment;
  @override
  final ExerciseDifficulty? difficulty;
  @override
  final String? description;
  final List<PhotoUpload> _photos;
  @override
  @JsonKey()
  List<PhotoUpload> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  String toString() {
    return 'ExerciseTemplate(id: $id, userId: $userId, name: $name, muscle: $muscle, additionalMuscle: $additionalMuscle, type: $type, equipment: $equipment, difficulty: $difficulty, description: $description, photos: $photos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.muscle, muscle) || other.muscle == muscle) &&
            (identical(other.additionalMuscle, additionalMuscle) ||
                other.additionalMuscle == additionalMuscle) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      name,
      muscle,
      additionalMuscle,
      type,
      equipment,
      difficulty,
      description,
      const DeepCollectionEquality().hash(_photos));

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
      @JsonKey(name: 'user_id') final int? userId,
      required final String name,
      final String? muscle,
      final String? additionalMuscle,
      final ExerciseType? type,
      final String? equipment,
      final ExerciseDifficulty? difficulty,
      final String? description,
      final List<PhotoUpload> photos}) = _$ExerciseTemplateImpl;

  factory _ExerciseTemplate.fromJson(Map<String, dynamic> json) =
      _$ExerciseTemplateImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  String get name;
  @override
  String? get muscle;
  @override
  String? get additionalMuscle;
  @override
  ExerciseType? get type;
  @override
  String? get equipment;
  @override
  ExerciseDifficulty? get difficulty;
  @override
  String? get description;
  @override
  List<PhotoUpload> get photos;
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
  @JsonKey(name: 'exercise_id')
  int get exerciseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'workout_id')
  int? get workoutId => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_order')
  int get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_sets')
  int? get setsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_sets_done')
  int? get setsDoneCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_reps')
  int? get repeatsCount => throw _privateConstructorUsedError;
  ExerciseStage get stage => throw _privateConstructorUsedError;
  ExerciseTemplate? get exercise => throw _privateConstructorUsedError;

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
      {int? id,
      @JsonKey(name: 'exercise_id') int exerciseId,
      @JsonKey(name: 'workout_id') int? workoutId,
      @JsonKey(name: 'num_order') int order,
      @JsonKey(name: 'num_sets') int? setsCount,
      @JsonKey(name: 'num_sets_done') int? setsDoneCount,
      @JsonKey(name: 'num_reps') int? repeatsCount,
      ExerciseStage stage,
      ExerciseTemplate? exercise});

  $ExerciseTemplateCopyWith<$Res>? get exercise;
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
    Object? exerciseId = null,
    Object? workoutId = freezed,
    Object? order = null,
    Object? setsCount = freezed,
    Object? setsDoneCount = freezed,
    Object? repeatsCount = freezed,
    Object? stage = null,
    Object? exercise = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as int,
      workoutId: freezed == workoutId
          ? _value.workoutId
          : workoutId // ignore: cast_nullable_to_non_nullable
              as int?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      setsCount: freezed == setsCount
          ? _value.setsCount
          : setsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      setsDoneCount: freezed == setsDoneCount
          ? _value.setsDoneCount
          : setsDoneCount // ignore: cast_nullable_to_non_nullable
              as int?,
      repeatsCount: freezed == repeatsCount
          ? _value.repeatsCount
          : repeatsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as ExerciseStage,
      exercise: freezed == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ExerciseTemplate?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExerciseTemplateCopyWith<$Res>? get exercise {
    if (_value.exercise == null) {
      return null;
    }

    return $ExerciseTemplateCopyWith<$Res>(_value.exercise!, (value) {
      return _then(_value.copyWith(exercise: value) as $Val);
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
      {int? id,
      @JsonKey(name: 'exercise_id') int exerciseId,
      @JsonKey(name: 'workout_id') int? workoutId,
      @JsonKey(name: 'num_order') int order,
      @JsonKey(name: 'num_sets') int? setsCount,
      @JsonKey(name: 'num_sets_done') int? setsDoneCount,
      @JsonKey(name: 'num_reps') int? repeatsCount,
      ExerciseStage stage,
      ExerciseTemplate? exercise});

  @override
  $ExerciseTemplateCopyWith<$Res>? get exercise;
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
    Object? exerciseId = null,
    Object? workoutId = freezed,
    Object? order = null,
    Object? setsCount = freezed,
    Object? setsDoneCount = freezed,
    Object? repeatsCount = freezed,
    Object? stage = null,
    Object? exercise = freezed,
  }) {
    return _then(_$ExerciseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as int,
      workoutId: freezed == workoutId
          ? _value.workoutId
          : workoutId // ignore: cast_nullable_to_non_nullable
              as int?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      setsCount: freezed == setsCount
          ? _value.setsCount
          : setsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      setsDoneCount: freezed == setsDoneCount
          ? _value.setsDoneCount
          : setsDoneCount // ignore: cast_nullable_to_non_nullable
              as int?,
      repeatsCount: freezed == repeatsCount
          ? _value.repeatsCount
          : repeatsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as ExerciseStage,
      exercise: freezed == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ExerciseTemplate?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseImpl extends _Exercise {
  const _$ExerciseImpl(
      {this.id,
      @JsonKey(name: 'exercise_id') required this.exerciseId,
      @JsonKey(name: 'workout_id') this.workoutId,
      @JsonKey(name: 'num_order') required this.order,
      @JsonKey(name: 'num_sets') this.setsCount,
      @JsonKey(name: 'num_sets_done') this.setsDoneCount,
      @JsonKey(name: 'num_reps') this.repeatsCount,
      required this.stage,
      this.exercise})
      : super._();

  factory _$ExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'exercise_id')
  final int exerciseId;
  @override
  @JsonKey(name: 'workout_id')
  final int? workoutId;
  @override
  @JsonKey(name: 'num_order')
  final int order;
  @override
  @JsonKey(name: 'num_sets')
  final int? setsCount;
  @override
  @JsonKey(name: 'num_sets_done')
  final int? setsDoneCount;
  @override
  @JsonKey(name: 'num_reps')
  final int? repeatsCount;
  @override
  final ExerciseStage stage;
  @override
  final ExerciseTemplate? exercise;

  @override
  String toString() {
    return 'Exercise(id: $id, exerciseId: $exerciseId, workoutId: $workoutId, order: $order, setsCount: $setsCount, setsDoneCount: $setsDoneCount, repeatsCount: $repeatsCount, stage: $stage, exercise: $exercise)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.workoutId, workoutId) ||
                other.workoutId == workoutId) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.setsCount, setsCount) ||
                other.setsCount == setsCount) &&
            (identical(other.setsDoneCount, setsDoneCount) ||
                other.setsDoneCount == setsDoneCount) &&
            (identical(other.repeatsCount, repeatsCount) ||
                other.repeatsCount == repeatsCount) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, exerciseId, workoutId, order,
      setsCount, setsDoneCount, repeatsCount, stage, exercise);

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

abstract class _Exercise extends Exercise {
  const factory _Exercise(
      {final int? id,
      @JsonKey(name: 'exercise_id') required final int exerciseId,
      @JsonKey(name: 'workout_id') final int? workoutId,
      @JsonKey(name: 'num_order') required final int order,
      @JsonKey(name: 'num_sets') final int? setsCount,
      @JsonKey(name: 'num_sets_done') final int? setsDoneCount,
      @JsonKey(name: 'num_reps') final int? repeatsCount,
      required final ExerciseStage stage,
      final ExerciseTemplate? exercise}) = _$ExerciseImpl;
  const _Exercise._() : super._();

  factory _Exercise.fromJson(Map<String, dynamic> json) =
      _$ExerciseImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'exercise_id')
  int get exerciseId;
  @override
  @JsonKey(name: 'workout_id')
  int? get workoutId;
  @override
  @JsonKey(name: 'num_order')
  int get order;
  @override
  @JsonKey(name: 'num_sets')
  int? get setsCount;
  @override
  @JsonKey(name: 'num_sets_done')
  int? get setsDoneCount;
  @override
  @JsonKey(name: 'num_reps')
  int? get repeatsCount;
  @override
  ExerciseStage get stage;
  @override
  ExerciseTemplate? get exercise;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return _Workout.fromJson(json);
}

/// @nodoc
mixin _$Workout {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'coach_id')
  int? get coachId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'chat_id')
  int? get chatId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_connection')
  WorkoutType? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_start')
  DateTime? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'exercise_workouts')
  List<Exercise> get exercises => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'coach_id') int? coachId,
      @JsonKey(name: 'customer_id') int? customerId,
      @JsonKey(name: 'chat_id') int? chatId,
      String name,
      @JsonKey(name: 'type_connection') WorkoutType? type,
      @JsonKey(name: 'time_start') DateTime? startTime,
      @JsonKey(name: 'exercise_workouts') List<Exercise> exercises});
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
    Object? coachId = freezed,
    Object? customerId = freezed,
    Object? chatId = freezed,
    Object? name = null,
    Object? type = freezed,
    Object? startTime = freezed,
    Object? exercises = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      coachId: freezed == coachId
          ? _value.coachId
          : coachId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WorkoutType?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
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
      {int? id,
      @JsonKey(name: 'coach_id') int? coachId,
      @JsonKey(name: 'customer_id') int? customerId,
      @JsonKey(name: 'chat_id') int? chatId,
      String name,
      @JsonKey(name: 'type_connection') WorkoutType? type,
      @JsonKey(name: 'time_start') DateTime? startTime,
      @JsonKey(name: 'exercise_workouts') List<Exercise> exercises});
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
    Object? coachId = freezed,
    Object? customerId = freezed,
    Object? chatId = freezed,
    Object? name = null,
    Object? type = freezed,
    Object? startTime = freezed,
    Object? exercises = null,
  }) {
    return _then(_$WorkoutImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      coachId: freezed == coachId
          ? _value.coachId
          : coachId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WorkoutType?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutImpl extends _Workout {
  const _$WorkoutImpl(
      {this.id,
      @JsonKey(name: 'coach_id') this.coachId,
      @JsonKey(name: 'customer_id') this.customerId,
      @JsonKey(name: 'chat_id') this.chatId,
      required this.name,
      @JsonKey(name: 'type_connection') this.type,
      @JsonKey(name: 'time_start') this.startTime,
      @JsonKey(name: 'exercise_workouts')
      final List<Exercise> exercises = const []})
      : _exercises = exercises,
        super._();

  factory _$WorkoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'coach_id')
  final int? coachId;
  @override
  @JsonKey(name: 'customer_id')
  final int? customerId;
  @override
  @JsonKey(name: 'chat_id')
  final int? chatId;
  @override
  final String name;
  @override
  @JsonKey(name: 'type_connection')
  final WorkoutType? type;
  @override
  @JsonKey(name: 'time_start')
  final DateTime? startTime;
  final List<Exercise> _exercises;
  @override
  @JsonKey(name: 'exercise_workouts')
  List<Exercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'Workout(id: $id, coachId: $coachId, customerId: $customerId, chatId: $chatId, name: $name, type: $type, startTime: $startTime, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.coachId, coachId) || other.coachId == coachId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, coachId, customerId, chatId,
      name, type, startTime, const DeepCollectionEquality().hash(_exercises));

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
          @JsonKey(name: 'coach_id') final int? coachId,
          @JsonKey(name: 'customer_id') final int? customerId,
          @JsonKey(name: 'chat_id') final int? chatId,
          required final String name,
          @JsonKey(name: 'type_connection') final WorkoutType? type,
          @JsonKey(name: 'time_start') final DateTime? startTime,
          @JsonKey(name: 'exercise_workouts') final List<Exercise> exercises}) =
      _$WorkoutImpl;
  const _Workout._() : super._();

  factory _Workout.fromJson(Map<String, dynamic> json) = _$WorkoutImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'coach_id')
  int? get coachId;
  @override
  @JsonKey(name: 'customer_id')
  int? get customerId;
  @override
  @JsonKey(name: 'chat_id')
  int? get chatId;
  @override
  String get name;
  @override
  @JsonKey(name: 'type_connection')
  WorkoutType? get type;
  @override
  @JsonKey(name: 'time_start')
  DateTime? get startTime;
  @override
  @JsonKey(name: 'exercise_workouts')
  List<Exercise> get exercises;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
