// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myExercisesHash() => r'd4a1e6a8802165531d5be555108f1dcb643d2b59';

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

/// See also [myExercises].
@ProviderFor(myExercises)
const myExercisesProvider = MyExercisesFamily();

/// See also [myExercises].
class MyExercisesFamily extends Family<AsyncValue<List<ExerciseTemplate>>> {
  /// See also [myExercises].
  const MyExercisesFamily();

  /// See also [myExercises].
  MyExercisesProvider call(
    int page,
    int pageSize,
    String? nameParam,
    String? muscleParam,
    String? equipmentParam,
    ExerciseType? typeParam,
    ExerciseDifficulty? difficultyParam,
  ) {
    return MyExercisesProvider(
      page,
      pageSize,
      nameParam,
      muscleParam,
      equipmentParam,
      typeParam,
      difficultyParam,
    );
  }

  @override
  MyExercisesProvider getProviderOverride(
    covariant MyExercisesProvider provider,
  ) {
    return call(
      provider.page,
      provider.pageSize,
      provider.nameParam,
      provider.muscleParam,
      provider.equipmentParam,
      provider.typeParam,
      provider.difficultyParam,
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
  String? get name => r'myExercisesProvider';
}

/// See also [myExercises].
class MyExercisesProvider
    extends AutoDisposeFutureProvider<List<ExerciseTemplate>> {
  /// See also [myExercises].
  MyExercisesProvider(
    int page,
    int pageSize,
    String? nameParam,
    String? muscleParam,
    String? equipmentParam,
    ExerciseType? typeParam,
    ExerciseDifficulty? difficultyParam,
  ) : this._internal(
          (ref) => myExercises(
            ref as MyExercisesRef,
            page,
            pageSize,
            nameParam,
            muscleParam,
            equipmentParam,
            typeParam,
            difficultyParam,
          ),
          from: myExercisesProvider,
          name: r'myExercisesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myExercisesHash,
          dependencies: MyExercisesFamily._dependencies,
          allTransitiveDependencies:
              MyExercisesFamily._allTransitiveDependencies,
          page: page,
          pageSize: pageSize,
          nameParam: nameParam,
          muscleParam: muscleParam,
          equipmentParam: equipmentParam,
          typeParam: typeParam,
          difficultyParam: difficultyParam,
        );

  MyExercisesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.pageSize,
    required this.nameParam,
    required this.muscleParam,
    required this.equipmentParam,
    required this.typeParam,
    required this.difficultyParam,
  }) : super.internal();

  final int page;
  final int pageSize;
  final String? nameParam;
  final String? muscleParam;
  final String? equipmentParam;
  final ExerciseType? typeParam;
  final ExerciseDifficulty? difficultyParam;

  @override
  Override overrideWith(
    FutureOr<List<ExerciseTemplate>> Function(MyExercisesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyExercisesProvider._internal(
        (ref) => create(ref as MyExercisesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        pageSize: pageSize,
        nameParam: nameParam,
        muscleParam: muscleParam,
        equipmentParam: equipmentParam,
        typeParam: typeParam,
        difficultyParam: difficultyParam,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ExerciseTemplate>> createElement() {
    return _MyExercisesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyExercisesProvider &&
        other.page == page &&
        other.pageSize == pageSize &&
        other.nameParam == nameParam &&
        other.muscleParam == muscleParam &&
        other.equipmentParam == equipmentParam &&
        other.typeParam == typeParam &&
        other.difficultyParam == difficultyParam;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, pageSize.hashCode);
    hash = _SystemHash.combine(hash, nameParam.hashCode);
    hash = _SystemHash.combine(hash, muscleParam.hashCode);
    hash = _SystemHash.combine(hash, equipmentParam.hashCode);
    hash = _SystemHash.combine(hash, typeParam.hashCode);
    hash = _SystemHash.combine(hash, difficultyParam.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MyExercisesRef on AutoDisposeFutureProviderRef<List<ExerciseTemplate>> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `pageSize` of this provider.
  int get pageSize;

  /// The parameter `nameParam` of this provider.
  String? get nameParam;

  /// The parameter `muscleParam` of this provider.
  String? get muscleParam;

  /// The parameter `equipmentParam` of this provider.
  String? get equipmentParam;

  /// The parameter `typeParam` of this provider.
  ExerciseType? get typeParam;

  /// The parameter `difficultyParam` of this provider.
  ExerciseDifficulty? get difficultyParam;
}

class _MyExercisesProviderElement
    extends AutoDisposeFutureProviderElement<List<ExerciseTemplate>>
    with MyExercisesRef {
  _MyExercisesProviderElement(super.provider);

  @override
  int get page => (origin as MyExercisesProvider).page;
  @override
  int get pageSize => (origin as MyExercisesProvider).pageSize;
  @override
  String? get nameParam => (origin as MyExercisesProvider).nameParam;
  @override
  String? get muscleParam => (origin as MyExercisesProvider).muscleParam;
  @override
  String? get equipmentParam => (origin as MyExercisesProvider).equipmentParam;
  @override
  ExerciseType? get typeParam => (origin as MyExercisesProvider).typeParam;
  @override
  ExerciseDifficulty? get difficultyParam =>
      (origin as MyExercisesProvider).difficultyParam;
}

String _$exerciseNotifierHash() => r'965d58d99ea6b6b120e3e3c148f5636810df6a0b';

abstract class _$ExerciseNotifier
    extends BuildlessAutoDisposeAsyncNotifier<Option<ExerciseTemplate>> {
  late final int id;

  FutureOr<Option<ExerciseTemplate>> build(
    int id,
  );
}

/// See also [ExerciseNotifier].
@ProviderFor(ExerciseNotifier)
const exerciseNotifierProvider = ExerciseNotifierFamily();

/// See also [ExerciseNotifier].
class ExerciseNotifierFamily
    extends Family<AsyncValue<Option<ExerciseTemplate>>> {
  /// See also [ExerciseNotifier].
  const ExerciseNotifierFamily();

  /// See also [ExerciseNotifier].
  ExerciseNotifierProvider call(
    int id,
  ) {
    return ExerciseNotifierProvider(
      id,
    );
  }

  @override
  ExerciseNotifierProvider getProviderOverride(
    covariant ExerciseNotifierProvider provider,
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
  String? get name => r'exerciseNotifierProvider';
}

/// See also [ExerciseNotifier].
class ExerciseNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ExerciseNotifier, Option<ExerciseTemplate>> {
  /// See also [ExerciseNotifier].
  ExerciseNotifierProvider(
    int id,
  ) : this._internal(
          () => ExerciseNotifier()..id = id,
          from: exerciseNotifierProvider,
          name: r'exerciseNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exerciseNotifierHash,
          dependencies: ExerciseNotifierFamily._dependencies,
          allTransitiveDependencies:
              ExerciseNotifierFamily._allTransitiveDependencies,
          id: id,
        );

  ExerciseNotifierProvider._internal(
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
  FutureOr<Option<ExerciseTemplate>> runNotifierBuild(
    covariant ExerciseNotifier notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(ExerciseNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ExerciseNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ExerciseNotifier,
      Option<ExerciseTemplate>> createElement() {
    return _ExerciseNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExerciseNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExerciseNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<Option<ExerciseTemplate>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ExerciseNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ExerciseNotifier,
        Option<ExerciseTemplate>> with ExerciseNotifierRef {
  _ExerciseNotifierProviderElement(super.provider);

  @override
  int get id => (origin as ExerciseNotifierProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
