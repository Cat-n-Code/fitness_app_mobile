// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentUserNotifierHash() =>
    r'c10676324544e40130af2376c76c2e0a4e0b0b50';

/// See also [CurrentUserNotifier].
@ProviderFor(CurrentUserNotifier)
final currentUserNotifierProvider =
    AsyncNotifierProvider<CurrentUserNotifier, Option<User>>.internal(
  CurrentUserNotifier.new,
  name: r'currentUserNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentUserNotifier = AsyncNotifier<Option<User>>;
String _$userRegistrationNotifierHash() =>
    r'7cab560e1912327d48ffc6cd2c24ac1e119b569c';

/// See also [UserRegistrationNotifier].
@ProviderFor(UserRegistrationNotifier)
final userRegistrationNotifierProvider = AutoDisposeNotifierProvider<
    UserRegistrationNotifier, UserRegistrationForm>.internal(
  UserRegistrationNotifier.new,
  name: r'userRegistrationNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRegistrationNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserRegistrationNotifier = AutoDisposeNotifier<UserRegistrationForm>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
