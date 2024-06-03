import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/config.dart';
import 'package:fitness_app/providers/auth.dart';
import 'package:fitness_app/routers.dart';
import 'package:fitness_app/utils/api.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fitness_app/utils/exceptions.dart';
import 'package:fitness_app/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'users.g.dart';

@Riverpod(keepAlive: true)
class CurrentUserNotifier extends _$CurrentUserNotifier {
  @override
  Future<Option<User>> build() async {
    final preferences = await SharedPreferences.getInstance();
    final token = await ref.watch(authTokenNotifierProvider.future);

    if (token.isNone()) {
      preferences.remove('currentUser');
      return const Option.none();
    }

    final future = _fetchCurrentUser().then((result) {
      switch (result) {
        case Left(value: final user):
          return Option.of(user);
        case Right(value: final exception):
          presentError(exception, ref: ref);

          if (exception case ApiException(response: final response)
              when response.statusCode == HttpStatus.unauthorized) {
            ref.read(authTokenNotifierProvider.notifier).resetToken();
            router.go('/login');
          }

          return const Option<User>.none();
      }
    });

    final userData = preferences.getString('currentUser');
    if (userData == null) {
      return await future;
    } else {
      future.then((result) {
        if (result case Some(value: final user)) {
          state = AsyncValue.data(Option.of(user));
        }
      });

      return Option.of(
        User.fromJson(jsonDecode(userData)),
      );
    }
  }

  Future<Result<User>> updateUser(User user) async {
    final oldUser = state.valueOrNull?.toNullable();
    if (oldUser == null) {
      throw StateError('Invalid notifier state');
    }

    state = const AsyncValue.loading();

    final preferences = await SharedPreferences.getInstance();
    final String token;
    final result = await ref.read(authTokenNotifierProvider.future);
    switch (result) {
      case Some(value: final t):
        token = t;
      case None():
        state = const AsyncValue.data(Option.none());
        throw StateError('token is not available');
    }

    final config = ref.read(configProvider);
    if (config.enableFakeApi) {
      await Future.delayed(const Duration(milliseconds: 500));
    } else {
      try {
        final body = jsonEncode(user.toJson());
        final response = await http
            .put(
              config.apiBaseUrl.resolve('/users/current'),
              body: body,
              headers: buildHeaders(token: token),
            )
            .timeout(config.apiTimeLimit);

        if (response.statusCode != HttpStatus.ok) {
          throw ApiException(response);
        }

        user = User.fromJson(
          jsonDecode(response.body),
        );
      } on Exception catch (e) {
        state = AsyncValue.data(Option.of(oldUser));
        return Result.right(e);
      }
    }

    state = AsyncValue.data(Option.of(user));
    await preferences.setString('currentUser', jsonEncode(user.toJson()));

    return Result.left(user);
  }

  Future<Result<User>> _fetchCurrentUser() async {
    final preferences = await SharedPreferences.getInstance();
    final String token;
    final result = await ref.read(authTokenNotifierProvider.future);
    switch (result) {
      case Some(value: final t):
        token = t;
      case None():
        throw StateError('token is not available');
    }

    final User user;
    final config = ref.read(configProvider);
    if (config.enableFakeApi) {
      await Future.delayed(const Duration(milliseconds: 500));

      final data = preferences.getString('userRegistrationForm');
      if (data == null) {
        return Result.right(
          ApiException(http.Response('', HttpStatus.notFound)),
        );
      }

      user = User.fromJson(jsonDecode(data));
    } else {
      try {
        final response = await http
            .get(
              config.apiBaseUrl.resolve('/users/current'),
              headers: buildHeaders(token: token),
            )
            .timeout(config.apiTimeLimit);

        if (response.statusCode != HttpStatus.ok) {
          throw ApiException(response);
        }

        user = User.fromJson(
          jsonDecode(response.body),
        );
      } on Exception catch (e) {
        return Result.right(e);
      }
    }

    await preferences.setString('currentUser', jsonEncode(user.toJson()));

    return Result.left(user);
  }
}

@riverpod
class UserRegistrationNotifier extends _$UserRegistrationNotifier {
  @override
  UserRegistrationForm build() {
    return const UserRegistrationForm();
  }

  void updateForm(UserRegistrationForm form) {
    state = form;
  }

  Future<Result<User>> registerUser() async {
    final User user;

    try {
      final config = ref.read(configProvider);
      if (config.enableFakeApi) {
        await Future.delayed(const Duration(seconds: 2));

        final preferences = await SharedPreferences.getInstance();
        final json = state.toJson();
        json['id'] = 1;

        await preferences.setString('userRegistrationForm', jsonEncode(json));
        user = User.fromJson(json);
      } else {
        final body = jsonEncode(state.toJson());
        final response = await http
            .post(
              config.apiBaseUrl.resolve('/users/registration'),
              body: body,
              headers: buildHeaders(),
            )
            .timeout(config.apiTimeLimit);

        if (response.statusCode != HttpStatus.ok) {
          throw ApiException(response);
        }

        user = User.fromJson(jsonDecode(response.body));
      }

      final token = await ref
          .read(authTokenNotifierProvider.notifier)
          .authorize(state.email!, state.password!);

      if (token case Right(value: final e)) {
        throw e;
      }
    } on Exception catch (e) {
      return Result.right(e);
    }

    return Result.left(user);
  }
}
