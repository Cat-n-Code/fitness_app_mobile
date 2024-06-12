import 'dart:math';

import 'package:fitness_app/models/progress_entry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'progress.g.dart';

@riverpod
Future<List<ProgressEntry>> myProgress(
  MyProgressRef ref,
  DateTime start,
  DateTime end,
) async {
  await Future.delayed(const Duration(milliseconds: 400));

  final random = Random();
  final result = <ProgressEntry>[];
  int i = 1;
  for (var d = start.copyWith();
      d.isBefore(end);
      d = d.add(const Duration(days: 1))) {
    result.add(ProgressEntry(
      id: i++,
      steps: random.nextInt(10000),
      waterVolume: random.nextDouble() * 2000.0,
      timestamp: d,
    ));
  }

  return result;
}
