import 'package:fitness_app/theme.dart';
import 'package:flutter/material.dart';

class MiniChip extends StatelessWidget {
  const MiniChip({
    super.key,
    required this.text,
    this.icon,
    this.backgroundColor,
  });

  final Widget? icon;
  final Widget text;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final icon = this.icon;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: backgroundColor ?? theme.colorScheme.primary,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            IconTheme(
              data: const IconThemeData(color: darkColor, size: 16.0),
              child: icon,
            ),
            const SizedBox(width: 4.0),
          ],
          DefaultTextStyle(style: theme.textTheme.bodySmall!, child: text),
        ],
      ),
    );
  }
}
