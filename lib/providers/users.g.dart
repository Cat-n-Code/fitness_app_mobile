// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userByIdHash() => r'17d589cd3e38caf0bed6a4416887f090eb2b5b35';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [userById].
@ProviderFor(userById)
const userByIdProvider = UserByIdFamily();

/// See also [userById].
class UserByIdFamily extends Family<AsyncValue<User>> {
  /// See also [userById].
  const UserByIdFamily();

  /// See also [userById].
  UserByIdProvider call(
    int id,
  ) {
    return UserByIdProvider(
      id,
    );
  }

  @override
  UserByIdProvider getProviderOverride(
    covariant UserByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userByIdProvider';
}

/// See also [userById].
class UserByIdProvider extends AutoDisposeFutureProvider<User> {
  /// See also [userById].
  UserByIdProvider(
    int id,
  ) : this._internal(
          (ref) => userById(
            ref as UserByIdRef,
            id,
          ),
          from: userByIdProvider,
          name: r'userByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userByIdHash,
          dependencies: UserByIdFamily._dependencies,
          allTransitiveDependencies: UserByIdFamily._allTransitiveDependencies,
          id: id,
        );

  UserByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<User> Function(UserByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserByIdProvider._internal(
        (ref) => create(ref as UserByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<User> createElement() {
    return _UserByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserByIdRef on AutoDisposeFutureProviderRef<User> {
  /// The parameter `id` of this provider.
  int get id;
}

class _UserByIdProviderElement extends AutoDisposeFutureProviderElement<User>
    with UserByIdRef {
  _UserByIdProviderElement(super.provider);

  @override
  int get id => (origin as UserByIdProvider).id;
}

String _$currentUserNotifierHash() =>
    r'c99cb7f3a4233ecc9655ca1933fcb5d5c97a6fe0';

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
String _$currentCustomerNotifierHash() =>
    r'5b0ab262b6f54c26cac51935f37ab8ff274643c3';

/// See also [CurrentCustomerNotifier].
@ProviderFor(CurrentCustomerNotifier)
final currentCustomerNotifierProvider =
    AsyncNotifierProvider<CurrentCustomerNotifier, Option<Customer>>.internal(
  CurrentCustomerNotifier.new,
  name: r'currentCustomerNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentCustomerNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentCustomerNotifier = AsyncNotifier<Option<Customer>>;
String _$currentCoachNotifierHash() =>
    r'915197cfb8f9a850ad759a0cc1601d6127b0c226';

/// See also [CurrentCoachNotifier].
@ProviderFor(CurrentCoachNotifier)
final currentCoachNotifierProvider =
    AsyncNotifierProvider<CurrentCoachNotifier, Option<Coach>>.internal(
  CurrentCoachNotifier.new,
  name: r'currentCoachNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentCoachNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentCoachNotifier = AsyncNotifier<Option<Coach>>;
String _$userRegistrationNotifierHash() =>
    r'b59fc2fbe62015cf4df1f5a057001e89594cc046';

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
