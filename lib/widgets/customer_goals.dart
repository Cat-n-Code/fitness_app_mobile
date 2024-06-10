import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/theme.dart';
import 'package:flutter/material.dart';

class CustomerGoals extends StatelessWidget {
  const CustomerGoals({super.key, this.editable = false});

  final bool editable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildGoalButton(
          Icons.directions_walk,
          'common.mock_goals.1'.tr(context: context),
        ),
        const SizedBox(height: 8.0),
        _buildGoalButton(
          Icons.water_drop_outlined,
          'common.mock_goals.2'.tr(context: context),
        ),
      ],
    );
  }

  Widget _buildGoalButton(IconData icon, String name) {
    return OutlinedButton(
      onPressed: () => (),
      style: primaryOutlinedButton,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8.0),
          Expanded(child: Text(name)),
          Icon(editable ? Icons.edit : Icons.radio_button_unchecked),
        ],
      ),
    );
  }
}
