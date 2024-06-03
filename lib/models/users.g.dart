// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      goal: $enumDecodeNullable(_$UserGoalEnumMap, json['goal']),
      sex: $enumDecodeNullable(_$SexEnumMap, json['sex']),
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      level: $enumDecodeNullable(_$FitnessLevelEnumMap, json['level']),
      preference:
          $enumDecodeNullable(_$ExercisePreferenceEnumMap, json['preference']),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'goal': _$UserGoalEnumMap[instance.goal],
      'sex': _$SexEnumMap[instance.sex],
      'birth_date': instance.birthDate?.toIso8601String(),
      'level': _$FitnessLevelEnumMap[instance.level],
      'preference': _$ExercisePreferenceEnumMap[instance.preference],
    };

const _$UserGoalEnumMap = {
  UserGoal.beActive: 'BE_ACTIVE',
  UserGoal.beStrong: 'BE_STRONG',
  UserGoal.loseWeight: 'LOSE_WEIGHT',
};

const _$SexEnumMap = {
  Sex.male: 'MALE',
  Sex.female: 'FEMALE',
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
      level: $enumDecodeNullable(_$FitnessLevelEnumMap, json['level']),
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
      'level': _$FitnessLevelEnumMap[instance.level],
      'preference': _$ExercisePreferenceEnumMap[instance.preference],
    };
