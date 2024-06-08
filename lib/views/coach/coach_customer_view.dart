import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/providers/customer.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/cards/customer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoachCustomerView extends ConsumerWidget {
  const CoachCustomerView({super.key, required this.customerId});

  final int customerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context, ref),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        Tooltip(
          message: 'common.chat_tooltip'.tr(context: context),
          child: IconButton(onPressed: () => (), icon: const Icon(Icons.forum)),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return CustomerCard(
              customer: ref.watch(customerByIdProvider(customerId)),
            );
          case 1:
            return Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'coach_customer_view.workouts_title',
                    style: primaryTitleTextStyle,
                  ).tr(),
                  FilledButton.icon(
                    onPressed: () => (),
                    style: iconPrimaryButton,
                    label: const Icon(Icons.add),
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
