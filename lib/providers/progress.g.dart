// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myProgressHash() => r'19ec22d3cdbe75855185ad45d8031a5fb3baac6d';

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

/// See also [myProgress].
@ProviderFor(myProgress)
const myProgressProvider = MyProgressFamily();

/// See also [myProgress].
class MyProgressFamily extends Family<AsyncValue<List<ProgressEntry>>> {
  /// See also [myProgress].
  const MyProgressFamily();

  /// See also [myProgress].
  MyProgressProvider call(
    DateTime start,
    DateTime end,
  ) {
    return MyProgressProvider(
      start,
      end,
    );
  }

  @override
  MyProgressProvider getProviderOverride(
    covariant MyProgressProvider provider,
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
  String? get name => r'myProgressProvider';
}

/// See also [myProgress].
class MyProgressProvider
    extends AutoDisposeFutureProvider<List<ProgressEntry>> {
  /// See also [myProgress].
  MyProgressProvider(
    DateTime start,
    DateTime end,
  ) : this._internal(
          (ref) => myProgress(
            ref as MyProgressRef,
            start,
            end,
          ),
          from: myProgressProvider,
          name: r'myProgressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myProgressHash,
          dependencies: MyProgressFamily._dependencies,
          allTransitiveDependencies:
              MyProgressFamily._allTransitiveDependencies,
          start: start,
          end: end,
        );

  MyProgressProvider._internal(
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
    FutureOr<List<ProgressEntry>> Function(MyProgressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyProgressProvider._internal(
        (ref) => create(ref as MyProgressRef),
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
  AutoDisposeFutureProviderElement<List<ProgressEntry>> createElement() {
    return _MyProgressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyProgressProvider &&
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

mixin MyProgressRef on AutoDisposeFutureProviderRef<List<ProgressEntry>> {
  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;
}

class _MyProgressProviderElement
    extends AutoDisposeFutureProviderElement<List<ProgressEntry>>
    with MyProgressRef {
  _MyProgressProviderElement(super.provider);

  @override
  DateTime get start => (origin as MyProgressProvider).start;
  @override
  DateTime get end => (origin as MyProgressProvider).end;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
