import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:fitness_app/providers/auth.dart';
import 'package:fitness_app/providers/config.dart';
import 'package:fitness_app/providers/locale.dart';
import 'package:fitness_app/utils/exceptions.dart';
import 'package:fitness_app/utils/result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

enum HttpMethod {
  get('GET'),
  post('POST'),
  put('PUT'),
  delete('DELETE');

  const HttpMethod(this.name);
  final String name;
}

Future<ApiResult<Response>> apiFetch(
  HttpMethod method,
  String path, {
  Ref? ref,
  WidgetRef? widgetRef,
  bool authorize = true,
  Object? body,
  Map<String, String>? headers,
  Map<String, String>? params,
  Duration? timeLimit,
  Duration? minTime,
}) async {
  final AppConfig config;
  final Locale? locale;
  final Option<String> tokenOption;
  if (ref != null) {
    config = ref.read(configProvider);
    locale = ref.read(localeProvider).toNullable();
    tokenOption = authorize
        ? await ref.read(authTokenNotifierProvider.future)
        : const Option.none();
  } else if (widgetRef != null) {
    config = widgetRef.read(configProvider);
    locale = widgetRef.read(localeProvider).toNullable();
    tokenOption = authorize
        ? await widgetRef.read(authTokenNotifierProvider.future)
        : const Option.none();
  } else {
    throw ArgumentError('Any of ref or widgetRef arguments must not be null');
  }

  if (tokenOption case None() when authorize) {
    throw StateError(
      'HTTP get request use authorization, but token is not available',
    );
  }

  final url = config.apiBaseUrl.resolve(path).replace(queryParameters: params);
  final request = Request(method.name, url);

  request.headers['Accepts'] = 'application/json';
  if (body != null) {
    request.headers['Content-Type'] = 'application/json';
  }
  final String? token = tokenOption.toNullable();
  if (token != null) {
    request.headers['Authorization'] = 'Bearer $token';
  }
  if (locale != null) {
    request.headers['Accept-Language'] = locale.toLanguageTag();
  }
  if (headers != null) {
    request.headers.addEntries(headers.entries);
  }

  switch (body) {
    case String():
      request.bodyBytes = utf8.encode(body);
    case Uint8List():
      request.bodyBytes = body;
    case Map<String, String>():
      request.bodyFields = body;
    case _ when body != null:
      throw ArgumentError('Invalid type of request body');
  }

  final client = Client();
  try {
    final requestFuture =
        client.send(request).timeout(timeLimit ?? config.apiTimeLimit);

    await Future.delayed(minTime ?? config.apiMinTime);
    final streamedResponse = await requestFuture;
    final response = await Response.fromStream(streamedResponse);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      return Either.right(ApiException(response));
    } else {
      return Either.left(response);
    }
  } on Exception catch (exception) {
    return Either.right(exception);
  } finally {
    client.close();
  }
}
