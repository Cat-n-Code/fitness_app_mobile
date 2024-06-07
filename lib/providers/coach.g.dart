// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$coachByIdHash() => r'279ad482a6115744ac67ab8a36f2ca48c39111b5';

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

/// See also [coachById].
@ProviderFor(coachById)
const coachByIdProvider = CoachByIdFamily();

/// See also [coachById].
class CoachByIdFamily extends Family<AsyncValue<Coach>> {
  /// See also [coachById].
  const CoachByIdFamily();

  /// See also [coachById].
  CoachByIdProvider call(
    int id,
  ) {
    return CoachByIdProvider(
      id,
    );
  }

  @override
  CoachByIdProvider getProviderOverride(
    covariant CoachByIdProvider provider,
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
  String? get name => r'coachByIdProvider';
}

/// See also [coachById].
class CoachByIdProvider extends AutoDisposeFutureProvider<Coach> {
  /// See also [coachById].
  CoachByIdProvider(
    int id,
  ) : this._internal(
          (ref) => coachById(
            ref as CoachByIdRef,
            id,
          ),
          from: coachByIdProvider,
          name: r'coachByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$coachByIdHash,
          dependencies: CoachByIdFamily._dependencies,
          allTransitiveDependencies: CoachByIdFamily._allTransitiveDependencies,
          id: id,
        );

  CoachByIdProvider._internal(
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
    FutureOr<Coach> Function(CoachByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CoachByIdProvider._internal(
        (ref) => create(ref as CoachByIdRef),
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
  AutoDisposeFutureProviderElement<Coach> createElement() {
    return _CoachByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CoachByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CoachByIdRef on AutoDisposeFutureProviderRef<Coach> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CoachByIdProviderElement extends AutoDisposeFutureProviderElement<Coach>
    with CoachByIdRef {
  _CoachByIdProviderElement(super.provider);

  @override
  int get id => (origin as CoachByIdProvider).id;
}

String _$myCoachesHash() => r'53cf9fd891579f1dcdec7af61fd1fe890e097aa9';

/// See also [myCoaches].
@ProviderFor(myCoaches)
const myCoachesProvider = MyCoachesFamily();

/// See also [myCoaches].
class MyCoachesFamily extends Family<AsyncValue<List<Coach>>> {
  /// See also [myCoaches].
  const MyCoachesFamily();

  /// See also [myCoaches].
  MyCoachesProvider call(
    int page,
    int count,
  ) {
    return MyCoachesProvider(
      page,
      count,
    );
  }

  @override
  MyCoachesProvider getProviderOverride(
    covariant MyCoachesProvider provider,
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
  String? get name => r'myCoachesProvider';
}

/// See also [myCoaches].
class MyCoachesProvider extends AutoDisposeFutureProvider<List<Coach>> {
  /// See also [myCoaches].
  MyCoachesProvider(
    int page,
    int count,
  ) : this._internal(
          (ref) => myCoaches(
            ref as MyCoachesRef,
            page,
            count,
          ),
          from: myCoachesProvider,
          name: r'myCoachesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myCoachesHash,
          dependencies: MyCoachesFamily._dependencies,
          allTransitiveDependencies: MyCoachesFamily._allTransitiveDependencies,
          page: page,
          count: count,
        );

  MyCoachesProvider._internal(
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
    FutureOr<List<Coach>> Function(MyCoachesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyCoachesProvider._internal(
        (ref) => create(ref as MyCoachesRef),
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
  AutoDisposeFutureProviderElement<List<Coach>> createElement() {
    return _MyCoachesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyCoachesProvider &&
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

mixin MyCoachesRef on AutoDisposeFutureProviderRef<List<Coach>> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `count` of this provider.
  int get count;
}

class _MyCoachesProviderElement
    extends AutoDisposeFutureProviderElement<List<Coach>> with MyCoachesRef {
  _MyCoachesProviderElement(super.provider);

  @override
  int get page => (origin as MyCoachesProvider).page;
  @override
  int get count => (origin as MyCoachesProvider).count;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
