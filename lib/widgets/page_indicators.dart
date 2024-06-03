import 'package:flutter/material.dart';

class PageIndicators extends StatelessWidget {
  const PageIndicators({
    super.key,
    required this.pagesCount,
    required this.page,
    this.color,
  });

  final int pagesCount;
  final int page;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: Iterable.generate(
        pagesCount,
        (i) => _buildIndicator(i, colorScheme),
      ).toList(),
    );
  }

  Widget _buildIndicator(int index, ColorScheme colorScheme) {
    return AnimatedSwitcher(
      duration: Durations.short3,
      child: TabPageSelectorIndicator(
        key: ValueKey((index, index == page)),
        backgroundColor: (index == page
            ? (color ?? colorScheme.primary)
            : Colors.transparent),
        borderColor: color ?? colorScheme.primary,
        borderStyle: BorderStyle.solid,
        size: 12.0,
      ),
    );
  }
}
