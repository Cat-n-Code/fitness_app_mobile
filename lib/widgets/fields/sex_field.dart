import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/models/radio_tile_style.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/radio_tile.dart';

class SexField extends StatelessWidget {
  const SexField({
    super.key,
    required this.sex,
    required this.onValueChanged,
  });

  final Sex? sex;
  final void Function(Sex) onValueChanged;

  @override
  Widget build(BuildContext context) {
    final radioTileStyle = secondaryRadioTileStyle.copyWith(
      textStyle: secondaryRadioTileStyle.textStyle.copyWith(
        fontSize: 18.0,
      ),
      selectedTextStyle: secondaryRadioTileStyle.selectedTextStyle.copyWith(
        fontSize: 18.0,
      ),
      iconTheme: secondaryRadioTileStyle.iconTheme.copyWith(
        size: 36.0,
      ),
      selectedIconTheme: secondaryRadioTileStyle.selectedIconTheme.copyWith(
        size: 36.0,
      ),
    ) as RadioTileStyle;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: Sex.values.map((gender) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: RadioTile(
            value: gender,
            groupValue: sex,
            onChanged: (g) => onValueChanged(g!),
            addRadio: false,
            style: radioTileStyle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(gender.translationKey).tr(),
                const SizedBox(height: 4.0),
                Icon(gender.icon),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
