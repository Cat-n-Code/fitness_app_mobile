import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/users.dart';
import 'package:fitness_app/theme.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserCard extends ConsumerWidget {
  const UserCard({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final userValue = ref.watch(currentUserNotifierProvider);
    final user = userValue.asData?.value.toNullable() ??
        User(
          id: 1,
          name: BoneMock.name,
          email: BoneMock.email,
          goal: UserGoal.beActive,
          sex: null,
          birthDate: DateTime.now(),
          level: null,
          preference: null,
        );

    return Skeletonizer(
      enabled: userValue.isLoading,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: userValue.hasValue ? onTap : null,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 4.0, 32.0, 4.0),
          child: SizedBox(
            height: 72.0,
            child: _buildContent(
              user,
              context,
              theme.textTheme,
              theme.colorScheme,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    User user,
    BuildContext context,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return Row(
      children: [
        CircleAvatar(backgroundImage: user.photo, radius: 24.0),
        const SizedBox(width: 18.0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildLabel(user, context, textTheme),
              const SizedBox(height: 4.0),
              _buildSubLabel(user, colorScheme)
            ],
          ),
        )
      ],
    );
  }

  Widget _buildLabel(User user, BuildContext context, TextTheme textTheme) {
    return Row(
      children: [
        Text('home_view.user_greet_prefix', style: textTheme.bodyLarge!).tr(),
        Text(
          user.name + 'home_view.user_greet_suffix'.tr(context: context),
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }

  Widget _buildSubLabel(User user, ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStreaks(colorScheme),
        _buildLevel(colorScheme),
        _buildPoints(colorScheme)
      ],
    );
  }

  Widget _buildStreaks(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Skeleton.shade(
          child: Icon(
            Icons.local_fire_department_outlined,
            color: colorScheme.tertiary,
          ),
        ),
        const Text('25')
      ],
    );
  }

  Widget _buildLevel(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: colorScheme.primary,
          width: 3.0,
          strokeAlign: 0.0,
          style: BorderStyle.solid,
        ),
      ),
      child: const Text('3', textAlign: TextAlign.center),
    );
  }

  Widget _buildPoints(ColorScheme colorScheme) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Skeleton.shade(child: Icon(Icons.bolt, color: darkColor)),
        Text('197'),
      ],
    );
  }
}
