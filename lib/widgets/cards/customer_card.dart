import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/users.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/mini_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomerCard extends ConsumerWidget {
  const CustomerCard({super.key, required this.customer, this.onTap});

  final AsyncValue<Customer> customer;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customer = this.customer.valueOrNull ?? Customer.mock();
    final userValue = this.customer.hasValue
        ? ref.watch(userByIdProvider(customer.userId))
        : null;
    final user = userValue?.valueOrNull ?? User.mock();

    return Skeletonizer(
      enabled:
          !this.customer.hasValue || (userValue != null && !userValue.hasValue),
      child: Skeleton.leaf(
        enabled: onTap != null,
        child: _buildBody(customer, user, context),
      ),
    );
  }

  Widget _buildBody(Customer customer, User user, BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Material(
      color: colorScheme.surface,
      borderRadius: onTap != null ? BorderRadius.circular(16.0) : null,
      elevation: onTap != null ? 4.0 : 0.0,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: onTap != null
              ? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0)
              : const EdgeInsets.all(0.0),
          child: _buildContent(customer, user, textTheme, colorScheme),
        ),
      ),
    );
  }

  Widget _buildContent(
    Customer customer,
    User user,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(backgroundImage: user.photo, radius: 44.0),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'customer_card.user_name_value',
                    style: textTheme.titleLarge,
                  ).tr(args: [user.name, user.age.toString()]),
                  const SizedBox(height: 8.0),
                  _buildChipsRow(customer, user),
                ],
              ),
            ),
            if (onTap != null) const Icon(Icons.chevron_right),
          ],
        ),
        const SizedBox(height: 8.0),
        _buildProgressBar(colorScheme),
      ],
    );
  }

  Widget _buildChipsRow(Customer customer, User user) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        if (customer.level != null)
          MiniChip(
            icon: const Icon(Icons.star),
            text: Text(customer.level!.translationKey).tr(),
          ),
        if (customer.preference != null)
          MiniChip(
            text: Text(customer.preference!.translationKey).tr(),
          ),
        if (customer.goal != null)
          MiniChip(
            icon: const Icon(Icons.flag),
            text: Text(customer.goal!.translationKey).tr(),
          ),
      ],
    );
  }

  Widget _buildProgressBar(ColorScheme colorScheme) {
    return Skeleton.leaf(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'customer_card.progress_label',
            style: TextStyle(color: darkColor),
          ).tr(),
          const SizedBox(height: 8.0),
          LinearProgressIndicator(value: 0.4, color: colorScheme.tertiary),
        ],
      ),
    );
  }
}
