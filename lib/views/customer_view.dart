import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/customer.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/cards/customer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomerView extends ConsumerWidget {
  const CustomerView({super.key, required this.customerId});

  final int customerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerValue = ref.watch(customerByIdProvider(customerId));

    return Scaffold(
      appBar: _buildAppBar(context, customerValue),
      body: _buildBody(context, customerValue),
    );
  }

  AppBar _buildAppBar(
    BuildContext context,
    AsyncValue<Customer> customerValue,
  ) {
    return AppBar(
      actions: [
        Tooltip(
          message: 'common.chat_tooltip'.tr(context: context),
          child: IconButton(
            onPressed: () {
              if (customerValue.hasValue) {
                context.push(
                  '/chat?userId=${customerValue.value!.userId}',
                );
              }
            },
            icon: const Icon(Icons.forum),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, AsyncValue<Customer> customerValue) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return CustomerCard(customer: customerValue);
          case 1:
            return Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'customer_view.workouts_title',
                    style: primaryTitleTextStyle,
                  ).tr(),
                  Tooltip(
                    message: 'customer_view.schedule_workout_tooltip'.tr(
                      context: context,
                    ),
                    child: FilledButton.icon(
                      onPressed: () => (),
                      style: iconPrimaryButton,
                      label: const Icon(Icons.add),
                    ),
                  )
                ],
              ),
            );
          case _:
            return null;
        }
      },
    );
  }
}
