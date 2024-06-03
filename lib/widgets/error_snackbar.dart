import 'package:flutter/material.dart';
import 'package:fitness_app/theme.dart';

SnackBar buildErrorSnackBar(String message) {
  return SnackBar(
    content: Row(
      children: [
        Icon(Icons.error_outline, color: colorScheme.error),
        const SizedBox(width: 8.0),
        Expanded(child: Text(message))
      ],
    ),
  );
}
