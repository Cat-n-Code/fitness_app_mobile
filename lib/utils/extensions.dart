extension DateTimeExtension on DateTime {
  String toIso8601Date() =>
      '${year.toString().padLeft(4, '0')}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
}

extension ListExtension<T extends num> on Iterable<T> {
  double? average() =>
      isNotEmpty ? reduce((a, b) => (a + b) as T) / length : null;
}
