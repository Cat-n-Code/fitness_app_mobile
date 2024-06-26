// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workouts.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myWorkoutsHash() => r'3e1ef9059da28f5dde19ef1deb0e214e65b0adf2';

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

/// See also [myWorkouts].
@ProviderFor(myWorkouts)
const myWorkoutsProvider = MyWorkoutsFamily();

/// See also [myWorkouts].
class MyWorkoutsFamily extends Family<AsyncValue<List<Workout>>> {
  /// See also [myWorkouts].
  const MyWorkoutsFamily();

  /// See also [myWorkouts].
  MyWorkoutsProvider call(
    int page,
    int pageSize,
    String? nameParam,
  ) {
    return MyWorkoutsProvider(
      page,
      pageSize,
      nameParam,
    );
  }

  @override
  MyWorkoutsProvider getProviderOverride(
    covariant MyWorkoutsProvider provider,
  ) {
    return call(
      provider.page,
      provider.pageSize,
      provider.nameParam,
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
  String? get name => r'myWorkoutsProvider';
}

/// See also [myWorkouts].
class MyWorkoutsProvider extends AutoDisposeFutureProvider<List<Workout>> {
  /// See also [myWorkouts].
  MyWorkoutsProvider(
    int page,
    int pageSize,
    String? nameParam,
  ) : this._internal(
          (ref) => myWorkouts(
            ref as MyWorkoutsRef,
            page,
            pageSize,
            nameParam,
          ),
          from: myWorkoutsProvider,
          name: r'myWorkoutsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myWorkoutsHash,
          dependencies: MyWorkoutsFamily._dependencies,
          allTransitiveDependencies:
              MyWorkoutsFamily._allTransitiveDependencies,
          page: page,
          pageSize: pageSize,
          nameParam: nameParam,
        );

  MyWorkoutsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.pageSize,
    required this.nameParam,
  }) : super.internal();

  final int page;
  final int pageSize;
  final String? nameParam;

