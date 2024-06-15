import 'dart:convert';
import 'dart:io';

import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/utils/api.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fitness_app/utils/exceptions.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workouts.g.dart';

@riverpod
Future<List<Workout>> myWorkouts(
  MyWorkoutsRef ref,
  int page,
  int pageSize,
  String? nameParam,
) async {
  final result = await apiFetch(
    HttpMethod.get,
    '/workouts/users/get/me',
    ref: ref,
    params: {
      'page': page.toString(),
      'size': pageSize.toString(),
      if (nameParam != null) 'name': nameParam,
    },
  );

  switch (result) {
    case Left(value: final response):
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      final workouts = (data as List)
          .map((d) => Workout.fromJson(d as Map<String, Object?>))
          .toList();
      return workouts;
    case Right(value: final exception):
      presentError(exception, ref: ref);
      throw exception;
  }
}

@riverpod
Future<List<Workout>> userWorkouts(
  UserWorkoutsRef ref,
  int userId,
  int page,
  int pageSize,
) async {
  final result = await apiFetch(
    HttpMethod.get,
    '/workouts/users/$userId',
    ref: ref,
    params: {
      'page': page.toString(),
      'size': pageSize.toString(),
    },
  );

  switch (result) {
    case Left(value: final response):
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      final workouts = (data as List)
          .map((d) => Workout.fromJson(d as Map<String, Object?>))
          .toList();
      return workouts;
    case Right(value: final exception):
      presentError(exception, ref: ref);
      throw exception;
  }
}

@riverpod
class WorkoutNotifier extends _$WorkoutNotifier {
  @override
  Future<Option<Workout>> build(int id) async {
    final result = await apiFetch(HttpMethod.get, '/workouts/$id', ref: ref);

    switch (result) {
      case Left(value: final response):
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        final workout = Workout.fromJson(data);
        return Option.of(workout);
      case Right(value: final exception):
        if (exception case ApiException()
            when exception.statusCode == HttpStatus.notFound) {
          return const Option.none();
        }
        presentError(exception, ref: ref);
        throw exception;
    }
  }
}
