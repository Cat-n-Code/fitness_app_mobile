// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  Sex? get sex => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  DateTime? get birthDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      Role role,
      Sex? sex,
      @JsonKey(name: 'birth_date') DateTime? birthDate});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? sex = freezed,
    Object? birthDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as Sex?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      Role role,
      Sex? sex,
      @JsonKey(name: 'birth_date') DateTime? birthDate});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? sex = freezed,
    Object? birthDate = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as Sex?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl extends _User {
  const _$UserImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.role,
      this.sex,
      @JsonKey(name: 'birth_date') this.birthDate})
      : super._();

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final Role role;
  @override
  final Sex? sex;
  @override
  @JsonKey(name: 'birth_date')
  final DateTime? birthDate;

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, role: $role, sex: $sex, birthDate: $birthDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, email, role, sex, birthDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {required final int id,
      required final String name,
      required final String email,
      required final Role role,
      final Sex? sex,
      @JsonKey(name: 'birth_date') final DateTime? birthDate}) = _$UserImpl;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  Role get role;
  @override
  Sex? get sex;
  @override
  @JsonKey(name: 'birth_date')
  DateTime? get birthDate;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  UserGoal? get goal => throw _privateConstructorUsedError;
  @JsonKey(name: 'fitness_level')
  FitnessLevel? get level => throw _privateConstructorUsedError;
  ExercisePreference? get preference => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerCopyWith<Customer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res, Customer>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      UserGoal? goal,
      @JsonKey(name: 'fitness_level') FitnessLevel? level,
      ExercisePreference? preference});
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res, $Val extends Customer>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? goal = freezed,
    Object? level = freezed,
    Object? preference = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as UserGoal?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as FitnessLevel?,
      preference: freezed == preference
          ? _value.preference
          : preference // ignore: cast_nullable_to_non_nullable
              as ExercisePreference?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerImplCopyWith<$Res>
    implements $CustomerCopyWith<$Res> {
  factory _$$CustomerImplCopyWith(
          _$CustomerImpl value, $Res Function(_$CustomerImpl) then) =
      __$$CustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      UserGoal? goal,
      @JsonKey(name: 'fitness_level') FitnessLevel? level,
      ExercisePreference? preference});
}

/// @nodoc
class __$$CustomerImplCopyWithImpl<$Res>
    extends _$CustomerCopyWithImpl<$Res, _$CustomerImpl>
    implements _$$CustomerImplCopyWith<$Res> {
  __$$CustomerImplCopyWithImpl(
      _$CustomerImpl _value, $Res Function(_$CustomerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? goal = freezed,
    Object? level = freezed,
    Object? preference = freezed,
  }) {
    return _then(_$CustomerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as UserGoal?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as FitnessLevel?,
      preference: freezed == preference
          ? _value.preference
          : preference // ignore: cast_nullable_to_non_nullable
              as ExercisePreference?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerImpl implements _Customer {
  const _$CustomerImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      this.goal,
      @JsonKey(name: 'fitness_level') this.level,
      this.preference});

  factory _$CustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final UserGoal? goal;
  @override
  @JsonKey(name: 'fitness_level')
  final FitnessLevel? level;
  @override
  final ExercisePreference? preference;

  @override
  String toString() {
    return 'Customer(id: $id, userId: $userId, goal: $goal, level: $level, preference: $preference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.preference, preference) ||
                other.preference == preference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, goal, level, preference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      __$$CustomerImplCopyWithImpl<_$CustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerImplToJson(
      this,
    );
  }
}

abstract class _Customer implements Customer {
  const factory _Customer(
      {required final int id,
      @JsonKey(name: 'user_id') required final int userId,
      final UserGoal? goal,
      @JsonKey(name: 'fitness_level') final FitnessLevel? level,
      final ExercisePreference? preference}) = _$CustomerImpl;

  factory _Customer.fromJson(Map<String, dynamic> json) =
      _$CustomerImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  UserGoal? get goal;
  @override
  @JsonKey(name: 'fitness_level')
  FitnessLevel? get level;
  @override
  ExercisePreference? get preference;
  @override
  @JsonKey(ignore: true)
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Coach _$CoachFromJson(Map<String, dynamic> json) {
  return _Coach.fromJson(json);
}

/// @nodoc
mixin _$Coach {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  CoachSpecialty get speciality => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoachCopyWith<Coach> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoachCopyWith<$Res> {
  factory $CoachCopyWith(Coach value, $Res Function(Coach) then) =
      _$CoachCopyWithImpl<$Res, Coach>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      CoachSpecialty speciality,
      double rating});
}

/// @nodoc
class _$CoachCopyWithImpl<$Res, $Val extends Coach>
    implements $CoachCopyWith<$Res> {
  _$CoachCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? speciality = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      speciality: null == speciality
          ? _value.speciality
          : speciality // ignore: cast_nullable_to_non_nullable
              as CoachSpecialty,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoachImplCopyWith<$Res> implements $CoachCopyWith<$Res> {
  factory _$$CoachImplCopyWith(
          _$CoachImpl value, $Res Function(_$CoachImpl) then) =
      __$$CoachImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      CoachSpecialty speciality,
      double rating});
}

