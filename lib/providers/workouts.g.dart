// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workouts.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workoutByIdHash() => r'942fdc89d5425c71b35c6fc9b2a74095e05ddfff';

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

/// See also [workoutById].
@ProviderFor(workoutById)
const workoutByIdProvider = WorkoutByIdFamily();

/// See also [workoutById].
class WorkoutByIdFamily extends Family<AsyncValue<Option<Workout>>> {
  /// See also [workoutById].
  const WorkoutByIdFamily();

  /// See also [workoutById].
  WorkoutByIdProvider call(
    int id,
  ) {
    return WorkoutByIdProvider(
      id,
    );
  }

  @override
  WorkoutByIdProvider getProviderOverride(
    covariant WorkoutByIdProvider provider,
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
  String? get name => r'workoutByIdProvider';
}

/// See also [workoutById].
class WorkoutByIdProvider extends AutoDisposeFutureProvider<Option<Workout>> {
  /// See also [workoutById].
  WorkoutByIdProvider(
    int id,
  ) : this._internal(
          (ref) => workoutById(
            ref as WorkoutByIdRef,
            id,
          ),
          from: workoutByIdProvider,
          name: r'workoutByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$workoutByIdHash,
          dependencies: WorkoutByIdFamily._dependencies,
          allTransitiveDependencies:
              WorkoutByIdFamily._allTransitiveDependencies,
          id: id,
        );

  WorkoutByIdProvider._internal(
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
    FutureOr<Option<Workout>> Function(WorkoutByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WorkoutByIdProvider._internal(
        (ref) => create(ref as WorkoutByIdRef),
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
  AutoDisposeFutureProviderElement<Option<Workout>> createElement() {
    return _WorkoutByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkoutByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WorkoutByIdRef on AutoDisposeFutureProviderRef<Option<Workout>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _WorkoutByIdProviderElement
    extends AutoDisposeFutureProviderElement<Option<Workout>>
    with WorkoutByIdRef {
  _WorkoutByIdProviderElement(super.provider);

  @override
  int get id => (origin as WorkoutByIdProvider).id;
}

String _$customerWorkoutsNotifierHash() =>
    r'1bce942746cb59db4ffdeff9fd837b240176b739';

/// See also [CustomerWorkoutsNotifier].
@ProviderFor(CustomerWorkoutsNotifier)
final customerWorkoutsNotifierProvider =
    AsyncNotifierProvider<CustomerWorkoutsNotifier, List<Workout>>.internal(
  CustomerWorkoutsNotifier.new,
  name: r'customerWorkoutsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$customerWorkoutsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CustomerWorkoutsNotifier = AsyncNotifier<List<Workout>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
