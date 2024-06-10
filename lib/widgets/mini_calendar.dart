import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MiniCalendar extends StatefulWidget {
  const MiniCalendar({
    super.key,
    required this.onWeekdaySelected,
  });

  final void Function(int) onWeekdaySelected;

  @override
  State<MiniCalendar> createState() => _MiniCalendarState();
}

class _MiniCalendarState extends State<MiniCalendar> {
  int _selectedWeekday = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 70.0,
      child: GridView.count(
        crossAxisCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0.0),
        children: [
          for (var i = -2; i < 3; ++i)
            _buildDayChip(
              DateTime.now().add(Duration(days: i)),
              i == _selectedWeekday,
              theme.textTheme,
              theme.colorScheme,
              (b) {
                setState(() {
                  _selectedWeekday = i;
                });
                if (b) {
                  widget.onWeekdaySelected(i);
                }
              },
            )
        ],
      ),
    );
  }

  Widget _buildDayChip(
    DateTime date,
    bool isSelected,
    TextTheme textTheme,
    ColorScheme colorScheme,
    void Function(bool) onSelected,
  ) {
    return ChoiceChip(
      selected: isSelected,
      showCheckmark: false,
      onSelected: onSelected,
      selectedColor: colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 12.0),
      label: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            date.day.toString(),
            style: textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(DateFormat.E().format(date))
        ],
      ),
    );
  }
}
