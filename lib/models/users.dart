import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users.freezed.dart';
part 'users.g.dart';

enum Sex {
  @JsonValue('MALE')
  male('common.sex.male', Icons.male),
  @JsonValue('FEMALE')
  female('common.sex.female', Icons.female);

  const Sex(this.translationKey, this.icon);

  final String translationKey;
  final IconData icon;
}

enum UserGoal {
  @JsonValue('BE_ACTIVE')
  beActive('common.goals.be_active', Icons.hiking_outlined),
  @JsonValue('BE_STRONG')
  beStrong('common.goals.be_strong', Icons.fitness_center),
  @JsonValue('LOSE_WEIGHT')
  loseWeight('common.goals.lose_weight', Icons.monitor_weight_outlined);

  const UserGoal(this.translationKey, this.icon);

  final String translationKey;
  final IconData icon;
}

enum FitnessLevel {
  @JsonValue('NOVICE')
  novice('common.fitness_levels.novice'),
  @JsonValue('BEGINNER')
  beginner('common.fitness_levels.beginner'),
  @JsonValue('INTERMEDIATE')
  intermediate('common.fitness_levels.intermediate'),
  @JsonValue('ADVANCED')
  advanced('common.fitness_levels.advanced'),
  @JsonValue('ATHLETE')
  athlete('common.fitness_levels.athlete');

  const FitnessLevel(this.translationKey);

  final String translationKey;
}

enum ExercisePreference {
  @JsonValue('JOGGING')
  jogging('common.exercise_preferences.jogging', Icons.directions_run),
  @JsonValue('WALKING')
  walking('common.exercise_preferences.walking', Icons.directions_walk),
  @JsonValue('WEIGHTLIFT')
  weightlift('common.exercise_preferences.weightlift', Icons.fitness_center),
  @JsonValue('CARDIO')
  cardio('common.exercise_preferences.cardio', Icons.monitor_heart_outlined),
  @JsonValue('YOGA')
  yoga('common.exercise_preferences.yoga', Icons.self_improvement),
  @JsonValue('OTHER')
  other('common.exercise_preferences.other', Icons.settings);

  const ExercisePreference(this.translationKey, this.icon);

  final String translationKey;
  final IconData icon;
}

@freezed
class User with _$User {
  const User._();

  const factory User({
    int? id,
    required String name,
    required String email,
    UserGoal? goal,
    Sex? sex,
    @JsonKey(name: 'birth_date') DateTime? birthDate,
    FitnessLevel? level,
    ExercisePreference? preference,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  ImageProvider get photo => switch (sex) {
        Sex.male => const AssetImage('assets/images/avatars/male.png'),
        Sex.female => const AssetImage('assets/images/avatars/female.png'),
        _ => const AssetImage('assets/images/avatars/unknown.png')
      };
}

@freezed
class UserRegistrationForm with _$UserRegistrationForm {
  const UserRegistrationForm._();

  const factory UserRegistrationForm({
    String? name,
    String? email,
    String? password,
    UserGoal? goal,
    Sex? sex,
    @JsonKey(name: 'birth_date') DateTime? birthDate,
    FitnessLevel? level,
    ExercisePreference? preference,
  }) = _UserRegistrationForm;

  factory UserRegistrationForm.fromJson(Map<String, Object?> json) =>
      _$UserRegistrationFormFromJson(json);
}
