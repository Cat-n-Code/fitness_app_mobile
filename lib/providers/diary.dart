import 'dart:convert';

import 'package:fitness_app/models/diary.dart';
import 'package:fitness_app/utils/api.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fitness_app/utils/extensions.dart';
import 'package:fitness_app/utils/result.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'diary.g.dart';

@riverpod
Future<DiaryEntry> diaryEntry(DiaryEntryRef ref, DateTime date) async {
  final result = await apiFetch(
    HttpMethod.get,
    '/diaries',
    ref: ref,
    params: {
      'date_start': date.toIso8601Date(),
      'date_finish': date.toIso8601Date(),
    },
  );

  switch (result) {
    case Left(value: final response):
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      final list = (data as List)
          .map((d) => DiaryEntry.fromJson(d as Map<String, Object?>))
          .toList();
      return list.firstOption.getOrElse(
        () => const DiaryEntry(feeling: DiaryMood.neutral),
      );
    case Right(value: final exception):
      presentError(exception, ref: ref);
      throw exception;
  }
}

@riverpod
class TodayDiaryEntryNotifier extends _$TodayDiaryEntryNotifier {
  @override
  Future<DiaryEntry> build() async {
    return await ref.watch(diaryEntryProvider(DateTime.now()).future);
  }

  Future<Result<Unit>> updateDiary(DiaryEntry entry) async {
    final result = await apiFetch(
      HttpMethod.put,
      '/diaries',
      ref: ref,
      body: jsonEncode(entry.toJson()),
    );

    switch (result) {
      case Left(value: final response):
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        state = AsyncData(DiaryEntry.fromJson(data));
        return Result.left(unit);
      case Right(value: final exception):
        return Result.right(exception);
    }
  }
}
