import 'package:fitness_app/models/workout.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workouts.g.dart';

const _fakeExercises = [
  Exercise(
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
    isCompleted: true,
  ),
  Exercise(
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
    isCompleted: true,
  ),
  Exercise(
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
    isCompleted: true,
  ),
];

@riverpod
Future<Option<Workout>> workoutById(WorkoutByIdRef ref, int id) async {
  final workouts = await ref.watch(customerWorkoutsNotifierProvider.future);
  return workouts.filter((w) => w.id == id).firstOption;
}

@Riverpod(keepAlive: true)
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
    return [
      Workout(
        id: 1,
        name: 'Muscle Building',
        description: 'Full Body',
        completionDate: DateTime(2024, 6, 20),
        exercises: _fakeExercises,
      ),
      Workout(
        id: 2,
        name: 'Strenght & Endurance',
        description: 'Full Body',
        completionDate: DateTime(2024, 6, 20),
        exercises: _fakeExercises,
      ),
      Workout(
        id: 3,
        name: 'Glutes & Quads',
        description: 'HIIT workout',
        completionDate: DateTime(2024, 6, 20),
        exercises: _fakeExercises,
      ),
    ];
  }
}