/// @nodoc
class __$$CoachImplCopyWithImpl<$Res>
    extends _$CoachCopyWithImpl<$Res, _$CoachImpl>
    implements _$$CoachImplCopyWith<$Res> {
  __$$CoachImplCopyWithImpl(
      _$CoachImpl _value, $Res Function(_$CoachImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? speciality = null,
    Object? rating = null,
  }) {
    return _then(_$CoachImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      speciality: null == speciality
          ? _value.speciality
          : speciality // ignore: cast_nullable_to_non_nullable
              as CoachSpecialty,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoachImpl implements _Coach {
  const _$CoachImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.speciality,
      required this.rating});

  factory _$CoachImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoachImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final CoachSpecialty speciality;
  @override
  final double rating;

  @override
  String toString() {
    return 'Coach(id: $id, userId: $userId, speciality: $speciality, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoachImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.speciality, speciality) ||
                other.speciality == speciality) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, speciality, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoachImplCopyWith<_$CoachImpl> get copyWith =>
      __$$CoachImplCopyWithImpl<_$CoachImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoachImplToJson(
      this,
    );
  }
}

abstract class _Coach implements Coach {
  const factory _Coach(
      {required final int id,
      @JsonKey(name: 'user_id') required final int userId,
      required final CoachSpecialty speciality,
      required final double rating}) = _$CoachImpl;

  factory _Coach.fromJson(Map<String, dynamic> json) = _$CoachImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  CoachSpecialty get speciality;
  @override
  double get rating;
  @override
  @JsonKey(ignore: true)
  _$$CoachImplCopyWith<_$CoachImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserRegistrationForm _$UserRegistrationFormFromJson(Map<String, dynamic> json) {
  return _UserRegistrationForm.fromJson(json);
}

/// @nodoc
mixin _$UserRegistrationForm {
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  UserGoal? get goal => throw _privateConstructorUsedError;
  Sex? get sex => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  DateTime? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'fitness_level')
  FitnessLevel? get level => throw _privateConstructorUsedError;
  ExercisePreference? get preference => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRegistrationFormCopyWith<UserRegistrationForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegistrationFormCopyWith<$Res> {
  factory $UserRegistrationFormCopyWith(UserRegistrationForm value,
          $Res Function(UserRegistrationForm) then) =
      _$UserRegistrationFormCopyWithImpl<$Res, UserRegistrationForm>;
  @useResult
  $Res call(
      {String? name,
      String? email,
      String? password,
      UserGoal? goal,
      Sex? sex,
      @JsonKey(name: 'birth_date') DateTime? birthDate,
      @JsonKey(name: 'fitness_level') FitnessLevel? level,
      ExercisePreference? preference});
}

/// @nodoc
class _$UserRegistrationFormCopyWithImpl<$Res,
        $Val extends UserRegistrationForm>
    implements $UserRegistrationFormCopyWith<$Res> {
  _$UserRegistrationFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? goal = freezed,
    Object? sex = freezed,
    Object? birthDate = freezed,
    Object? level = freezed,
    Object? preference = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as UserGoal?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as Sex?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as FitnessLevel?,
      preference: freezed == preference
          ? _value.preference
          : preference // ignore: cast_nullable_to_non_nullable
              as ExercisePreference?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRegistrationFormImplCopyWith<$Res>
    implements $UserRegistrationFormCopyWith<$Res> {
  factory _$$UserRegistrationFormImplCopyWith(_$UserRegistrationFormImpl value,
          $Res Function(_$UserRegistrationFormImpl) then) =
      __$$UserRegistrationFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? email,
      String? password,
      UserGoal? goal,
      Sex? sex,
      @JsonKey(name: 'birth_date') DateTime? birthDate,
      @JsonKey(name: 'fitness_level') FitnessLevel? level,
      ExercisePreference? preference});
}

