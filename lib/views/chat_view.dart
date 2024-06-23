import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:fitness_app/models/uploads.dart';
import 'package:path/path.dart' as path;
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fitness_app/models/chat.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/chat.dart';
import 'package:fitness_app/providers/users.dart';
import 'package:fitness_app/utils/api.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fitness_app/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
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
  final _recorder = AudioRecorder();
  final _usedPages = <int>{};
  late final Timer _timer;

  bool _showVoiceButton = false;
  bool _isRecording = false;
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

    _textController.addListener(() {
      _showVoiceButton = _textController.text.isEmpty;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _recorder.dispose();
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
    final theme = Theme.of(context);
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
          _buildInputBar(chatValue.valueOrNull, ref, theme.colorScheme),
        ],
      ),
    );
  }

  Widget _buildInputBar(Chat? chat, WidgetRef ref, ColorScheme colorScheme) {
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
          _buildSendButton(chat, colorScheme),
        ],
      ),
    );
  }

  Widget _buildSendButton(Chat? chat, ColorScheme colorScheme) {
    return TweenAnimationBuilder(
      tween: Tween(end: _isRecording ? 1.0 : 0.0),
      duration: Durations.short4,
      curve: Curves.easeOut,
      builder: (context, value, child) => Transform.scale(
        scale: lerpDouble(1.0, 1.4, value),
        child: GestureDetector(
          onLongPressStart: (details) => _onRecordingStarted(),
          onLongPressEnd: (details) => _onRecordingFinished(chat!),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 48.0,
              minHeight: 48.0,
            ),
            child: Skeleton.shade(
              child: Material(
                borderRadius: BorderRadius.circular(24.0),
                color: Color.lerp(
                  colorScheme.primary,
                  colorScheme.secondary,
                  value,
                ),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () => _onSend(chat!, ref),
                  child: Center(
                    child: Icon(
                      _showVoiceButton ? Icons.mic : Icons.send,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onSend(Chat chat, WidgetRef ref) async {
    final content = _textController.text.trim();

    if (content.isEmpty) {
      return;
    }

    final message = MessageSend(content: content.trim(), files: []);

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

  void _onRecordingStarted() async {
    if (_isRecording) {
      return;
    }

    if (!(await _recorder.hasPermission())) {
      return;
    }

    setState(() => _isRecording = true);

    final tempDir = await getTemporaryDirectory();
    await _recorder.start(
      const RecordConfig(
        encoder: AudioEncoder.aacLc,
      ),
      path: path.join(tempDir.path, 'voice.m4a'),
    );
  }

  void _onRecordingFinished(Chat chat) async {
    setState(() {
      _isLoading = true;
      _isRecording = false;
    });

    final path = await _recorder.stop();

    try {
      if (path == null) {
        return;
      }

      final file = await uploadFile(path, widgetRef: ref);
      if (file case Right(value: final exception)) {
        presentError(exception, widgetRef: ref);
        return;
      }

      final message = MessageSend(
        content: '',
        voiceFilename: (file as Left<Upload, Exception>).value.filename,
      );

      final result = await apiFetch(
        HttpMethod.post,
        '/messages/${chat.id}',
        widgetRef: ref,
        body: jsonEncode(message),
      );

      if (result case Right(value: final exception)) {
        presentError(exception, widgetRef: ref);
      }
    } finally {
      setState(() => _isLoading = false);
    }
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
