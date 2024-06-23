import 'dart:collection';
import 'dart:convert';

import 'package:fitness_app/models/progress.dart';
import 'package:fitness_app/utils/api.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fitness_app/utils/extensions.dart';
import 'package:fitness_app/utils/result.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'progress.g.dart';

@riverpod
Future<List<StepsEntry>> stepsProgress(
  StepsProgressRef ref,
  DateTime start,
  DateTime end,
) async {
  final result = await apiFetch(
    HttpMethod.get,
    '/steps',
    ref: ref,
    params: {
      'date_start': start.toIso8601Date(),
      'date_finish': end.toIso8601Date(),
    },
  );

  switch (result) {
    case Left(value: final response):
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      final entries = (data as List)
          .map((d) => StepsEntry.fromJson(d as Map<String, Object?>))
          .toList();
      final entriesMap = SplayTreeMap.fromIterable(
        entries,
        key: (e) => (e as StepsEntry).timestamp,
        value: (e) => (e as StepsEntry),
      );

      final newEntries = <StepsEntry>[];
      for (var d = DateTime(start.year, start.month, start.day);
          d.isBefore(end) || d.isAtSameMomentAs(end);
          d = d.add(const Duration(days: 1))) {
        newEntries.add(entriesMap[d] ?? StepsEntry(steps: 0, timestamp: d));
      }

      return newEntries;
    case Right(value: final exception):
      presentError(exception, ref: ref);
      throw exception;
  }
}

@riverpod
Future<List<WaterEntry>> waterProgress(
  WaterProgressRef ref,
  DateTime start,
  DateTime end,
) async {
  final result = await apiFetch(
    HttpMethod.get,
    '/waters',
    ref: ref,
    params: {
      'date_start': start.toIso8601Date(),
      'date_finish': end.toIso8601Date()
    },
  );

  switch (result) {
    case Left(value: final response):
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      final entries = (data as List)
          .map((d) => WaterEntry.fromJson(d as Map<String, Object?>))
          .toList();
      final entriesMap = SplayTreeMap.fromIterable(
        entries,
        key: (e) => (e as WaterEntry).timestamp,
        value: (e) => (e as WaterEntry),
      );

      final newEntries = <WaterEntry>[];
      for (var d = DateTime(start.year, start.month, start.day);
          d.isBefore(end) || d.isAtSameMomentAs(end);
          d = d.add(const Duration(days: 1))) {
        newEntries.add(
          entriesMap[d] ?? WaterEntry(waterVolume: 0, timestamp: d),
        );
      }

      return newEntries;
    case Right(value: final exception):
      presentError(exception, ref: ref);
      throw exception;
  }
}

@riverpod
class TodayStepsProgress extends _$TodayStepsProgress {
  @override
  Future<StepsEntry> build() async {
    final steps = await ref.watch(
      stepsProgressProvider(DateTime.now(), DateTime.now()).future,
    );

    return steps.first;
  }

  Future<Result<Unit>> updateSteps(int stepsCount) async {
    final body = jsonEncode(
      StepsEntry(steps: stepsCount, timestamp: DateTime.now()),
    );
    final result = await apiFetch(
      HttpMethod.put,
      '/steps',
      ref: ref,
      body: body,
    );

    switch (result) {
      case Left(value: final response):
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        state = AsyncValue.data(StepsEntry.fromJson(data));
        ref.invalidate(stepsProgressProvider);
        return Result.left(unit);
      case Right(value: final exception):
        return Result.right(exception);
    }
  }
}

@riverpod
class TodayWaterProgress extends _$TodayWaterProgress {
  @override
  Future<WaterEntry> build() async {
    final water = await ref.watch(
      waterProgressProvider(DateTime.now(), DateTime.now()).future,
    );

    return water.first;
  }

  Future<Result<Unit>> updateWater(int waterVolume) async {
    final body = jsonEncode(
      WaterEntry(waterVolume: waterVolume, timestamp: DateTime.now()),
    );
    final result = await apiFetch(
      HttpMethod.put,
      '/waters',
      ref: ref,
      body: body,
    );

    switch (result) {
      case Left(value: final response):
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        state = AsyncValue.data(WaterEntry.fromJson(data));
        ref.invalidate(waterProgressProvider);
        return Result.left(unit);
      case Right(value: final exception):
        return Result.right(exception);
    }
  }
}
