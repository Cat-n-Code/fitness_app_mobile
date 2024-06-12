import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_entry.freezed.dart';
part 'progress_entry.g.dart';

@freezed
class ProgressEntry with _$ProgressEntry {
  const factory ProgressEntry({
    required int id,
    required int steps,
    @Default(0.0) double waterVolume,
    @JsonKey(name: 'date_field') required DateTime timestamp,
  }) = _ProgressEntry;

  factory ProgressEntry.fromJson(Map<String, Object?> json) =>
      _$ProgressEntryFromJson(json);

  factory ProgressEntry.mock() => ProgressEntry(
        id: 1,
        steps: 1000,
        waterVolume: 1000.0,
        timestamp: DateTime.now(),
      );
}
