// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uploads.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Upload _$UploadFromJson(Map<String, dynamic> json) {
  return _Upload.fromJson(json);
}

/// @nodoc
mixin _$Upload {
  int get id => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_url')
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadCopyWith<Upload> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadCopyWith<$Res> {
  factory $UploadCopyWith(Upload value, $Res Function(Upload) then) =
      _$UploadCopyWithImpl<$Res, Upload>;
  @useResult
  $Res call({int id, String filename, @JsonKey(name: 'full_url') String url});
}

/// @nodoc
class _$UploadCopyWithImpl<$Res, $Val extends Upload>
    implements $UploadCopyWith<$Res> {
  _$UploadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filename = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadImplCopyWith<$Res> implements $UploadCopyWith<$Res> {
  factory _$$UploadImplCopyWith(
          _$UploadImpl value, $Res Function(_$UploadImpl) then) =
      __$$UploadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String filename, @JsonKey(name: 'full_url') String url});
}

/// @nodoc
class __$$UploadImplCopyWithImpl<$Res>
    extends _$UploadCopyWithImpl<$Res, _$UploadImpl>
    implements _$$UploadImplCopyWith<$Res> {
  __$$UploadImplCopyWithImpl(
      _$UploadImpl _value, $Res Function(_$UploadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filename = null,
    Object? url = null,
  }) {
    return _then(_$UploadImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadImpl implements _Upload {
  const _$UploadImpl(
      {required this.id,
      required this.filename,
      @JsonKey(name: 'full_url') required this.url});

  factory _$UploadImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadImplFromJson(json);

  @override
  final int id;
  @override
  final String filename;
  @override
  @JsonKey(name: 'full_url')
  final String url;

  @override
  String toString() {
    return 'Upload(id: $id, filename: $filename, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, filename, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadImplCopyWith<_$UploadImpl> get copyWith =>
      __$$UploadImplCopyWithImpl<_$UploadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadImplToJson(
      this,
    );
  }
}

abstract class _Upload implements Upload {
  const factory _Upload(
      {required final int id,
      required final String filename,
      @JsonKey(name: 'full_url') required final String url}) = _$UploadImpl;

  factory _Upload.fromJson(Map<String, dynamic> json) = _$UploadImpl.fromJson;

  @override
  int get id;
  @override
  String get filename;
  @override
  @JsonKey(name: 'full_url')
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$UploadImplCopyWith<_$UploadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
