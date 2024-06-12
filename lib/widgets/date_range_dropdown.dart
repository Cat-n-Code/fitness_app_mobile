import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum DateRange {
  thisWeek('common.date_range.this_week'),
  lastWeek('common.date_range.last_week');
  // twoWeeks('common.date_range.two_weeks');

  const DateRange(this.translationKey);

  final String translationKey;

  DateTime get startTime {
    final now = DateTime.now();
    final thisDay = DateTime(now.year, now.month, now.day);

    return switch (this) {
      DateRange.thisWeek => thisDay.subtract(const Duration(days: 7)),
      DateRange.lastWeek => thisDay.subtract(const Duration(days: 14)),
      // DateRange.twoWeeks => thisDay.subtract(const Duration(days: 14)),
    };
  }

  DateTime get endTime {
    final now = DateTime.now();
    final thisDay = DateTime(now.year, now.month, now.day);

    return switch (this) {
      DateRange.thisWeek => thisDay,
      DateRange.lastWeek => thisDay.subtract(const Duration(days: 7)),
      // DateRange.twoWeeks => thisDay
    };
  }
}

class DateRangeDropdown extends StatelessWidget {
  const DateRangeDropdown({
    super.key,
    required this.currentRange,
    required this.onChanged,
  });

  final DateRange currentRange;
  final void Function(DateRange?) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Skeleton.unite(
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: currentRange,
          onChanged: onChanged,
          focusColor: theme.colorScheme.surfaceDim,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          borderRadius: BorderRadius.circular(16.0),
          items: DateRange.values
              .map(
                (r) => DropdownMenuItem(
                  value: r,
                  child: Text(r.translationKey).tr(),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
