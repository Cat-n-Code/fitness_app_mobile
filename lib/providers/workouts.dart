import 'package:fitness_app/models/workout.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workouts.g.dart';

const _fakeExercisesTemplates = [
  ExerciseTemplate(
    id: 1,
    name: 'Велосипед',
    muscle: 'Пресс',
    additionalMuscle: 'Пресс',
    type: 'Базовое',
    equipment: 'Отсутствует',
    difficulty: 'Начинающий',
    photosUrls: [
      'assets/images/fake_exercises/1_0.jpeg',
      'assets/images/fake_exercises/1_1.jpeg',
      'assets/images/fake_exercises/1_2.jpeg',
    ],
  ),
  ExerciseTemplate(
    id: 2,
    name: '«Восьмерки» с гирей',
    muscle: 'Пресс',
    additionalMuscle: 'Пресс',
    type: 'Базовое',
    equipment: 'Гири',
    difficulty: 'Средний',
    photosUrls: [
      'assets/images/fake_exercises/2_0.jpeg',
      'assets/images/fake_exercises/2_1.jpeg',
      'assets/images/fake_exercises/2_2.jpeg',
      'assets/images/fake_exercises/2_3.jpeg',
    ],
  ),
  ExerciseTemplate(
    id: 3,
    name: '«Кошачья» растяжка',
    muscle: 'Нижняя часть спины',
    additionalMuscle: 'Нижняя часть спины',
    type: 'Базовое',
    equipment: 'Отсутствует',
    difficulty: 'Начинающий',
    photosUrls: [
      'assets/images/fake_exercises/3_0.jpeg',
      'assets/images/fake_exercises/3_1.jpeg',
    ],
  ),
];
final _fakeExercises = [
  Exercise(
    id: 1,
    template: _fakeExercisesTemplates[0],
    setsCount: 2,
    goalSetsCount: 3,
  ),
  Exercise(
    id: 2,
    template: _fakeExercisesTemplates[1],
    setsCount: 0,
    goalSetsCount: 5,
  ),
  Exercise(
    id: 3,
    template: _fakeExercisesTemplates[2],
    setsCount: 1,
    goalSetsCount: 1,
  ),
];
const _fakeWorkoutsTemplates = [
  WorkoutTemplate(
    id: 1,
    name: 'Muscle Building',
    description: 'Full Body',
    exercises: _fakeExercisesTemplates,
  ),
  WorkoutTemplate(
    id: 2,
    name: 'Strenght & Endurance',
    description: 'Full Body',
    exercises: _fakeExercisesTemplates,
  ),
  WorkoutTemplate(
    id: 3,
    name: 'Glutes & Quads',
    description: 'HIIT workout',
    exercises: _fakeExercisesTemplates,
  ),
];
final _fakeWorkouts = [
  Workout(
    id: 1,
    template: _fakeWorkoutsTemplates[0],
    exercises: _fakeExercises,
    completionDate: DateTime(2024, 7, 21),
  ),
  Workout(
    id: 2,
    template: _fakeWorkoutsTemplates[1],
    exercises: _fakeExercises,
    completionDate: DateTime(2024, 7, 17),
  ),
  Workout(
    id: 3,
    template: _fakeWorkoutsTemplates[2],
    exercises: _fakeExercises,
    completionDate: DateTime(2024, 7, 19),
  ),
];

@riverpod
Future<Option<ExerciseTemplate>> exerciseTemplateById(
  ExerciseTemplateByIdRef ref,
  int id,
) async {
  final templates = await ref.watch(exerciseTemplatesNotifierProvider.future);
  return templates.filter((t) => t.id == id).firstOption;
}

@riverpod
class ExerciseTemplatesNotifier extends _$ExerciseTemplatesNotifier {
  @override
  Future<List<ExerciseTemplate>> build() async {
    return await _fetchTemplates();
  }

  Future<void> updateTemplates() async {
    final templates = await _fetchTemplates();
    state = AsyncValue.data(templates);
  }

  Future<List<ExerciseTemplate>> _fetchTemplates() async {
    await Future.delayed(const Duration(seconds: 1));
    return _fakeExercisesTemplates;
  }
}

@riverpod
Future<Option<WorkoutTemplate>> workoutTemplateById(
  WorkoutTemplateByIdRef ref,
  int id,
) async {
  final templates = await ref.watch(workoutsTemplatesNotifierProvider.future);
  return templates.filter((t) => t.id == id).firstOption;
}

@riverpod
class WorkoutsTemplatesNotifier extends _$WorkoutsTemplatesNotifier {
  @override
  Future<List<WorkoutTemplate>> build() async {
    return await _fetchTemplates();
  }

  Future<void> updateTemplates() async {
    final templates = await _fetchTemplates();
    state = AsyncValue.data(templates);
  }

  Future<List<WorkoutTemplate>> _fetchTemplates() async {
    await Future.delayed(const Duration(seconds: 1));
    return _fakeWorkoutsTemplates;
  }
}

@riverpod
Future<Option<Workout>> workoutById(WorkoutByIdRef ref, int id) async {
  final workouts = await ref.watch(customerWorkoutsNotifierProvider.future);
  return workouts.filter((w) => w.id == id).firstOption;
}

@riverpod
class CustomerWorkoutsNotifier extends _$CustomerWorkoutsNotifier {
  @override
  Future<List<Workout>> build() async {
    return await _fetchWorkouts();
  }

  Future<void> updateWorkouts() async {
    final workouts = await _fetchWorkouts();
    state = AsyncValue.data(workouts);
  }

  Future<List<Workout>> _fetchWorkouts() async {
    await Future.delayed(const Duration(seconds: 1));
    return _fakeWorkouts;
  }
}
