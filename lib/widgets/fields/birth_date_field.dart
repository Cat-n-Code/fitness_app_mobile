import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/theme.dart';

class BirthDateField extends StatefulWidget {
  const BirthDateField({
    super.key,
    required this.birthDate,
    required this.onValueChanged,
  });

  final DateTime? birthDate;
  final void Function(DateTime) onValueChanged;

  @override
  State<BirthDateField> createState() => _BirthDateFieldState();
}

class _BirthDateFieldState extends State<BirthDateField> {
  final _fieldKey = GlobalKey<FormFieldState>();
  final _textController = TextEditingController();

  @override
  void didUpdateWidget(BirthDateField oldWidget) {
    super.didUpdateWidget(oldWidget);

    final locale = EasyLocalization.of(context)!.locale;
    final format = DateFormat.yMd(locale.toLanguageTag());
    final birthDate = widget.birthDate;

    _textController.text = birthDate != null ? format.format(birthDate) : '';
  }

  @override
  Widget build(BuildContext context) {
    final locale = EasyLocalization.of(context)!.locale;
    final format = DateFormat.yMd(locale.toLanguageTag());

    return TextFormField(
      key: _fieldKey,
      controller: _textController,
      decoration: InputDecoration(
        hintText: format.format(DateTime.now()),
        suffixIcon: const Icon(Icons.calendar_month),
      ).applyDefaults(outlinedPrimaryInputDecoration),
      keyboardType: TextInputType.none,
      readOnly: true,
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          locale: locale,
          firstDate: DateTime.now().subtract(
            const Duration(days: 30 * 12 * 99),
          ),
          lastDate: DateTime.now(),
        );
        if (date != null) {
          widget.onValueChanged(date);
        }
      },
    );
  }
}
