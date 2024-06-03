import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:fitness_app/utils/api.dart';
import 'package:fitness_app/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth.g.dart';

@Riverpod(keepAlive: true)
class AuthTokenNotifier extends _$AuthTokenNotifier {
  @override
  Future<Option<String>> build() async {
    final preferences = await SharedPreferences.getInstance();
    return Option.fromNullable(
      preferences.getString('authToken'),
    );
  }

  Future<void> resetToken() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('authToken');
    state = const AsyncValue.data(Option.none());
  }

  Future<ApiResult<String>> authorize(String email, String password) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('authToken');

    state = const AsyncValue.loading();

    final String token;
    final body = jsonEncode({'email': email, 'password': password});
    final result = await apiFetch(
      HttpMethod.post,
      '/auth/login',
      ref: ref,
      body: body,
      authorize: false,
    );

    switch (result) {
      case Left(value: final response):
        final data = jsonDecode(response.body);
        token = data['token'] as String;
      case Right(value: final exception):
        await preferences.remove('authToken');
        state = AsyncValue.error(exception, StackTrace.current);
        return Either.right(exception);
    }

    await preferences.setString('authToken', token);
    state = AsyncValue.data(Option.of(token));

    return Either.left(token);
  }
}
