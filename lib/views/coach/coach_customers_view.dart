import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/widgets/cards/customer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CouchCustomersView extends ConsumerWidget {
  const CouchCustomersView({super.key});

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
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      children: [
        CustomerCard(
          customer: AsyncValue.data(Customer.mock()),
          onTap: () => (),
        )
      ],
    );
    // return ListView.builder(
    //   padding: const EdgeInsets.symmetric(horizontal: 14.0),
    //   itemBuilder: (context, index) {
    //     final page = index ~/ pageSize;
    //     final pageIndex = index - page * pageSize;
    //     final customerValue =
    //         ref.watch(myCustomersProvider(page, pageSize)).map(
    //               data: (data) => AsyncValue.data(data.value[pageIndex]),
    //               error: (error) => AsyncValue<Customer>.error(
    //                 error,
    //                 error.stackTrace,
    //               ),
    //               loading: (loading) => const AsyncValue<Customer>.loading(),
    //             );

    //     return Padding(
    //       padding: const EdgeInsets.symmetric(vertical: 8.0),
    //       child: CustomerCard(customer: customerValue, onTap: () => ()),
    //     );
    //   },
    // );
  }
}
