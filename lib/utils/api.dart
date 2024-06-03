import 'dart:ui';

Map<String, String> buildHeaders({String? token, Locale? locale}) {
  final headers = <String, String>{};

  headers['Accepts'] = 'application/json';
  headers['Content-Type'] = 'application/json';

  if (token != null) {
    headers['Authorization'] = 'Bearer $token';
  }

  if (locale != null) {
    headers['Accept-Language'] = locale.toLanguageTag();
  }

  return headers;
}
