import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/config.dart';
import 'package:fitness_app/utils/api.dart';
import 'package:fitness_app/utils/exceptions.dart';
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

  Future<Result<String>> authorize(
    String email,
    String password,
  ) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('authToken');

    state = const AsyncValue.loading();

    final String token;
    final config = ref.read(configProvider);
    if (config.enableFakeApi) {
      await Future.delayed(const Duration(seconds: 1));

      final data = preferences.getString('userRegistrationForm');
      if (data == null) {
        return Either.right(
          ApiException(http.Response('', HttpStatus.unauthorized)),
        );
      }
      final form = UserRegistrationForm.fromJson(jsonDecode(data));
      if (email != form.email || password != form.password) {
        return Either.right(
          ApiException(http.Response('', HttpStatus.unauthorized)),
        );
      }

      token = 'super_secret_token';
    } else {
      final body = jsonEncode({'email': email, 'password': password});
      final response = await http
          .post(
            config.apiBaseUrl.resolve('/auth/login'),
            body: body,
            headers: buildHeaders(),
          )
          .timeout(config.apiTimeLimit);

      if (response.statusCode != HttpStatus.ok) {
        final e = ApiException(response);
        await preferences.remove('authToken');
        state = AsyncValue.error(e, StackTrace.current);
        return Either.right(e);
      }

      final data = jsonDecode(response.body);
      token = data['token'] as String;
    }

    await preferences.setString('authToken', token);
    state = AsyncValue.data(Option.of(token));

    return Either.left(token);
  }
}
