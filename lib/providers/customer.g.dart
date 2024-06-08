// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$customerByIdHash() => r'43363e042466bad1d8e7be5093d55855cc0fcca7';

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

/// See also [customerById].
@ProviderFor(customerById)
const customerByIdProvider = CustomerByIdFamily();

/// See also [customerById].
class CustomerByIdFamily extends Family<AsyncValue<Customer>> {
  /// See also [customerById].
  const CustomerByIdFamily();

  /// See also [customerById].
  CustomerByIdProvider call(
    int id,
  ) {
    return CustomerByIdProvider(
      id,
    );
  }

  @override
  CustomerByIdProvider getProviderOverride(
    covariant CustomerByIdProvider provider,
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
  String? get name => r'customerByIdProvider';
}

/// See also [customerById].
class CustomerByIdProvider extends AutoDisposeFutureProvider<Customer> {
  /// See also [customerById].
  CustomerByIdProvider(
    int id,
  ) : this._internal(
          (ref) => customerById(
            ref as CustomerByIdRef,
            id,
          ),
          from: customerByIdProvider,
          name: r'customerByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$customerByIdHash,
          dependencies: CustomerByIdFamily._dependencies,
          allTransitiveDependencies:
              CustomerByIdFamily._allTransitiveDependencies,
          id: id,
        );

  CustomerByIdProvider._internal(
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
    FutureOr<Customer> Function(CustomerByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CustomerByIdProvider._internal(
        (ref) => create(ref as CustomerByIdRef),
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
  AutoDisposeFutureProviderElement<Customer> createElement() {
    return _CustomerByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CustomerByIdRef on AutoDisposeFutureProviderRef<Customer> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CustomerByIdProviderElement
    extends AutoDisposeFutureProviderElement<Customer> with CustomerByIdRef {
  _CustomerByIdProviderElement(super.provider);

  @override
  int get id => (origin as CustomerByIdProvider).id;
}

String _$myCustomersHash() => r'8f86cb9da2e01a4591580413f2116f9cde07c957';

/// See also [myCustomers].
@ProviderFor(myCustomers)
const myCustomersProvider = MyCustomersFamily();

/// See also [myCustomers].
class MyCustomersFamily extends Family<AsyncValue<List<Customer>>> {
  /// See also [myCustomers].
  const MyCustomersFamily();

  /// See also [myCustomers].
  MyCustomersProvider call(
    int page,
    int count,
  ) {
    return MyCustomersProvider(
      page,
      count,
    );
  }

  @override
  MyCustomersProvider getProviderOverride(
    covariant MyCustomersProvider provider,
  ) {
    return call(
      provider.page,
      provider.count,
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
  String? get name => r'myCustomersProvider';
}

/// See also [myCustomers].
class MyCustomersProvider extends AutoDisposeFutureProvider<List<Customer>> {
  /// See also [myCustomers].
  MyCustomersProvider(
    int page,
    int count,
  ) : this._internal(
          (ref) => myCustomers(
            ref as MyCustomersRef,
            page,
            count,
          ),
          from: myCustomersProvider,
          name: r'myCustomersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myCustomersHash,
          dependencies: MyCustomersFamily._dependencies,
          allTransitiveDependencies:
              MyCustomersFamily._allTransitiveDependencies,
          page: page,
          count: count,
        );

  MyCustomersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.count,
  }) : super.internal();

  final int page;
  final int count;

  @override
  Override overrideWith(
    FutureOr<List<Customer>> Function(MyCustomersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyCustomersProvider._internal(
        (ref) => create(ref as MyCustomersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        count: count,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Customer>> createElement() {
    return _MyCustomersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyCustomersProvider &&
        other.page == page &&
        other.count == count;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, count.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MyCustomersRef on AutoDisposeFutureProviderRef<List<Customer>> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `count` of this provider.
  int get count;
}

class _MyCustomersProviderElement
    extends AutoDisposeFutureProviderElement<List<Customer>>
    with MyCustomersRef {
  _MyCustomersProviderElement(super.provider);

  @override
  int get page => (origin as MyCustomersProvider).page;
  @override
  int get count => (origin as MyCustomersProvider).count;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
