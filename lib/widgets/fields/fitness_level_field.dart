import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/radio_tile.dart';

class FitnessLevelField extends StatelessWidget {
  const FitnessLevelField({
    super.key,
    required this.fitnessLevel,
    required this.onValueChanged,
  });

  final FitnessLevel? fitnessLevel;
  final void Function(FitnessLevel) onValueChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final leadingTextStyle = textTheme.bodyMedium!.copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: darkColor,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: FitnessLevel.values.map(
        (level) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: RadioTile(
              value: level,
              groupValue: fitnessLevel,
              onChanged: (l) => onValueChanged(l!),
              child: _buildRadioTileBody(
                '${level.index + 1}/5',
                leadingTextStyle,
                level.translationKey.tr(context: context),
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  Widget _buildRadioTileBody(
    String leadingText,
    TextStyle leadingTextStyle,
    String bodyText,
  ) =>
      Row(
        children: [
          Text(leadingText, style: leadingTextStyle),
          const SizedBox(width: 16.0),
          Expanded(child: Text(bodyText)),
        ],
      );
}
