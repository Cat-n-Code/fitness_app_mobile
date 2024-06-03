import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:fitness_app/providers/scaffold_messenger.dart';
import 'package:fitness_app/utils/exceptions.dart';
import 'package:fitness_app/utils/logger.dart';
import 'package:fitness_app/widgets/error_snackbar.dart';

void presentError(
  Exception error, {
  StackTrace? stackTrace,
  WidgetRef? widgetRef,
  Ref? ref,
}) {
  log.e(
    'Error presented',
    error: error,
    stackTrace: stackTrace ?? StackTrace.current,
  );

  final localizedMessage = switch (error) {
    ClientException() => 'errors.network_error'.tr(),
    TimeoutException() => 'errors.timeout_error'.tr(),
    ApiException() => error.localizedMessage(),
    _ => 'errors.unknown_error'.tr(),
  };

  final snackBar = buildErrorSnackBar(localizedMessage);
  if (widgetRef != null) {
    widgetRef.read(scaffoldMessengerProvider)?.showSnackBar(snackBar);
  } else if (ref != null) {
    ref.read(scaffoldMessengerProvider)?.showSnackBar(snackBar);
  }
}
