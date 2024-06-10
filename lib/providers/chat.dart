import 'dart:convert';

import 'package:fitness_app/models/chat.dart';
import 'package:fitness_app/models/page.dart';
import 'package:fitness_app/utils/api.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat.g.dart';

@riverpod
Future<Chat> chatById(ChatByIdRef ref, int id) async {
  final result = await apiFetch(HttpMethod.get, '/chats/chat/$id', ref: ref);

  switch (result) {
    case Left(value: final response):
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      return Chat.fromJson(data);
    case Right(value: final exception):
      presentError(exception, ref: ref);
      throw exception;
  }
}

@riverpod
Future<Chat> chatByUserId(ChatByUserIdRef ref, int userId) async {
  final result = await apiFetch(
    HttpMethod.get,
    '/chats/user/$userId',
    ref: ref,
  );

  switch (result) {
    case Left(value: final response):
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      return Chat.fromJson(data);
    case Right(value: final exception):
      presentError(exception, ref: ref);
      throw exception;
  }
}

@riverpod
Future<List<Message>> chatMessages(
  ChatMessagesRef ref,
  int chatId,
  int page,
  int count,
) async {
  final result = await apiFetch(
    HttpMethod.get,
    '/messages/$chatId',
    ref: ref,
    params: {'page': page.toString(), 'size': count.toString()},
    minTime: Duration.zero,
  );

  switch (result) {
    case Left(value: final response):
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      return Page<Message>.fromJson(
        data,
        (object) => Message.fromJson(object as Map<String, Object?>),
      ).items;
    case Right(value: final exception):
      presentError(exception, ref: ref);
      throw exception;
  }
}
