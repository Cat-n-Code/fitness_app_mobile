import 'package:fitness_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MiniChip extends StatelessWidget {
  const MiniChip({
    super.key,
    required this.text,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
  });

  final Widget? icon;
  final Widget text;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final icon = this.icon;

    return Skeleton.unite(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(20.0),
          border: foregroundColor != null
              ? Border.all(color: foregroundColor!, width: 1.0)
              : null,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) ...[
              IconTheme(
                data: IconThemeData(
                  color: foregroundColor ?? darkColor,
                  size: 18.0,
                ),
                child: icon,
              ),
              const SizedBox(width: 4.0),
            ],
            DefaultTextStyle(
              style:
                  theme.textTheme.bodyMedium!.copyWith(color: foregroundColor),
              child: text,
            ),
          ],
        ),
      ),
    );
  }
}
