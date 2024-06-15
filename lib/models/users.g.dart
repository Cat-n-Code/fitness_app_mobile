// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      sex: $enumDecodeNullable(_$SexEnumMap, json['sex']),
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': _$RoleEnumMap[instance.role]!,
      'sex': _$SexEnumMap[instance.sex],
      'birth_date': instance.birthDate?.toIso8601String(),
    };

const _$RoleEnumMap = {
  Role.customer: 'CUSTOMER',
  Role.coach: 'COACH',
};

const _$SexEnumMap = {
  Sex.male: 'MALE',
  Sex.female: 'FEMALE',
};

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      goal: $enumDecodeNullable(_$UserGoalEnumMap, json['goal']),
      level: $enumDecodeNullable(_$FitnessLevelEnumMap, json['fitness_level']),
      preference:
          $enumDecodeNullable(_$ExercisePreferenceEnumMap, json['preference']),
    );

Map<String, dynamic> _$$CustomerImplToJson(_$CustomerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'goal': _$UserGoalEnumMap[instance.goal],
      'fitness_level': _$FitnessLevelEnumMap[instance.level],
      'preference': _$ExercisePreferenceEnumMap[instance.preference],
    };

const _$UserGoalEnumMap = {
  UserGoal.beActive: 'BE_ACTIVE',
  UserGoal.beStrong: 'BE_STRONG',
  UserGoal.loseWeight: 'LOSE_WEIGHT',
};

const _$FitnessLevelEnumMap = {
  FitnessLevel.novice: 'NOVICE',
  FitnessLevel.beginner: 'BEGINNER',
  FitnessLevel.intermediate: 'INTERMEDIATE',
  FitnessLevel.advanced: 'ADVANCED',
  FitnessLevel.athlete: 'ATHLETE',
};

const _$ExercisePreferenceEnumMap = {
  ExercisePreference.jogging: 'JOGGING',
  ExercisePreference.walking: 'WALKING',
  ExercisePreference.weightlift: 'WEIGHTLIFT',
  ExercisePreference.cardio: 'CARDIO',
  ExercisePreference.yoga: 'YOGA',
  ExercisePreference.other: 'OTHER',
};

_$CoachImpl _$$CoachImplFromJson(Map<String, dynamic> json) => _$CoachImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      speciality: $enumDecode(_$CoachSpecialtyEnumMap, json['speciality']),
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$CoachImplToJson(_$CoachImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'speciality': _$CoachSpecialtyEnumMap[instance.speciality]!,
      'rating': instance.rating,
    };

const _$CoachSpecialtyEnumMap = {
  CoachSpecialty.kids: 'KIDS',
  CoachSpecialty.adult: 'ADULT',
  CoachSpecialty.yoga: 'YOGA',
};

_$UserRegistrationFormImpl _$$UserRegistrationFormImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRegistrationFormImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      goal: $enumDecodeNullable(_$UserGoalEnumMap, json['goal']),
      sex: $enumDecodeNullable(_$SexEnumMap, json['sex']),
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      level: $enumDecodeNullable(_$FitnessLevelEnumMap, json['fitness_level']),
      preference:
          $enumDecodeNullable(_$ExercisePreferenceEnumMap, json['preference']),
    );

Map<String, dynamic> _$$UserRegistrationFormImplToJson(
        _$UserRegistrationFormImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'goal': _$UserGoalEnumMap[instance.goal],
      'sex': _$SexEnumMap[instance.sex],
      'birth_date': instance.birthDate?.toIso8601String(),
      'fitness_level': _$FitnessLevelEnumMap[instance.level],
      'preference': _$ExercisePreferenceEnumMap[instance.preference],
    };
