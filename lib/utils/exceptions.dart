import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart';

class ApiException implements Exception {
  const ApiException(this.response);

  final Response response;

  int get statusCode => response.statusCode;

  String localizedMessage() => switch (response.statusCode) {
        HttpStatus.badRequest => 'errors.bad_request'.tr(),
        HttpStatus.unauthorized => 'errors.unauthorized'.tr(),
        HttpStatus.forbidden => 'errors.forbidden'.tr(),
        HttpStatus.notFound => 'errors.not_found'.tr(),
        HttpStatus.conflict => 'errors.conflict'.tr(),
        HttpStatus.unprocessableEntity => 'errors.invalid_format'.tr(),
        HttpStatus.internalServerError => 'errors.internal_error'.tr(),
        _ => 'errors.unknown_error'.tr(),
      };

  @override
  String toString() =>
      'HTTP error ${response.request?.method} ${response.request?.url}: status ${response.statusCode}\nResponse body:\n${response.body}';
}
