import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress.freezed.dart';
part 'progress.g.dart';

@freezed
class StepsEntry with _$StepsEntry {
  const StepsEntry._();

  const factory StepsEntry({
    required int steps,
    @JsonKey(name: 'goal_steps') int? goalSteps,
    @JsonKey(name: 'date_field') required DateTime timestamp,
  }) = _StepsEntry;

  factory StepsEntry.fromJson(Map<String, Object?> json) =>
      _$StepsEntryFromJson(json);

  factory StepsEntry.mock() => StepsEntry(
        steps: 1000,
        goalSteps: 10000,
        timestamp: DateTime.now(),
      );

  (DateTime, double) asTuple() => (timestamp, steps.toDouble());
}

@freezed
class WaterEntry with _$WaterEntry {
  const WaterEntry._();

  const factory WaterEntry({
    @JsonKey(name: 'water_volume') required int waterVolume,
    @JsonKey(name: 'goal_water_volume') int? goalWaterVolume,
    @JsonKey(name: 'date_field') required DateTime timestamp,
  }) = _WaterEntry;

  factory WaterEntry.fromJson(Map<String, Object?> json) =>
      _$WaterEntryFromJson(json);

  factory WaterEntry.mock() => WaterEntry(
        waterVolume: 1000,
        timestamp: DateTime.now(),
      );

  (DateTime, double) asTuple() => (timestamp, waterVolume.toDouble());
}
