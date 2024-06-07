import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/users.dart';
import 'package:fitness_app/widgets/mini_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomerCard extends ConsumerWidget {
  const CustomerCard({super.key, required this.customer, required this.onTap});

  final AsyncValue<Customer> customer;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customer = this.customer.valueOrNull ?? Customer.mock();
    final user = (this.customer.hasValue
            ? ref.watch(userByIdProvider(customer.userId)).valueOrNull
            : null) ??
        User.mock();

    return Skeletonizer(
      enabled: !this.customer.hasValue,
      child: Skeleton.leaf(child: _buildBody(customer, user, context)),
    );
  }

  Widget _buildBody(Customer customer, User user, BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Material(
      color: colorScheme.surfaceContainerHigh,
      borderRadius: BorderRadius.circular(16.0),
      elevation: 0.5,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: _buildContent(customer, user, textTheme),
        ),
      ),
    );
  }

  Widget _buildContent(Customer customer, User user, TextTheme textTheme) {
    return Row(
      children: [
        CircleAvatar(backgroundImage: user.photo, radius: 28.0),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(user.name, style: textTheme.titleMedium),
              const SizedBox(height: 4.0),
              _buildChipsRow(customer, user),
            ],
          ),
        ),
        const Icon(Icons.chevron_right),
      ],
    );
  }

  Widget _buildChipsRow(Customer customer, User user) {
    return Wrap(
      spacing: 4.0,
      runSpacing: 4.0,
      children: [
        if (user.sex != null)
          MiniChip(
            icon: Icon(user.sex!.icon),
            text: Text(user.sex!.translationKey).tr(),
          ),
        if (user.birthDate != null)
          MiniChip(
            icon: const Icon(Icons.cake),
            text:
                const Text('common.age_value').tr(args: [user.age.toString()]),
          ),
        if (customer.level != null)
          MiniChip(
            icon: const Icon(Icons.show_chart),
            text: Text(customer.level!.translationKey).tr(),
          ),
        if (customer.goal != null)
          MiniChip(
            icon: const Icon(Icons.flag),
            text: Text(customer.goal!.translationKey).tr(),
          ),
        if (customer.preference != null)
          MiniChip(
            icon: const Icon(Icons.fitness_center),
            text: Text(customer.preference!.translationKey).tr(),
          ),
      ],
    );
  }
}
