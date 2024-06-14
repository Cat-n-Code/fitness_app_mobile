import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fitness_app/models/chat.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/chat.dart';
import 'package:fitness_app/providers/users.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/utils/api.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fitness_app/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ChatView extends ConsumerStatefulWidget {
  const ChatView({super.key, this.chatId, this.userId});

  final int? chatId;
  final int? userId;

  @override
  ConsumerState<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  static const pageSize = 10;

  final _textController = TextEditingController();
  final _usedPages = <int>{};
  late final Timer _timer;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      const Duration(milliseconds: 400),
      (timer) {
        final AsyncValue<Chat> chatValue;
        if (widget.chatId != null) {
          chatValue = ref.watch(chatByIdProvider(widget.chatId!));
        } else if (widget.userId != null) {
          chatValue = ref.watch(chatByUserIdProvider(widget.userId!));
        } else {
          throw ArgumentError('chatId or userId must not be null');
        }

        if (!chatValue.hasValue) {
          return;
        }

        for (final page in _usedPages) {
          final _ = ref.refresh(chatMessagesProvider(
            chatValue.value!.id,
            page,
            pageSize,
          ));
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<Chat> chatValue;
    if (widget.chatId != null) {
      chatValue = ref.watch(chatByIdProvider(widget.chatId!));
    } else if (widget.userId != null) {
      chatValue = ref.watch(chatByUserIdProvider(widget.userId!));
    } else {
      throw ArgumentError('chatId or userId must not be null');
    }

    final currentUserValue = ref.watch(currentUserNotifierProvider);
    final currentUser =
        currentUserValue.valueOrNull?.toNullable() ?? User.mock();
    final User otherUser;
    if (chatValue.hasValue && currentUserValue.hasValue) {
      otherUser = chatValue.value!.users
          .filter(
            (u) =>
                u.id != (currentUserValue.valueOrNull! as Some<User>).value.id,
          )
          .first;
    } else {
      otherUser = User.mock();
    }

    return Scaffold(
      appBar: _buildAppBar(context, chatValue, otherUser),
      body: Skeletonizer(
        enabled: !chatValue.hasValue,
        child: _buildBody(currentUser, otherUser, chatValue, context),
      ),
    );
  }

  AppBar _buildAppBar(
    BuildContext context,
    AsyncValue<Chat> chatValue,
    User otherUser,
  ) {
    return AppBar(
      titleSpacing: 4.0,
      title: Skeletonizer(
        enabled: !chatValue.hasValue,
        child: Row(
          children: [
            CircleAvatar(backgroundImage: otherUser.photo, radius: 20.0),
            const SizedBox(width: 12.0),
            Text(otherUser.name)
          ],
        ),
      ),
      actions: [
        Tooltip(
          message: 'chat_view.attach_tooltip'.tr(context: context),
          child: IconButton(
            onPressed: _onFileAttachClicked,
            icon: const Icon(Icons.attach_file),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(
    User currentUser,
    User otherUser,
    AsyncValue<Chat> chatValue,
    BuildContext context,
  ) {
    _usedPages.clear();

    return Padding(
      padding: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemBuilder: (context, index) {
                final page = index ~/ pageSize;
                final pageIndex = index - page * pageSize;
                final message = chatValue
                    .map(
                      data: (chat) => ref.watch(
                        chatMessagesProvider(chat.value.id, page, pageSize),
                      ),
                      error: (error) => AsyncError<List<Message>>(
                        error,
                        error.stackTrace,
                      ),
                      loading: (loading) => const AsyncLoading<List<Message>>(),
                    )
                    .map(
                      data: (list) => pageIndex < list.value.length
                          ? AsyncData(list.value[pageIndex])
                          : null,
                      error: (error) => AsyncError<Message>(
                        error,
                        error.stackTrace,
                      ),
                      loading: (loading) => const AsyncLoading<Message>(),
                    );

                _usedPages.add(page);

                if (message == null) {
                  return null;
                }

                final MessageBubbleSide side;
                if (!message.hasValue) {
                  side = index % 2 == 0
                      ? MessageBubbleSide.right
                      : MessageBubbleSide.left;
                } else if (message.value!.senderId == currentUser.id) {
                  side = MessageBubbleSide.right;
                } else {
                  side = MessageBubbleSide.left;
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: MessageBubble(message: message, side: side),
                );
              },
            ),
          ),
          const SizedBox(height: 16.0),
          _buildInputBar(chatValue.valueOrNull, ref),
        ],
      ),
    );
  }

  Widget _buildInputBar(Chat? chat, WidgetRef ref) {
    return Skeletonizer(
      enabled: _isLoading,
      child: Row(
        children: [
          Expanded(
            child: Skeleton.shade(
              child: TextField(
                controller: _textController,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                onSubmitted: (s) => _onSend(chat!, ref),
                autofocus: true,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          IconButton.filled(
            onPressed: () => _onSend(chat!, ref),
            style: iconPrimaryButton,
            icon: const Icon(Icons.send),
          )
        ],
      ),
    );
  }

  void _onSend(Chat chat, WidgetRef ref) async {
    if (_textController.text.isEmpty) {
      return;
    }

    final message = MessageSend(
      content: _textController.text.trim(),
      files: [],
    );

    setState(() {
      _isLoading = true;
      _textController.text = '';
    });

    final result = await apiFetch(
      HttpMethod.post,
      '/messages/${chat.id}',
      widgetRef: ref,
      body: jsonEncode(message),
    );

    if (result case Right(value: final exception)) {
      presentError(exception, widgetRef: ref);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _onFileAttachClicked() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.media,
        withData: false,
        withReadStream: true,
      );

      if (result == null) {
        return;
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
