// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myExerciseTemplatesHash() =>
    r'afe57e266c46a66bd186c49453e36ec570eb8eca';

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

/// See also [myExerciseTemplates].
@ProviderFor(myExerciseTemplates)
const myExerciseTemplatesProvider = MyExerciseTemplatesFamily();

/// See also [myExerciseTemplates].
class MyExerciseTemplatesFamily
    extends Family<AsyncValue<List<ExerciseTemplate>>> {
  /// See also [myExerciseTemplates].
  const MyExerciseTemplatesFamily();

  /// See also [myExerciseTemplates].
  MyExerciseTemplatesProvider call(
    int page,
    int pageSize,
    String? nameParam,
    String? muscleParam,
    String? equipmentParam,
    ExerciseType? typeParam,
    ExerciseDifficulty? difficultyParam,
  ) {
    return MyExerciseTemplatesProvider(
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
  MyExerciseTemplatesProvider getProviderOverride(
    covariant MyExerciseTemplatesProvider provider,
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
  String? get name => r'myExerciseTemplatesProvider';
}

/// See also [myExerciseTemplates].
class MyExerciseTemplatesProvider
    extends AutoDisposeFutureProvider<List<ExerciseTemplate>> {
  /// See also [myExerciseTemplates].
  MyExerciseTemplatesProvider(
    int page,
    int pageSize,
    String? nameParam,
    String? muscleParam,
    String? equipmentParam,
    ExerciseType? typeParam,
    ExerciseDifficulty? difficultyParam,
  ) : this._internal(
          (ref) => myExerciseTemplates(
            ref as MyExerciseTemplatesRef,
            page,
            pageSize,
            nameParam,
            muscleParam,
            equipmentParam,
            typeParam,
            difficultyParam,
          ),
          from: myExerciseTemplatesProvider,
          name: r'myExerciseTemplatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myExerciseTemplatesHash,
          dependencies: MyExerciseTemplatesFamily._dependencies,
          allTransitiveDependencies:
              MyExerciseTemplatesFamily._allTransitiveDependencies,
          page: page,
          pageSize: pageSize,
          nameParam: nameParam,
          muscleParam: muscleParam,
          equipmentParam: equipmentParam,
          typeParam: typeParam,
          difficultyParam: difficultyParam,
        );

  MyExerciseTemplatesProvider._internal(
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
    FutureOr<List<ExerciseTemplate>> Function(MyExerciseTemplatesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyExerciseTemplatesProvider._internal(
        (ref) => create(ref as MyExerciseTemplatesRef),
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
    return _MyExerciseTemplatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyExerciseTemplatesProvider &&
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

mixin MyExerciseTemplatesRef
    on AutoDisposeFutureProviderRef<List<ExerciseTemplate>> {
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

class _MyExerciseTemplatesProviderElement
    extends AutoDisposeFutureProviderElement<List<ExerciseTemplate>>
    with MyExerciseTemplatesRef {
  _MyExerciseTemplatesProviderElement(super.provider);

  @override
  int get page => (origin as MyExerciseTemplatesProvider).page;
  @override
  int get pageSize => (origin as MyExerciseTemplatesProvider).pageSize;
  @override
  String? get nameParam => (origin as MyExerciseTemplatesProvider).nameParam;
  @override
  String? get muscleParam =>
      (origin as MyExerciseTemplatesProvider).muscleParam;
  @override
  String? get equipmentParam =>
      (origin as MyExerciseTemplatesProvider).equipmentParam;
  @override
  ExerciseType? get typeParam =>
      (origin as MyExerciseTemplatesProvider).typeParam;
  @override
  ExerciseDifficulty? get difficultyParam =>
      (origin as MyExerciseTemplatesProvider).difficultyParam;
}

String _$exerciseByIdHash() => r'614f51c60e45aebcdcfccbbe7afb610a8d1b1e75';

/// See also [exerciseById].
@ProviderFor(exerciseById)
const exerciseByIdProvider = ExerciseByIdFamily();

/// See also [exerciseById].
class ExerciseByIdFamily extends Family<AsyncValue<Option<Exercise>>> {
  /// See also [exerciseById].
  const ExerciseByIdFamily();

  /// See also [exerciseById].
  ExerciseByIdProvider call(
    int workoutId,
    int id,
  ) {
    return ExerciseByIdProvider(
      workoutId,
      id,
    );
  }

  @override
  ExerciseByIdProvider getProviderOverride(
    covariant ExerciseByIdProvider provider,
  ) {
    return call(
      provider.workoutId,
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
  String? get name => r'exerciseByIdProvider';
}

/// See also [exerciseById].
class ExerciseByIdProvider extends AutoDisposeFutureProvider<Option<Exercise>> {
  /// See also [exerciseById].
  ExerciseByIdProvider(
    int workoutId,
    int id,
  ) : this._internal(
          (ref) => exerciseById(
            ref as ExerciseByIdRef,
            workoutId,
            id,
          ),
          from: exerciseByIdProvider,
          name: r'exerciseByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exerciseByIdHash,
          dependencies: ExerciseByIdFamily._dependencies,
          allTransitiveDependencies:
              ExerciseByIdFamily._allTransitiveDependencies,
          workoutId: workoutId,
          id: id,
        );

  ExerciseByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.workoutId,
    required this.id,
  }) : super.internal();

  final int workoutId;
  final int id;

  @override
  Override overrideWith(
    FutureOr<Option<Exercise>> Function(ExerciseByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExerciseByIdProvider._internal(
        (ref) => create(ref as ExerciseByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        workoutId: workoutId,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Option<Exercise>> createElement() {
    return _ExerciseByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExerciseByIdProvider &&
        other.workoutId == workoutId &&
        other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workoutId.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExerciseByIdRef on AutoDisposeFutureProviderRef<Option<Exercise>> {
  /// The parameter `workoutId` of this provider.
  int get workoutId;

  /// The parameter `id` of this provider.
  int get id;
}

class _ExerciseByIdProviderElement
    extends AutoDisposeFutureProviderElement<Option<Exercise>>
    with ExerciseByIdRef {
  _ExerciseByIdProviderElement(super.provider);

  @override
  int get workoutId => (origin as ExerciseByIdProvider).workoutId;
  @override
  int get id => (origin as ExerciseByIdProvider).id;
}

String _$exerciseTemplateNotifierHash() =>
    r'b02a8fa2714ebb21e628080b32a21e31885f402d';

abstract class _$ExerciseTemplateNotifier
    extends BuildlessAutoDisposeAsyncNotifier<Option<ExerciseTemplate>> {
  late final int id;

  FutureOr<Option<ExerciseTemplate>> build(
    int id,
  );
}

/// See also [ExerciseTemplateNotifier].
@ProviderFor(ExerciseTemplateNotifier)
const exerciseTemplateNotifierProvider = ExerciseTemplateNotifierFamily();

/// See also [ExerciseTemplateNotifier].
class ExerciseTemplateNotifierFamily
    extends Family<AsyncValue<Option<ExerciseTemplate>>> {
  /// See also [ExerciseTemplateNotifier].
  const ExerciseTemplateNotifierFamily();

  /// See also [ExerciseTemplateNotifier].
  ExerciseTemplateNotifierProvider call(
    int id,
  ) {
    return ExerciseTemplateNotifierProvider(
      id,
    );
  }

  @override
  ExerciseTemplateNotifierProvider getProviderOverride(
    covariant ExerciseTemplateNotifierProvider provider,
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
  String? get name => r'exerciseTemplateNotifierProvider';
}

/// See also [ExerciseTemplateNotifier].
class ExerciseTemplateNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ExerciseTemplateNotifier,
        Option<ExerciseTemplate>> {
  /// See also [ExerciseTemplateNotifier].
  ExerciseTemplateNotifierProvider(
    int id,
  ) : this._internal(
          () => ExerciseTemplateNotifier()..id = id,
          from: exerciseTemplateNotifierProvider,
          name: r'exerciseTemplateNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exerciseTemplateNotifierHash,
          dependencies: ExerciseTemplateNotifierFamily._dependencies,
          allTransitiveDependencies:
              ExerciseTemplateNotifierFamily._allTransitiveDependencies,
          id: id,
        );

  ExerciseTemplateNotifierProvider._internal(
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
    covariant ExerciseTemplateNotifier notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(ExerciseTemplateNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ExerciseTemplateNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ExerciseTemplateNotifier,
      Option<ExerciseTemplate>> createElement() {
    return _ExerciseTemplateNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExerciseTemplateNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExerciseTemplateNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<Option<ExerciseTemplate>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ExerciseTemplateNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ExerciseTemplateNotifier,
        Option<ExerciseTemplate>> with ExerciseTemplateNotifierRef {
  _ExerciseTemplateNotifierProviderElement(super.provider);

  @override
  int get id => (origin as ExerciseTemplateNotifierProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
