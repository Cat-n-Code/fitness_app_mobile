import 'dart:async';
import 'dart:math';

import 'package:fitness_app/models/chat.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/users.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum MessageBubbleSide { left, right }

class MessageBubble extends ConsumerStatefulWidget {
  const MessageBubble({super.key, required this.side, required this.message});

  static const maxWidth = 280.0;
  static const voicePreviewHeight = 24.0;

  final MessageBubbleSide side;
  final AsyncValue<Message> message;

  @override
  ConsumerState<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends ConsumerState<MessageBubble> {
  final _player = AudioPlayer();
  late final StreamSubscription<Duration> _positionSubscription;

  @override
  void initState() {
    super.initState();

    _positionSubscription = _player.positionStream.listen(
      (p) => setState(() => ()),
    );
  }

  @override
  void didUpdateWidget(covariant MessageBubble oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.message case AsyncData(value: final message)
        when message.voiceUrl != null &&
            message.voiceUrl != oldWidget.message.valueOrNull?.voiceUrl) {
      _player.setUrl(message.voiceUrl!).then(
        (value) => (),
        onError: (error) {
          presentError(error, widgetRef: ref);
        },
      );
    }
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final message = widget.message.valueOrNull ?? Message.mock();
    final userValue = ref.watch(userByIdProvider(message.senderId));
    final user = userValue.valueOrNull ?? User.mock();

    return Skeletonizer(
      enabled: !widget.message.hasValue || !userValue.hasValue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        textDirection: switch (widget.side) {
          MessageBubbleSide.left => TextDirection.rtl,
          MessageBubbleSide.right => TextDirection.ltr,
        },
        children: [
          Skeleton.leaf(
            child: _buildBubble(
              user,
              message,
              theme.colorScheme,
              theme.textTheme,
            ),
          ),
          const SizedBox(width: 8.0),
          Skeleton.shade(
            child: CircleAvatar(backgroundImage: user.photo, radius: 20.0),
          ),
        ],
      ),
    );
  }

  Widget _buildBubble(
    User user,
    Message message,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20.0),
      ),
      constraints: const BoxConstraints(maxWidth: MessageBubble.maxWidth),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          if (message.content.isNotEmpty) Text(message.content),
          if (message.voiceUrl != null) _buildVoicePlayer(colorScheme),
        ],
      ),
    );
  }

  Widget _buildVoicePlayer(ColorScheme colorScheme) {
    const loadingStates = [ProcessingState.completed, ProcessingState.ready];

    final IconData icon;
    if (_player.processingState == ProcessingState.completed) {
      icon = Icons.replay;
    } else if (_player.playing) {
      icon = Icons.pause;
    } else {
      icon = Icons.play_arrow;
    }

    final currPosition = _player.position.inMilliseconds /
        (_player.duration?.inMilliseconds ?? 1.0);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (loadingStates.contains(_player.processingState))
          IconButton.filled(
            onPressed: () => setState(() {
              if (_player.processingState == ProcessingState.completed) {
                _player.seek(Duration.zero).then((_) => _player.play());
              } else if (_player.playing) {
                _player.pause();
              } else {
                _player.play();
              }
            }),
            icon: Icon(icon, color: colorScheme.onPrimary),
          )
        else
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 32.0,
              height: 32.0,
              child: CircularProgressIndicator(),
            ),
          ),
        const SizedBox(width: 8.0),
        for (var i = 0; i < 32; ++i)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: Container(
              width: 4.0,
              height: MessageBubble.voicePreviewHeight *
                  (sin(i / 8.0 * pi) + 1.4) /
                  2.0,
              decoration: BoxDecoration(
                color: i / 32.0 < currPosition
                    ? darkColor.withAlpha(200)
                    : darkColor.withAlpha(120),
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
          ),
      ],
    );
  }
}
