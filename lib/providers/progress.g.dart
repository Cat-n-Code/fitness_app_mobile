// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$stepsProgressHash() => r'1b7b0387b17c1caeab74c1f822cbeab6ba89ff64';

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

/// See also [stepsProgress].
@ProviderFor(stepsProgress)
const stepsProgressProvider = StepsProgressFamily();

/// See also [stepsProgress].
class StepsProgressFamily extends Family<AsyncValue<List<StepsEntry>>> {
  /// See also [stepsProgress].
  const StepsProgressFamily();

  /// See also [stepsProgress].
  StepsProgressProvider call(
    DateTime start,
    DateTime end,
  ) {
    return StepsProgressProvider(
      start,
      end,
    );
  }

  @override
  StepsProgressProvider getProviderOverride(
    covariant StepsProgressProvider provider,
  ) {
    return call(
      provider.start,
      provider.end,
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
  String? get name => r'stepsProgressProvider';
}

/// See also [stepsProgress].
class StepsProgressProvider
    extends AutoDisposeFutureProvider<List<StepsEntry>> {
  /// See also [stepsProgress].
  StepsProgressProvider(
    DateTime start,
    DateTime end,
  ) : this._internal(
          (ref) => stepsProgress(
            ref as StepsProgressRef,
            start,
            end,
          ),
          from: stepsProgressProvider,
          name: r'stepsProgressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stepsProgressHash,
          dependencies: StepsProgressFamily._dependencies,
          allTransitiveDependencies:
              StepsProgressFamily._allTransitiveDependencies,
          start: start,
          end: end,
        );

  StepsProgressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.start,
    required this.end,
  }) : super.internal();

  final DateTime start;
  final DateTime end;

  @override
  Override overrideWith(
    FutureOr<List<StepsEntry>> Function(StepsProgressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StepsProgressProvider._internal(
        (ref) => create(ref as StepsProgressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        start: start,
        end: end,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<StepsEntry>> createElement() {
    return _StepsProgressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StepsProgressProvider &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, start.hashCode);
    hash = _SystemHash.combine(hash, end.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StepsProgressRef on AutoDisposeFutureProviderRef<List<StepsEntry>> {
  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;
}

class _StepsProgressProviderElement
    extends AutoDisposeFutureProviderElement<List<StepsEntry>>
    with StepsProgressRef {
  _StepsProgressProviderElement(super.provider);

  @override
  DateTime get start => (origin as StepsProgressProvider).start;
  @override
  DateTime get end => (origin as StepsProgressProvider).end;
}

String _$waterProgressHash() => r'ad789647683e8d2fd87249b0a1a997a25fc13a1b';

/// See also [waterProgress].
@ProviderFor(waterProgress)
const waterProgressProvider = WaterProgressFamily();

/// See also [waterProgress].
class WaterProgressFamily extends Family<AsyncValue<List<WaterEntry>>> {
  /// See also [waterProgress].
  const WaterProgressFamily();

  /// See also [waterProgress].
  WaterProgressProvider call(
    DateTime start,
    DateTime end,
  ) {
    return WaterProgressProvider(
      start,
      end,
    );
  }

  @override
  WaterProgressProvider getProviderOverride(
    covariant WaterProgressProvider provider,
  ) {
    return call(
      provider.start,
      provider.end,
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
  String? get name => r'waterProgressProvider';
}

/// See also [waterProgress].
class WaterProgressProvider
    extends AutoDisposeFutureProvider<List<WaterEntry>> {
  /// See also [waterProgress].
  WaterProgressProvider(
    DateTime start,
    DateTime end,
  ) : this._internal(
          (ref) => waterProgress(
            ref as WaterProgressRef,
            start,
            end,
          ),
          from: waterProgressProvider,
          name: r'waterProgressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$waterProgressHash,
          dependencies: WaterProgressFamily._dependencies,
          allTransitiveDependencies:
              WaterProgressFamily._allTransitiveDependencies,
          start: start,
          end: end,
        );

  WaterProgressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.start,
    required this.end,
  }) : super.internal();

  final DateTime start;
  final DateTime end;

  @override
  Override overrideWith(
    FutureOr<List<WaterEntry>> Function(WaterProgressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WaterProgressProvider._internal(
        (ref) => create(ref as WaterProgressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        start: start,
        end: end,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<WaterEntry>> createElement() {
    return _WaterProgressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WaterProgressProvider &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, start.hashCode);
    hash = _SystemHash.combine(hash, end.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WaterProgressRef on AutoDisposeFutureProviderRef<List<WaterEntry>> {
  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;
}

class _WaterProgressProviderElement
    extends AutoDisposeFutureProviderElement<List<WaterEntry>>
    with WaterProgressRef {
  _WaterProgressProviderElement(super.provider);

  @override
  DateTime get start => (origin as WaterProgressProvider).start;
  @override
  DateTime get end => (origin as WaterProgressProvider).end;
}

String _$todayStepsProgressHash() =>
    r'3fa465da054059794cba37a60b4ea90f969ae5f6';

/// See also [TodayStepsProgress].
@ProviderFor(TodayStepsProgress)
final todayStepsProgressProvider =
    AutoDisposeAsyncNotifierProvider<TodayStepsProgress, StepsEntry>.internal(
  TodayStepsProgress.new,
  name: r'todayStepsProgressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todayStepsProgressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodayStepsProgress = AutoDisposeAsyncNotifier<StepsEntry>;
String _$todayWaterProgressHash() =>
    r'cb996ea73d1423e18c171300516e43825a3f2fd3';

/// See also [TodayWaterProgress].
@ProviderFor(TodayWaterProgress)
final todayWaterProgressProvider =
    AutoDisposeAsyncNotifierProvider<TodayWaterProgress, WaterEntry>.internal(
  TodayWaterProgress.new,
  name: r'todayWaterProgressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todayWaterProgressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodayWaterProgress = AutoDisposeAsyncNotifier<WaterEntry>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
