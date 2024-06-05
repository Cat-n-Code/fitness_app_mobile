import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/auth.dart';
import 'package:fitness_app/routers.dart';
import 'package:fitness_app/utils/api.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fitness_app/utils/exceptions.dart';
import 'package:fitness_app/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users.g.dart';

@Riverpod(keepAlive: true)
class CurrentUserNotifier extends _$CurrentUserNotifier {
  @override
  Future<Option<User>> build() async {
    final tokenOption = await ref.watch(authTokenNotifierProvider.future);
    if (tokenOption.isNone()) {
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

    return await future;
  }

  Future<ApiResult<User>> updateUser(User user) async {
    final oldUser = state.valueOrNull?.toNullable();
    if (oldUser == null) {
      throw StateError('Invalid notifier state');
    }

    state = const AsyncValue.loading();

    final body = jsonEncode(user.toJson());
    final result = await apiFetch(
      HttpMethod.put,
      '/users/current',
      ref: ref,
      body: body,
    );
    switch (result) {
      case Left(value: final response):
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        final user = User.fromJson(data);
        state = AsyncValue.data(Option.of(user));
        return ApiResult.left(user);
      case Right(value: final exception):
        state = AsyncValue.data(Option.of(oldUser));
        return ApiResult.right(exception);
    }
  }

  Future<ApiResult<User>> _fetchCurrentUser() async {
    final result = await apiFetch(HttpMethod.get, '/users/current', ref: ref);
    switch (result) {
      case Left(value: final response):
        final user = User.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)),
        );
        return ApiResult.left(user);
      case Right(value: final exception):
        return ApiResult.right(exception);
    }
  }
}

@Riverpod(keepAlive: true)
class CurrentCustomerNotifier extends _$CurrentCustomerNotifier {
  @override
  Future<Option<Customer>> build() async {
    final future = _fetchCurrentCustomer().then((result) {
      switch (result) {
        case Left(value: final customer):
          return customer;
        case Right(value: final exception):
          presentError(exception, ref: ref);
          return const Option<Customer>.none();
      }
    });

    return await future;
  }

  Future<ApiResult<Customer>> updateCustomer(Customer customer) async {
    final oldCustomer = state.valueOrNull?.toNullable();
    if (oldCustomer == null) {
      throw StateError('Invalid notifier state');
    }

    state = const AsyncValue.loading();

    final body = jsonEncode(customer.toJson());
    final result = await apiFetch(
      HttpMethod.put,
      '/customers/current',
      ref: ref,
      body: body,
    );
    switch (result) {
      case Left(value: final response):
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        final customer = Customer.fromJson(data);
        state = AsyncValue.data(Option.of(customer));
        return ApiResult.left(customer);
      case Right(value: final exception):
        state = AsyncValue.data(Option.of(oldCustomer));
        return ApiResult.right(exception);
    }
  }

  Future<ApiResult<Option<Customer>>> _fetchCurrentCustomer() async {
    final result = await apiFetch(
      HttpMethod.get,
      '/customers/current',
      ref: ref,
    );
    switch (result) {
      case Left(value: final response):
        final customer = Customer.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)),
        );
        return ApiResult.left(Option.of(customer));
      case Right(value: final exception):
        if (exception.statusCode == HttpStatus.notFound) {
          return ApiResult.left(const Option.none());
        } else {
          return ApiResult.right(exception);
        }
    }
  }
}

@Riverpod(keepAlive: true)
class CurrentCoachNotifier extends _$CurrentCoachNotifier {
  @override
  Future<Option<Coach>> build() async {
    final future = _fetchCurrentCoach().then((result) {
      switch (result) {
        case Left(value: final coach):
          return coach;
        case Right(value: final exception):
          presentError(exception, ref: ref);
          return const Option<Coach>.none();
      }
    });

    return await future;
  }

  Future<ApiResult<Coach>> updateCoach(Coach coach) async {
    final oldCoach = state.valueOrNull?.toNullable();
    if (oldCoach == null) {
      throw StateError('Invalid notifier state');
    }

    state = const AsyncValue.loading();

    final body = jsonEncode(coach.toJson());
    final result = await apiFetch(
      HttpMethod.put,
      '/coaches/current',
      ref: ref,
      body: body,
    );
    switch (result) {
      case Left(value: final response):
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        final coach = Coach.fromJson(data);
        state = AsyncValue.data(Option.of(coach));
        return ApiResult.left(coach);
      case Right(value: final exception):
        state = AsyncValue.data(Option.of(oldCoach));
        return ApiResult.right(exception);
    }
  }

  Future<ApiResult<Option<Coach>>> _fetchCurrentCoach() async {
    final result = await apiFetch(
      HttpMethod.get,
      '/coaches/current',
      ref: ref,
    );
    switch (result) {
      case Left(value: final response):
        final coach = Coach.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)),
        );
        return ApiResult.left(Option.of(coach));
      case Right(value: final exception):
        if (exception.statusCode == HttpStatus.notFound) {
          return ApiResult.left(const Option.none());
        } else {
          return ApiResult.right(exception);
        }
    }
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

  Future<ApiResult<Unit>> registerUser() async {
    final body = jsonEncode(state.toJson());
    final result = await apiFetch(
      HttpMethod.post,
      '/customers/registration',
      ref: ref,
      body: body,
      authorize: false,
    );

    switch (result) {
      case Left():
        final tokenResult = await ref
            .read(authTokenNotifierProvider.notifier)
            .authorize(state.email!, state.password!);
        return tokenResult.mapLeft((_) => unit);
      case Right(value: final exception):
        return ApiResult.right(exception);
    }
  }
}
