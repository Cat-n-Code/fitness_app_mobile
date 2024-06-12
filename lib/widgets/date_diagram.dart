import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

typedef DateDiagramEntry = (DateTime, double);

class DateDiagram extends StatelessWidget {
  DateDiagram({super.key, required this.values, this.color})
      : _maxValue =
            values.isNotEmpty ? values.map((t) => t.$2).reduce(max) : 0.0,
        _minValue =
            values.isNotEmpty ? values.map((t) => t.$2).reduce(min) : 0.0;

  final List<DateDiagramEntry> values;
  final Color? color;
  final double _maxValue;
  final double _minValue;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TweenAnimationBuilder(
      tween: ColorTween(end: color ?? colorScheme.primary),
      duration: Durations.medium2,
      builder: _buildDiagram,
    );
  }

  Widget _buildDiagram(BuildContext context, Color? color, Widget? child) {
    final locale = EasyLocalization.of(context)!.locale;
    final dateFormat = DateFormat.E(locale.toLanguageTag());

    return Skeleton.unite(
      child: SizedBox(
        height: 200.0,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: darkColor, width: 1.0),
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: values
                .map((e) => _buildColumn(dateFormat.format(e.$1), e.$2, color!))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildColumn(String label, double progress, Color color) {
    final x = (progress - _minValue) / (_maxValue - _minValue);

    return TweenAnimationBuilder(
      tween: Tween(end: x.isFinite ? x : 0.0),
      curve: Curves.easeInOut,
      duration: Durations.medium2,
      builder: (context, value, child) => Expanded(
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: value,
                  child: Container(
                    width: 10.0,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
