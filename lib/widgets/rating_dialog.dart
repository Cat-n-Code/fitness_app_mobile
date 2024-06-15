import 'package:fitness_app/theme.dart';
import 'package:flutter/material.dart';

class RatingDialog extends StatefulWidget {
  const RatingDialog({
    super.key,
    required this.title,
    required this.body,
    required this.submitText,
    required this.cancelText,
    required this.onSubmitted,
    required this.onCanceled,
  });

  final Widget title;
  final Widget body;
  final Widget submitText;
  final Widget cancelText;
  final void Function(int rating) onSubmitted;
  final void Function() onCanceled;

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _rating = 5;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog.adaptive(
      title: widget.title,
      content: _buildRatingBar(theme.colorScheme),
      actions: [
        TextButton(
          onPressed: widget.onCanceled,
          child: widget.cancelText,
        ),
        TextButton(
          onPressed: () => widget.onSubmitted(_rating),
          child: widget.submitText,
        ),
      ],
    );
  }

  Widget _buildRatingBar(ColorScheme colorScheme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.body,
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 1; i <= 5; ++i)
              IconButton(
                onPressed: () => setState(() => _rating = i),
                icon: Icon(
                  Icons.star,
                  color: i <= _rating ? colorScheme.primary : darkColor,
                ),
              )
          ],
        ),
      ],
    );
  }
}
