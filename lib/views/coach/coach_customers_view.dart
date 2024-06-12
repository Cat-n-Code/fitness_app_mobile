import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/customer.dart';
import 'package:fitness_app/widgets/cards/customer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CoachCustomersView extends ConsumerWidget {
  const CoachCustomersView({super.key});

  static const pageSize = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(ref),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('coach_customers_view.title').tr(),
    );
  }

  Widget _buildBody(WidgetRef ref) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        ref.invalidate(myCustomersProvider);
        await ref.read(myCustomersProvider(0, pageSize).future);
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        itemBuilder: (context, index) {
          final page = index ~/ pageSize;
          final pageIndex = index - page * pageSize;
          final customerValue =
              ref.watch(myCustomersProvider(page, pageSize)).map(
                    data: (data) => pageIndex < data.value.length
                        ? AsyncValue.data(data.value[pageIndex])
                        : null,
                    error: (error) => AsyncValue<Customer>.error(
                      error,
                      error.stackTrace,
                    ),
                    loading: (loading) => const AsyncValue<Customer>.loading(),
                  );

          if (customerValue != null) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomerCard(
                customer: customerValue,
                onTap: () => context.push(
                  '/coach/customer/${customerValue.value?.id}',
                ),
              ),
            );
          } else {
            return null;
          }
        },
      ),
    );
  }
}