/// @nodoc
class __$$UserRegistrationFormImplCopyWithImpl<$Res>
    extends _$UserRegistrationFormCopyWithImpl<$Res, _$UserRegistrationFormImpl>
    implements _$$UserRegistrationFormImplCopyWith<$Res> {
  __$$UserRegistrationFormImplCopyWithImpl(_$UserRegistrationFormImpl _value,
      $Res Function(_$UserRegistrationFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? goal = freezed,
    Object? sex = freezed,
    Object? birthDate = freezed,
    Object? level = freezed,
    Object? preference = freezed,
  }) {
    return _then(_$UserRegistrationFormImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as UserGoal?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as Sex?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as FitnessLevel?,
      preference: freezed == preference
          ? _value.preference
          : preference // ignore: cast_nullable_to_non_nullable
              as ExercisePreference?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRegistrationFormImpl extends _UserRegistrationForm {
  const _$UserRegistrationFormImpl(
      {this.name,
      this.email,
      this.password,
      this.goal,
      this.sex,
      @JsonKey(name: 'birth_date') this.birthDate,
      @JsonKey(name: 'fitness_level') this.level,
      this.preference})
      : super._();

  factory _$UserRegistrationFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRegistrationFormImplFromJson(json);

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final UserGoal? goal;
  @override
  final Sex? sex;
  @override
  @JsonKey(name: 'birth_date')
  final DateTime? birthDate;
  @override
  @JsonKey(name: 'fitness_level')
  final FitnessLevel? level;
  @override
  final ExercisePreference? preference;

  @override
  String toString() {
    return 'UserRegistrationForm(name: $name, email: $email, password: $password, goal: $goal, sex: $sex, birthDate: $birthDate, level: $level, preference: $preference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegistrationFormImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.preference, preference) ||
                other.preference == preference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, password, goal, sex,
      birthDate, level, preference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegistrationFormImplCopyWith<_$UserRegistrationFormImpl>
      get copyWith =>
          __$$UserRegistrationFormImplCopyWithImpl<_$UserRegistrationFormImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRegistrationFormImplToJson(
      this,
    );
  }
}

abstract class _UserRegistrationForm extends UserRegistrationForm {
  const factory _UserRegistrationForm(
      {final String? name,
      final String? email,
      final String? password,
      final UserGoal? goal,
      final Sex? sex,
      @JsonKey(name: 'birth_date') final DateTime? birthDate,
      @JsonKey(name: 'fitness_level') final FitnessLevel? level,
      final ExercisePreference? preference}) = _$UserRegistrationFormImpl;
  const _UserRegistrationForm._() : super._();

  factory _UserRegistrationForm.fromJson(Map<String, dynamic> json) =
      _$UserRegistrationFormImpl.fromJson;

  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get password;
  @override
  UserGoal? get goal;
  @override
  Sex? get sex;
  @override
  @JsonKey(name: 'birth_date')
  DateTime? get birthDate;
  @override
  @JsonKey(name: 'fitness_level')
  FitnessLevel? get level;
  @override
  ExercisePreference? get preference;
  @override
  @JsonKey(ignore: true)
  _$$UserRegistrationFormImplCopyWith<_$UserRegistrationFormImpl>
      get copyWith => throw _privateConstructorUsedError;
}
