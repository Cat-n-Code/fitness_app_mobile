// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workouts.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$exerciseTemplateByIdHash() =>
    r'3454efb27c4c42ac9bfa01643cd01b372fcf7978';

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

/// See also [exerciseTemplateById].
@ProviderFor(exerciseTemplateById)
const exerciseTemplateByIdProvider = ExerciseTemplateByIdFamily();

/// See also [exerciseTemplateById].
class ExerciseTemplateByIdFamily
    extends Family<AsyncValue<Option<ExerciseTemplate>>> {
  /// See also [exerciseTemplateById].
  const ExerciseTemplateByIdFamily();

  /// See also [exerciseTemplateById].
  ExerciseTemplateByIdProvider call(
    int id,
  ) {
    return ExerciseTemplateByIdProvider(
      id,
    );
  }

  @override
  ExerciseTemplateByIdProvider getProviderOverride(
    covariant ExerciseTemplateByIdProvider provider,
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
  String? get name => r'exerciseTemplateByIdProvider';
}

/// See also [exerciseTemplateById].
class ExerciseTemplateByIdProvider
    extends AutoDisposeFutureProvider<Option<ExerciseTemplate>> {
  /// See also [exerciseTemplateById].
  ExerciseTemplateByIdProvider(
    int id,
  ) : this._internal(
          (ref) => exerciseTemplateById(
            ref as ExerciseTemplateByIdRef,
            id,
          ),
          from: exerciseTemplateByIdProvider,
          name: r'exerciseTemplateByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exerciseTemplateByIdHash,
          dependencies: ExerciseTemplateByIdFamily._dependencies,
          allTransitiveDependencies:
              ExerciseTemplateByIdFamily._allTransitiveDependencies,
          id: id,
        );

  ExerciseTemplateByIdProvider._internal(
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
    FutureOr<Option<ExerciseTemplate>> Function(
            ExerciseTemplateByIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExerciseTemplateByIdProvider._internal(
        (ref) => create(ref as ExerciseTemplateByIdRef),
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
  AutoDisposeFutureProviderElement<Option<ExerciseTemplate>> createElement() {
    return _ExerciseTemplateByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExerciseTemplateByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExerciseTemplateByIdRef
    on AutoDisposeFutureProviderRef<Option<ExerciseTemplate>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ExerciseTemplateByIdProviderElement
    extends AutoDisposeFutureProviderElement<Option<ExerciseTemplate>>
    with ExerciseTemplateByIdRef {
  _ExerciseTemplateByIdProviderElement(super.provider);

  @override
  int get id => (origin as ExerciseTemplateByIdProvider).id;
}

String _$workoutTemplateByIdHash() =>
    r'beb810e18311c064379a511efacb842dbef67d62';

/// See also [workoutTemplateById].
@ProviderFor(workoutTemplateById)
const workoutTemplateByIdProvider = WorkoutTemplateByIdFamily();

/// See also [workoutTemplateById].
class WorkoutTemplateByIdFamily
    extends Family<AsyncValue<Option<WorkoutTemplate>>> {
  /// See also [workoutTemplateById].
  const WorkoutTemplateByIdFamily();

  /// See also [workoutTemplateById].
  WorkoutTemplateByIdProvider call(
    int id,
  ) {
    return WorkoutTemplateByIdProvider(
      id,
    );
  }

  @override
  WorkoutTemplateByIdProvider getProviderOverride(
    covariant WorkoutTemplateByIdProvider provider,
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
  String? get name => r'workoutTemplateByIdProvider';
}

/// See also [workoutTemplateById].
class WorkoutTemplateByIdProvider
    extends AutoDisposeFutureProvider<Option<WorkoutTemplate>> {
  /// See also [workoutTemplateById].
  WorkoutTemplateByIdProvider(
    int id,
  ) : this._internal(
          (ref) => workoutTemplateById(
            ref as WorkoutTemplateByIdRef,
            id,
          ),
          from: workoutTemplateByIdProvider,
          name: r'workoutTemplateByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$workoutTemplateByIdHash,
          dependencies: WorkoutTemplateByIdFamily._dependencies,
          allTransitiveDependencies:
              WorkoutTemplateByIdFamily._allTransitiveDependencies,
          id: id,
        );

  WorkoutTemplateByIdProvider._internal(
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
    FutureOr<Option<WorkoutTemplate>> Function(WorkoutTemplateByIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WorkoutTemplateByIdProvider._internal(
        (ref) => create(ref as WorkoutTemplateByIdRef),
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
  AutoDisposeFutureProviderElement<Option<WorkoutTemplate>> createElement() {
    return _WorkoutTemplateByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkoutTemplateByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WorkoutTemplateByIdRef
    on AutoDisposeFutureProviderRef<Option<WorkoutTemplate>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _WorkoutTemplateByIdProviderElement
    extends AutoDisposeFutureProviderElement<Option<WorkoutTemplate>>
    with WorkoutTemplateByIdRef {
  _WorkoutTemplateByIdProviderElement(super.provider);

  @override
  int get id => (origin as WorkoutTemplateByIdProvider).id;
}

String _$workoutByIdHash() => r'942fdc89d5425c71b35c6fc9b2a74095e05ddfff';

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

String _$exerciseTemplatesNotifierHash() =>
    r'981829fbd4da2e535887a25d87ad1a333b9379aa';

/// See also [ExerciseTemplatesNotifier].
@ProviderFor(ExerciseTemplatesNotifier)
final exerciseTemplatesNotifierProvider = AutoDisposeAsyncNotifierProvider<
    ExerciseTemplatesNotifier, List<ExerciseTemplate>>.internal(
  ExerciseTemplatesNotifier.new,
  name: r'exerciseTemplatesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$exerciseTemplatesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ExerciseTemplatesNotifier
    = AutoDisposeAsyncNotifier<List<ExerciseTemplate>>;
String _$workoutsTemplatesNotifierHash() =>
    r'2d4d0ae19b0b10bee10cedba7551fc62f269cfdf';

/// See also [WorkoutsTemplatesNotifier].
@ProviderFor(WorkoutsTemplatesNotifier)
final workoutsTemplatesNotifierProvider = AutoDisposeAsyncNotifierProvider<
    WorkoutsTemplatesNotifier, List<WorkoutTemplate>>.internal(
  WorkoutsTemplatesNotifier.new,
  name: r'workoutsTemplatesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$workoutsTemplatesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WorkoutsTemplatesNotifier
    = AutoDisposeAsyncNotifier<List<WorkoutTemplate>>;
String _$customerWorkoutsNotifierHash() =>
    r'bb0b5d54f88218f4e953f42345274b260851e9c1';

/// See also [CustomerWorkoutsNotifier].
@ProviderFor(CustomerWorkoutsNotifier)
final customerWorkoutsNotifierProvider = AutoDisposeAsyncNotifierProvider<
    CustomerWorkoutsNotifier, List<Workout>>.internal(
  CustomerWorkoutsNotifier.new,
  name: r'customerWorkoutsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$customerWorkoutsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CustomerWorkoutsNotifier = AutoDisposeAsyncNotifier<List<Workout>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
