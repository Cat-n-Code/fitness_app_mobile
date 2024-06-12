import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/radio_tile_style.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/radio_tile.dart';
import 'package:flutter/material.dart';

class MiniCalendar extends StatefulWidget {
  const MiniCalendar({super.key, required this.onWeekdaySelected, this.color});

  final void Function(int) onWeekdaySelected;
  final Color? color;

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
      child: Row(
        children: [
          for (var i = -2; i < 3; ++i)
            _buildDayChip(
              DateTime.now().add(Duration(days: i)),
              i,
              theme.textTheme,
            )
        ],
      ),
    );
  }

  Widget _buildDayChip(DateTime date, int weekday, TextTheme textTheme) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: RadioTile(
          value: weekday,
          groupValue: _selectedWeekday,
          onChanged: _onWeekdayChanged,
          addRadio: false,
          style: primaryFilledRadioStyle.copyWith(selectedColor: widget.color)
              as RadioTileStyle,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                date.day.toString(),
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              Text(DateFormat.E().format(date))
            ],
          ),
        ),
      ),
    );
  }

  void _onWeekdayChanged(int? weekday) {
    setState(() => _selectedWeekday = weekday!);
  }
}
