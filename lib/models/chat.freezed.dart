// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return _Chat.fromJson(json);
}

/// @nodoc
mixin _$Chat {
  int get id => throw _privateConstructorUsedError;
  ChatType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_timestamp')
  DateTime get lastTimestamp => throw _privateConstructorUsedError;
  List<User> get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCopyWith<Chat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res, Chat>;
  @useResult
  $Res call(
      {int id,
      ChatType type,
      @JsonKey(name: 'last_timestamp') DateTime lastTimestamp,
      List<User> users});
}

/// @nodoc
class _$ChatCopyWithImpl<$Res, $Val extends Chat>
    implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? lastTimestamp = null,
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChatType,
      lastTimestamp: null == lastTimestamp
          ? _value.lastTimestamp
          : lastTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatImplCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$$ChatImplCopyWith(
          _$ChatImpl value, $Res Function(_$ChatImpl) then) =
      __$$ChatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      ChatType type,
      @JsonKey(name: 'last_timestamp') DateTime lastTimestamp,
      List<User> users});
}

/// @nodoc
class __$$ChatImplCopyWithImpl<$Res>
    extends _$ChatCopyWithImpl<$Res, _$ChatImpl>
    implements _$$ChatImplCopyWith<$Res> {
  __$$ChatImplCopyWithImpl(_$ChatImpl _value, $Res Function(_$ChatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? lastTimestamp = null,
    Object? users = null,
  }) {
    return _then(_$ChatImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChatType,
      lastTimestamp: null == lastTimestamp
          ? _value.lastTimestamp
          : lastTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatImpl implements _Chat {
  const _$ChatImpl(
      {required this.id,
      required this.type,
      @JsonKey(name: 'last_timestamp') required this.lastTimestamp,
      required final List<User> users})
      : _users = users;

  factory _$ChatImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatImplFromJson(json);

  @override
  final int id;
  @override
  final ChatType type;
  @override
  @JsonKey(name: 'last_timestamp')
  final DateTime lastTimestamp;
  final List<User> _users;
  @override
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'Chat(id: $id, type: $type, lastTimestamp: $lastTimestamp, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.lastTimestamp, lastTimestamp) ||
                other.lastTimestamp == lastTimestamp) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, lastTimestamp,
      const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatImplCopyWith<_$ChatImpl> get copyWith =>
      __$$ChatImplCopyWithImpl<_$ChatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatImplToJson(
      this,
    );
  }
}

abstract class _Chat implements Chat {
  const factory _Chat(
      {required final int id,
      required final ChatType type,
      @JsonKey(name: 'last_timestamp') required final DateTime lastTimestamp,
      required final List<User> users}) = _$ChatImpl;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$ChatImpl.fromJson;

  @override
  int get id;
  @override
  ChatType get type;
  @override
  @JsonKey(name: 'last_timestamp')
  DateTime get lastTimestamp;
  @override
  List<User> get users;
  @override
  @JsonKey(ignore: true)
  _$$ChatImplCopyWith<_$ChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'chat_id')
  int get chatId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_id')
  int get senderId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_urls')
  List<String> get fileUrls => throw _privateConstructorUsedError;
  @JsonKey(name: 'voice_url')
  String? get voiceUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'chat_id') int chatId,
      @JsonKey(name: 'sender_id') int senderId,
      DateTime timestamp,
      String content,
      @JsonKey(name: 'file_urls') List<String> fileUrls,
      @JsonKey(name: 'voice_url') String? voiceUrl});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chatId = null,
    Object? senderId = null,
    Object? timestamp = null,
    Object? content = null,
    Object? fileUrls = null,
    Object? voiceUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrls: null == fileUrls
          ? _value.fileUrls
          : fileUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      voiceUrl: freezed == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'chat_id') int chatId,
      @JsonKey(name: 'sender_id') int senderId,
      DateTime timestamp,
      String content,
      @JsonKey(name: 'file_urls') List<String> fileUrls,
      @JsonKey(name: 'voice_url') String? voiceUrl});
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chatId = null,
    Object? senderId = null,
    Object? timestamp = null,
    Object? content = null,
    Object? fileUrls = null,
    Object? voiceUrl = freezed,
  }) {
    return _then(_$MessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrls: null == fileUrls
          ? _value._fileUrls
          : fileUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      voiceUrl: freezed == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl implements _Message {
  const _$MessageImpl(
      {required this.id,
      @JsonKey(name: 'chat_id') required this.chatId,
      @JsonKey(name: 'sender_id') required this.senderId,
      required this.timestamp,
      this.content = '',
      @JsonKey(name: 'file_urls') final List<String> fileUrls = const [],
      @JsonKey(name: 'voice_url') this.voiceUrl})
      : _fileUrls = fileUrls;

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'chat_id')
  final int chatId;
  @override
  @JsonKey(name: 'sender_id')
  final int senderId;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final String content;
  final List<String> _fileUrls;
  @override
  @JsonKey(name: 'file_urls')
  List<String> get fileUrls {
    if (_fileUrls is EqualUnmodifiableListView) return _fileUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fileUrls);
  }

  @override
  @JsonKey(name: 'voice_url')
  final String? voiceUrl;

  @override
  String toString() {
    return 'Message(id: $id, chatId: $chatId, senderId: $senderId, timestamp: $timestamp, content: $content, fileUrls: $fileUrls, voiceUrl: $voiceUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._fileUrls, _fileUrls) &&
            (identical(other.voiceUrl, voiceUrl) ||
                other.voiceUrl == voiceUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, chatId, senderId, timestamp,
      content, const DeepCollectionEquality().hash(_fileUrls), voiceUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {required final int id,
      @JsonKey(name: 'chat_id') required final int chatId,
      @JsonKey(name: 'sender_id') required final int senderId,
      required final DateTime timestamp,
      final String content,
      @JsonKey(name: 'file_urls') final List<String> fileUrls,
      @JsonKey(name: 'voice_url') final String? voiceUrl}) = _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'chat_id')
  int get chatId;
  @override
  @JsonKey(name: 'sender_id')
  int get senderId;
  @override
  DateTime get timestamp;
  @override
  String get content;
  @override
  @JsonKey(name: 'file_urls')
  List<String> get fileUrls;
  @override
  @JsonKey(name: 'voice_url')
  String? get voiceUrl;
  @override
  @JsonKey(ignore: true)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageSend _$MessageSendFromJson(Map<String, dynamic> json) {
  return _MessageSend.fromJson(json);
}

/// @nodoc
mixin _$MessageSend {
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'filenames')
  List<String> get files => throw _privateConstructorUsedError;
  @JsonKey(name: 'voice_filename')
  String? get voiceFilename => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageSendCopyWith<MessageSend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageSendCopyWith<$Res> {
  factory $MessageSendCopyWith(
          MessageSend value, $Res Function(MessageSend) then) =
      _$MessageSendCopyWithImpl<$Res, MessageSend>;
  @useResult
  $Res call(
      {String content,
      @JsonKey(name: 'filenames') List<String> files,
      @JsonKey(name: 'voice_filename') String? voiceFilename});
}

/// @nodoc
class _$MessageSendCopyWithImpl<$Res, $Val extends MessageSend>
    implements $MessageSendCopyWith<$Res> {
  _$MessageSendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? files = null,
    Object? voiceFilename = freezed,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<String>,
      voiceFilename: freezed == voiceFilename
          ? _value.voiceFilename
          : voiceFilename // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageSendImplCopyWith<$Res>
    implements $MessageSendCopyWith<$Res> {
  factory _$$MessageSendImplCopyWith(
          _$MessageSendImpl value, $Res Function(_$MessageSendImpl) then) =
      __$$MessageSendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String content,
      @JsonKey(name: 'filenames') List<String> files,
      @JsonKey(name: 'voice_filename') String? voiceFilename});
}

