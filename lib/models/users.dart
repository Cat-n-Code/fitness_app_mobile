import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'users.freezed.dart';
part 'users.g.dart';

enum Role {
  @JsonValue('CUSTOMER')
  customer,
  @JsonValue('COACH')
  couch;
}

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

enum CoachSpecialty {
  @JsonValue('KIDS')
  kids('common.coach_specialty.kids'),
  @JsonValue('ADULT')
  adult('common.coach_specialty.adults'),
  @JsonValue('YOGA')
  yoga('common.coach_specialty.yoga');

  const CoachSpecialty(this.translationKey);

  final String translationKey;
}

@freezed
class User with _$User {
  const User._();

  const factory User({
    required int id,
    required String name,
    required String email,
    required Role role,
    Sex? sex,
    @JsonKey(name: 'birth_date') DateTime? birthDate,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  factory User.mock() => User(
        id: 1,
        name: BoneMock.name,
        email: BoneMock.email,
        role: Role.customer,
        sex: Sex.male,
        birthDate: DateTime.now(),
      );

  ImageProvider get photo => switch (sex) {
        Sex.male => const AssetImage('assets/images/avatars/male.png'),
        Sex.female => const AssetImage('assets/images/avatars/female.png'),
        _ => const AssetImage('assets/images/avatars/unknown.png')
      };

  int? get age =>
      birthDate != null ? AgeCalculator.age(birthDate!).years : null;
}

@freezed
class Customer with _$Customer {
  const factory Customer({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    UserGoal? goal,
    @JsonKey(name: 'fitness_level') FitnessLevel? level,
    ExercisePreference? preference,
  }) = _Customer;

  factory Customer.fromJson(Map<String, Object?> json) =>
      _$CustomerFromJson(json);

  factory Customer.mock() => const Customer(
        id: 1,
        userId: 1,
        goal: UserGoal.beActive,
        level: FitnessLevel.novice,
        preference: ExercisePreference.other,
      );
}

@freezed
class Coach with _$Coach {
  const factory Coach({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    required CoachSpecialty speciality,
  }) = _Coach;

  factory Coach.fromJson(Map<String, Object?> json) => _$CoachFromJson(json);

  factory Coach.mock() => const Coach(
        id: 1,
        userId: 1,
        speciality: CoachSpecialty.adult,
      );
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
    @JsonKey(name: 'fitness_level') FitnessLevel? level,
    ExercisePreference? preference,
  }) = _UserRegistrationForm;

  factory UserRegistrationForm.fromJson(Map<String, Object?> json) =>
      _$UserRegistrationFormFromJson(json);
}
