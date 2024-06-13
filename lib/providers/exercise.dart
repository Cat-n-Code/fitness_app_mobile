import 'dart:convert';
import 'dart:io';

import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/utils/api.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fitness_app/utils/exceptions.dart';
import 'package:fitness_app/utils/result.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exercise.g.dart';

@riverpod
Future<List<ExerciseTemplate>> myExercises(
  MyExercisesRef ref,
  int page,
  int pageSize,
) async {
  final result = await apiFetch(
    HttpMethod.get,
    '/exercises/users/current',
    ref: ref,
    params: {'page': page.toString(), 'size': pageSize.toString()},
  );

  switch (result) {
    case Left(value: final response):
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      final list = data as List<Map<String, Object?>>;
      final page = list.map((d) => ExerciseTemplate.fromJson(d)).toList();
      return page;
    case Right(value: final exception):
      presentError(exception, ref: ref);
      throw exception;
  }
}

@riverpod
class ExerciseNotifier extends _$ExerciseNotifier {
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

  Future<ApiResult<Unit>> deleteExercise() async {
    final exercise = state.valueOrNull?.toNullable();
    if (exercise == null) {
      throw StateError('Invalid notifier state');
    }

    state = const AsyncValue.loading();

    final result = await apiFetch(
      HttpMethod.delete,
      '/exercises/${exercise.id}',
      ref: ref,
    );
    switch (result) {
      case Left():
        state = const AsyncValue.data(Option.none());
        return ApiResult.left(unit);
      case Right(value: final exception):
        state = AsyncValue.data(Option.of(exercise));
        return ApiResult.right(exception);
    }
  }
}