  @override
  Override overrideWith(
    FutureOr<List<Workout>> Function(MyWorkoutsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyWorkoutsProvider._internal(
        (ref) => create(ref as MyWorkoutsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        pageSize: pageSize,
        nameParam: nameParam,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Workout>> createElement() {
    return _MyWorkoutsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyWorkoutsProvider &&
        other.page == page &&
        other.pageSize == pageSize &&
        other.nameParam == nameParam;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, pageSize.hashCode);
    hash = _SystemHash.combine(hash, nameParam.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MyWorkoutsRef on AutoDisposeFutureProviderRef<List<Workout>> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `pageSize` of this provider.
  int get pageSize;

  /// The parameter `nameParam` of this provider.
  String? get nameParam;
}

class _MyWorkoutsProviderElement
    extends AutoDisposeFutureProviderElement<List<Workout>> with MyWorkoutsRef {
  _MyWorkoutsProviderElement(super.provider);

  @override
  int get page => (origin as MyWorkoutsProvider).page;
  @override
  int get pageSize => (origin as MyWorkoutsProvider).pageSize;
  @override
  String? get nameParam => (origin as MyWorkoutsProvider).nameParam;
}

String _$userWorkoutsHash() => r'1fda8bddf6dca486b8470875431bbc4b01450dd8';

/// See also [userWorkouts].
@ProviderFor(userWorkouts)
const userWorkoutsProvider = UserWorkoutsFamily();

/// See also [userWorkouts].
class UserWorkoutsFamily extends Family<AsyncValue<List<Workout>>> {
  /// See also [userWorkouts].
  const UserWorkoutsFamily();

  /// See also [userWorkouts].
  UserWorkoutsProvider call(
    int userId,
    int page,
    int pageSize,
  ) {
    return UserWorkoutsProvider(
      userId,
      page,
      pageSize,
    );
  }

  @override
  UserWorkoutsProvider getProviderOverride(
    covariant UserWorkoutsProvider provider,
  ) {
    return call(
      provider.userId,
      provider.page,
      provider.pageSize,
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
  String? get name => r'userWorkoutsProvider';
}

/// See also [userWorkouts].
class UserWorkoutsProvider extends AutoDisposeFutureProvider<List<Workout>> {
  /// See also [userWorkouts].
  UserWorkoutsProvider(
    int userId,
    int page,
    int pageSize,
  ) : this._internal(
          (ref) => userWorkouts(
            ref as UserWorkoutsRef,
            userId,
            page,
            pageSize,
          ),
          from: userWorkoutsProvider,
          name: r'userWorkoutsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userWorkoutsHash,
          dependencies: UserWorkoutsFamily._dependencies,
          allTransitiveDependencies:
              UserWorkoutsFamily._allTransitiveDependencies,
          userId: userId,
          page: page,
          pageSize: pageSize,
        );

  UserWorkoutsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.page,
    required this.pageSize,
  }) : super.internal();

  final int userId;
  final int page;
  final int pageSize;

  @override
  Override overrideWith(
    FutureOr<List<Workout>> Function(UserWorkoutsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserWorkoutsProvider._internal(
        (ref) => create(ref as UserWorkoutsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        page: page,
        pageSize: pageSize,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Workout>> createElement() {
    return _UserWorkoutsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserWorkoutsProvider &&
        other.userId == userId &&
        other.page == page &&
        other.pageSize == pageSize;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, pageSize.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserWorkoutsRef on AutoDisposeFutureProviderRef<List<Workout>> {
  /// The parameter `userId` of this provider.
  int get userId;

  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `pageSize` of this provider.
  int get pageSize;
}

class _UserWorkoutsProviderElement
    extends AutoDisposeFutureProviderElement<List<Workout>>
    with UserWorkoutsRef {
  _UserWorkoutsProviderElement(super.provider);

  @override
  int get userId => (origin as UserWorkoutsProvider).userId;
  @override
  int get page => (origin as UserWorkoutsProvider).page;
  @override
  int get pageSize => (origin as UserWorkoutsProvider).pageSize;
}

String _$workoutNotifierHash() => r'71a69c7331db734dbbb0c047321f7dec1e5e2303';

abstract class _$WorkoutNotifier
    extends BuildlessAutoDisposeAsyncNotifier<Option<Workout>> {
  late final int id;

  FutureOr<Option<Workout>> build(
    int id,
  );
}

/// See also [WorkoutNotifier].
@ProviderFor(WorkoutNotifier)
const workoutNotifierProvider = WorkoutNotifierFamily();

/// See also [WorkoutNotifier].
class WorkoutNotifierFamily extends Family<AsyncValue<Option<Workout>>> {
  /// See also [WorkoutNotifier].
  const WorkoutNotifierFamily();

  /// See also [WorkoutNotifier].
  WorkoutNotifierProvider call(
    int id,
  ) {
    return WorkoutNotifierProvider(
      id,
    );
  }

  @override
  WorkoutNotifierProvider getProviderOverride(
    covariant WorkoutNotifierProvider provider,
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
  String? get name => r'workoutNotifierProvider';
}

/// See also [WorkoutNotifier].
class WorkoutNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    WorkoutNotifier, Option<Workout>> {
  /// See also [WorkoutNotifier].
  WorkoutNotifierProvider(
    int id,
  ) : this._internal(
          () => WorkoutNotifier()..id = id,
          from: workoutNotifierProvider,
          name: r'workoutNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$workoutNotifierHash,
          dependencies: WorkoutNotifierFamily._dependencies,
          allTransitiveDependencies:
              WorkoutNotifierFamily._allTransitiveDependencies,
          id: id,
        );

  WorkoutNotifierProvider._internal(
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
  FutureOr<Option<Workout>> runNotifierBuild(
    covariant WorkoutNotifier notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(WorkoutNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: WorkoutNotifierProvider._internal(
        () => create()..id = id,
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
  AutoDisposeAsyncNotifierProviderElement<WorkoutNotifier, Option<Workout>>
      createElement() {
    return _WorkoutNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkoutNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WorkoutNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<Option<Workout>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _WorkoutNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WorkoutNotifier,
        Option<Workout>> with WorkoutNotifierRef {
  _WorkoutNotifierProviderElement(super.provider);

  @override
  int get id => (origin as WorkoutNotifierProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