/// @nodoc
class __$$MessageSendImplCopyWithImpl<$Res>
    extends _$MessageSendCopyWithImpl<$Res, _$MessageSendImpl>
    implements _$$MessageSendImplCopyWith<$Res> {
  __$$MessageSendImplCopyWithImpl(
      _$MessageSendImpl _value, $Res Function(_$MessageSendImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? files = null,
    Object? voiceFilename = freezed,
  }) {
    return _then(_$MessageSendImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<String>,
      voiceFilename: freezed == voiceFilename
          ? _value.voiceFilename
          : voiceFilename // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageSendImpl implements _MessageSend {
  const _$MessageSendImpl(
      {this.content = '',
      @JsonKey(name: 'filenames') final List<String> files = const [],
      @JsonKey(name: 'voice_filename') this.voiceFilename})
      : _files = files;

  factory _$MessageSendImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageSendImplFromJson(json);

  @override
  @JsonKey()
  final String content;
  final List<String> _files;
  @override
  @JsonKey(name: 'filenames')
  List<String> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  @JsonKey(name: 'voice_filename')
  final String? voiceFilename;

  @override
  String toString() {
    return 'MessageSend(content: $content, files: $files, voiceFilename: $voiceFilename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageSendImpl &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.voiceFilename, voiceFilename) ||
                other.voiceFilename == voiceFilename));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content,
      const DeepCollectionEquality().hash(_files), voiceFilename);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageSendImplCopyWith<_$MessageSendImpl> get copyWith =>
      __$$MessageSendImplCopyWithImpl<_$MessageSendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageSendImplToJson(
      this,
    );
  }
}

abstract class _MessageSend implements MessageSend {
  const factory _MessageSend(
          {final String content,
          @JsonKey(name: 'filenames') final List<String> files,
          @JsonKey(name: 'voice_filename') final String? voiceFilename}) =
      _$MessageSendImpl;

  factory _MessageSend.fromJson(Map<String, dynamic> json) =
      _$MessageSendImpl.fromJson;

  @override
  String get content;
  @override
  @JsonKey(name: 'filenames')
  List<String> get files;
  @override
  @JsonKey(name: 'voice_filename')
  String? get voiceFilename;
  @override
  @JsonKey(ignore: true)
  _$$MessageSendImplCopyWith<_$MessageSendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
