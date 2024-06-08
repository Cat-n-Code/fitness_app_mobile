import 'package:fitness_app/models/chat.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum MessageBubbleSide { left, right }

class MessageBubble extends ConsumerWidget {
  const MessageBubble({super.key, required this.side, required this.message});

  static const maxWidth = 280.0;

  final MessageBubbleSide side;
  final AsyncValue<Message> message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final message = this.message.valueOrNull ?? Message.mock();
    final userValue = ref.watch(userByIdProvider(message.senderId));
    final user = userValue.valueOrNull ?? User.mock();

    return Skeletonizer(
      enabled: !this.message.hasValue || !userValue.hasValue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        textDirection: switch (side) {
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
      constraints: const BoxConstraints(maxWidth: maxWidth),
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
          const SizedBox(height: 4.0),
          Text(message.content)
        ],
      ),
    );
  }
}
