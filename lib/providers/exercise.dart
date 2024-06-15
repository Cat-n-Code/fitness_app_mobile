import 'dart:convert';
import 'dart:io';

import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/providers/workouts.dart';
import 'package:fitness_app/utils/api.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fitness_app/utils/exceptions.dart';
import 'package:fitness_app/utils/result.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exercise.g.dart';

@riverpod
Future<List<ExerciseTemplate>> myExerciseTemplates(
  MyExerciseTemplatesRef ref,
  int page,
  int pageSize,
  String? nameParam,
  String? muscleParam,
  String? equipmentParam,
  ExerciseType? typeParam,
  ExerciseDifficulty? difficultyParam,
) async {
  final result = await apiFetch(
    HttpMethod.get,
    '/exercises/users/current',
    ref: ref,
    params: {
      'page': page.toString(),
      'size': pageSize.toString(),
      if (nameParam != null) 'name': nameParam,
      if (muscleParam != null) 'muscle': muscleParam,
      if (equipmentParam != null) 'equipment': equipmentParam,
      if (typeParam != null) 'type': typeParam.jsonValue,
      if (difficultyParam != null) 'difficulty': difficultyParam.jsonValue,
    },
  );

  switch (result) {
    case Left(value: final response):
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      final page = (data as List)
          .map((d) => ExerciseTemplate.fromJson(d as Map<String, Object?>))
          .toList();
      return page;
    case Right(value: final exception):
      presentError(exception, ref: ref);
      throw exception;
  }
}

@riverpod
class ExerciseTemplateNotifier extends _$ExerciseTemplateNotifier {
  @override
  Future<Option<ExerciseTemplate>> build(int id) async {
    final result = await apiFetch(HttpMethod.get, '/exercises/$id', ref: ref);

    switch (result) {
      case Left(value: final response):
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        return Option.of(ExerciseTemplate.fromJson(data));
      case Right(value: final exception):
        if (exception case ApiException()
            when exception.statusCode == HttpStatus.notFound) {
          return const Option.none();
        }
        presentError(exception, ref: ref);
        throw exception;
    }
  }

  Future<ApiResult<ExerciseTemplate>> updateExercise(Exercise exercise) async {
    final oldExercise = state.valueOrNull?.toNullable();
    if (oldExercise == null) {
      throw StateError('Invalid notifier state');
    }

    state = const AsyncValue.loading();

    final body = jsonEncode(exercise.toJson());
    final result = await apiFetch(
      HttpMethod.put,
      '/exercises',
      ref: ref,
      body: body,
    );
    switch (result) {
      case Left(value: final response):
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        final exercise = ExerciseTemplate.fromJson(data);
        state = AsyncValue.data(Option.of(exercise));
        return ApiResult.left(exercise);
      case Right(value: final exception):
        state = AsyncValue.data(Option.of(oldExercise));
        return ApiResult.right(exception);
    }
  }
}

@riverpod
Future<Option<Exercise>> exerciseById(
  ExerciseByIdRef ref,
  int workoutId,
  int id,
) async {
  final workout = await ref.watch(workoutNotifierProvider(workoutId).future);
  return workout.flatMap(
    (w) => w.exercises.filter((e) => e.id == id).firstOption,
  );
}
