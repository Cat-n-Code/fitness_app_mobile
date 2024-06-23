// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatImpl _$$ChatImplFromJson(Map<String, dynamic> json) => _$ChatImpl(
      id: (json['id'] as num).toInt(),
      type: $enumDecode(_$ChatTypeEnumMap, json['type']),
      lastTimestamp: DateTime.parse(json['last_timestamp'] as String),
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatImplToJson(_$ChatImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ChatTypeEnumMap[instance.type]!,
      'last_timestamp': instance.lastTimestamp.toIso8601String(),
      'users': instance.users,
    };

const _$ChatTypeEnumMap = {
  ChatType.dialog: 'DIALOGUE',
  ChatType.workout: 'WORKOUT',
};

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: (json['id'] as num).toInt(),
      chatId: (json['chat_id'] as num).toInt(),
      senderId: (json['sender_id'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      content: json['content'] as String? ?? '',
      fileUrls: (json['file_urls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      voiceUrl: json['voice_url'] as String?,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chat_id': instance.chatId,
      'sender_id': instance.senderId,
      'timestamp': instance.timestamp.toIso8601String(),
      'content': instance.content,
      'file_urls': instance.fileUrls,
      'voice_url': instance.voiceUrl,
    };

_$MessageSendImpl _$$MessageSendImplFromJson(Map<String, dynamic> json) =>
    _$MessageSendImpl(
      content: json['content'] as String? ?? '',
      files: (json['filenames'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      voiceFilename: json['voice_filename'] as String?,
    );

Map<String, dynamic> _$$MessageSendImplToJson(_$MessageSendImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'filenames': instance.files,
      'voice_filename': instance.voiceFilename,
    };
