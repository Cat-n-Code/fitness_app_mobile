import 'dart:math' as math;
import 'package:flutter/material.dart';

class IncrementCounter extends StatelessWidget {
  const IncrementCounter({
    super.key,
    required this.value,
    this.min,
    this.max,
    required this.onChanged,
    this.color,
  });

  final int value;
  final int? min;
  final int? max;
  final void Function(int) onChanged;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton.filled(
          onPressed: () => onChanged(
            min == null ? value - 1 : math.max(value - 1, min!),
          ),
          style: IconButton.styleFrom(backgroundColor: color),
          icon: const Icon(Icons.remove),
        ),
        const SizedBox(width: 24.0),
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 64.0),
        ),
        const SizedBox(width: 24.0),
        IconButton.filled(
          onPressed: () => onChanged(
            max == null ? value + 1 : math.min(value + 1, max!),
          ),
          style: IconButton.styleFrom(backgroundColor: color),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
