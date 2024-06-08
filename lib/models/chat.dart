import 'package:fitness_app/models/users.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

enum ChatType {
  @JsonValue('DIALOGUE')
  dialog,
  @JsonValue('WORKOUT')
  workout;
}

@freezed
class Chat with _$Chat {
  const factory Chat({
    required int id,
    required ChatType type,
    @JsonKey(name: 'last_timestamp') required DateTime lastTimestamp,
    required List<User> users,
  }) = _Chat;

  factory Chat.fromJson(Map<String, Object?> json) => _$ChatFromJson(json);
}

@freezed
class Message with _$Message {
  const factory Message({
    required int id,
    @JsonKey(name: 'chat_id') required int chatId,
    @JsonKey(name: 'sender_id') required int senderId,
    required DateTime timestamp,
    required String content,
  }) = _Message;

  factory Message.fromJson(Map<String, Object?> json) =>
      _$MessageFromJson(json);

  factory Message.mock() => Message(
        id: 1,
        chatId: 1,
        senderId: 1,
        timestamp: DateTime.now(),
        content: BoneMock.paragraph,
      );
}

@freezed
class MessageSend with _$MessageSend {
  const factory MessageSend({
    required String content,
    required List<String> files,
  }) = _MessageSend;

  factory MessageSend.fromJson(Map<String, Object?> json) =>
      _$MessageSendFromJson(json);
}
