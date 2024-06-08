// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Page<T> _$PageFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _Page<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$Page<T> {
  @JsonKey(name: 'total_items_count')
  int get totalItemsCount => throw _privateConstructorUsedError;
  List<T> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageCopyWith<T, Page<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageCopyWith<T, $Res> {
  factory $PageCopyWith(Page<T> value, $Res Function(Page<T>) then) =
      _$PageCopyWithImpl<T, $Res, Page<T>>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_items_count') int totalItemsCount, List<T> items});
}

/// @nodoc
class _$PageCopyWithImpl<T, $Res, $Val extends Page<T>>
    implements $PageCopyWith<T, $Res> {
  _$PageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItemsCount = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      totalItemsCount: null == totalItemsCount
          ? _value.totalItemsCount
          : totalItemsCount // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageImplCopyWith<T, $Res> implements $PageCopyWith<T, $Res> {
  factory _$$PageImplCopyWith(
          _$PageImpl<T> value, $Res Function(_$PageImpl<T>) then) =
      __$$PageImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_items_count') int totalItemsCount, List<T> items});
}

/// @nodoc
class __$$PageImplCopyWithImpl<T, $Res>
    extends _$PageCopyWithImpl<T, $Res, _$PageImpl<T>>
    implements _$$PageImplCopyWith<T, $Res> {
  __$$PageImplCopyWithImpl(
      _$PageImpl<T> _value, $Res Function(_$PageImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItemsCount = null,
    Object? items = null,
  }) {
    return _then(_$PageImpl<T>(
      totalItemsCount: null == totalItemsCount
          ? _value.totalItemsCount
          : totalItemsCount // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$PageImpl<T> implements _Page<T> {
  const _$PageImpl(
      {@JsonKey(name: 'total_items_count') required this.totalItemsCount,
      required final List<T> items})
      : _items = items;

  factory _$PageImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$PageImplFromJson(json, fromJsonT);

  @override
  @JsonKey(name: 'total_items_count')
  final int totalItemsCount;
  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Page<$T>(totalItemsCount: $totalItemsCount, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageImpl<T> &&
            (identical(other.totalItemsCount, totalItemsCount) ||
                other.totalItemsCount == totalItemsCount) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalItemsCount,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageImplCopyWith<T, _$PageImpl<T>> get copyWith =>
      __$$PageImplCopyWithImpl<T, _$PageImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$PageImplToJson<T>(this, toJsonT);
  }
}

abstract class _Page<T> implements Page<T> {
  const factory _Page(
      {@JsonKey(name: 'total_items_count') required final int totalItemsCount,
      required final List<T> items}) = _$PageImpl<T>;

  factory _Page.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$PageImpl<T>.fromJson;

  @override
  @JsonKey(name: 'total_items_count')
  int get totalItemsCount;
  @override
  List<T> get items;
  @override
  @JsonKey(ignore: true)
  _$$PageImplCopyWith<T, _$PageImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
