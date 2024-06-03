import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/widgets/radio_tile.dart';

class UserGoalField extends StatelessWidget {
  const UserGoalField({
    super.key,
    required this.goal,
    required this.onValueChanged,
  });

  final UserGoal? goal;
  final void Function(UserGoal) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: UserGoal.values
          .map(
            (goal) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: RadioTile(
                value: goal,
                groupValue: this.goal,
                onChanged: (g) => onValueChanged(g!),
                child: _buildRadioTileBody(
                  goal.icon,
                  goal.translationKey.tr(context: context),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildRadioTileBody(IconData icon, String text) => Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8.0),
          Expanded(child: Text(text)),
        ],
      );
}
