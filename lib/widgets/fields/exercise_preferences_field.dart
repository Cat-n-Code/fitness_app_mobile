import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/radio_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExercisePreferencesField extends StatelessWidget {
  const ExercisePreferencesField({
    super.key,
    required this.preference,
    required this.onValueChanged,
  });

  final ExercisePreference? preference;
  final void Function(ExercisePreference) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: ExercisePreference.values.map(_buildRadioTile).toList(),
    );
  }

  Widget _buildRadioTile(ExercisePreference current) => Skeleton.leaf(
        child: RadioTile(
          value: current,
          groupValue: preference,
          onChanged: (p) => onValueChanged(p!),
          addRadio: false,
          style: secondaryRadioTileStyle,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(current.icon, size: 24.0),
              const SizedBox(height: 4.0),
              Text(current.translationKey, textAlign: TextAlign.center).tr(),
            ],
          ),
        ),
      );
}
