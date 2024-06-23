// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$diaryEntryHash() => r'1a97acd202f8e2cdc3f19041570b28d925411133';

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

/// See also [diaryEntry].
@ProviderFor(diaryEntry)
const diaryEntryProvider = DiaryEntryFamily();

/// See also [diaryEntry].
class DiaryEntryFamily extends Family<AsyncValue<DiaryEntry>> {
  /// See also [diaryEntry].
  const DiaryEntryFamily();

  /// See also [diaryEntry].
  DiaryEntryProvider call(
    DateTime date,
  ) {
    return DiaryEntryProvider(
      date,
    );
  }

  @override
  DiaryEntryProvider getProviderOverride(
    covariant DiaryEntryProvider provider,
  ) {
    return call(
      provider.date,
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
  String? get name => r'diaryEntryProvider';
}

/// See also [diaryEntry].
class DiaryEntryProvider extends AutoDisposeFutureProvider<DiaryEntry> {
  /// See also [diaryEntry].
  DiaryEntryProvider(
    DateTime date,
  ) : this._internal(
          (ref) => diaryEntry(
            ref as DiaryEntryRef,
            date,
          ),
          from: diaryEntryProvider,
          name: r'diaryEntryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$diaryEntryHash,
          dependencies: DiaryEntryFamily._dependencies,
          allTransitiveDependencies:
              DiaryEntryFamily._allTransitiveDependencies,
          date: date,
        );

  DiaryEntryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
  }) : super.internal();

  final DateTime date;

  @override
  Override overrideWith(
    FutureOr<DiaryEntry> Function(DiaryEntryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DiaryEntryProvider._internal(
        (ref) => create(ref as DiaryEntryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<DiaryEntry> createElement() {
    return _DiaryEntryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DiaryEntryProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DiaryEntryRef on AutoDisposeFutureProviderRef<DiaryEntry> {
  /// The parameter `date` of this provider.
  DateTime get date;
}

class _DiaryEntryProviderElement
    extends AutoDisposeFutureProviderElement<DiaryEntry> with DiaryEntryRef {
  _DiaryEntryProviderElement(super.provider);

  @override
  DateTime get date => (origin as DiaryEntryProvider).date;
}

String _$todayDiaryEntryNotifierHash() =>
    r'5bd66d66b2ecb90770200b9bb739da53f8010985';

/// See also [TodayDiaryEntryNotifier].
@ProviderFor(TodayDiaryEntryNotifier)
final todayDiaryEntryNotifierProvider = AutoDisposeAsyncNotifierProvider<
    TodayDiaryEntryNotifier, DiaryEntry>.internal(
  TodayDiaryEntryNotifier.new,
  name: r'todayDiaryEntryNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todayDiaryEntryNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodayDiaryEntryNotifier = AutoDisposeAsyncNotifier<DiaryEntry>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
