import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

FormFieldValidator<T> compositeValidator<T>(
  Iterable<FormFieldValidator<T>> validators,
) {
  return (input) {
    for (var validator in validators) {
      final result = validator(input);
      if (result != null) {
        return result;
      }
    }

    return null;
  };
}

String? nonEmptyValidator(String? input) {
  if (input == null || input.isEmpty) {
    return 'validation.field_is_empty'.tr();
  }

  return null;
}

FormFieldValidator<String> minLengthValidator(int length) {
  return (input) {
    if (input != null && input.length < length) {
      return 'validation.field_too_short'.tr(args: [length.toString()]);
    }

    return null;
  };
}

final emailRegex = RegExp(
  r"^((([!#$%&'*+\-/=?^_`{|}~\w])|([!#$%&'*+\-/=?^_`{|}~\w][!#$%&'*+\-/=?^_`{|}~\.\w]{0,}[!#$%&'*+\-/=?^_`{|}~\w]))[@]\w+([-.]\w+)*\.\w+([-.]\w+)*)$",
);

String? emailValidator(String? input) {
  if (input != null && !emailRegex.hasMatch(input)) {
    return 'validation.invalid_email'.tr();
  }

  return null;
}

String? passwordValidator(String? input) {
  if (input == null) {
    return null;
  }

  if (input.isEmpty) {
    return 'validation.field_is_empty'.tr();
  }

  if (input.length < 8) {
    return 'validation.field_too_short'.tr(args: ['8']);
  }

  return null;
}
