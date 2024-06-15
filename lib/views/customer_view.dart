import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/providers/customer.dart';
import 'package:fitness_app/providers/workouts.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/cards/customer_card.dart';
import 'package:fitness_app/widgets/cards/customer_workout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomerView extends ConsumerWidget {
  const CustomerView({super.key, required this.customerId});

  static const pageSize = 10;

  final int customerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerValue = ref.watch(customerByIdProvider(customerId));

    return Scaffold(
      appBar: _buildAppBar(context, customerValue),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          ref.invalidate(userWorkoutsProvider);
          if (customerValue.hasValue) {
            await ref.read(userWorkoutsProvider(
              customerValue.valueOrNull!.id,
              0,
              pageSize,
            ).future);
          }
        },
        child: _buildBody(ref, customerValue),
      ),
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

  Widget _buildBody(WidgetRef ref, AsyncValue<Customer> customerValue) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: CustomerCard(customer: customerValue),
            );
          case 1:
            return Skeletonizer(
              enabled: !customerValue.hasValue,
              child: Padding(
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
                        onPressed: () => context.push(
                          '/customer/${customerValue.valueOrNull!.id}/workouts',
                        ),
                        style: iconPrimaryButton,
                        label: const Icon(Icons.add),
                      ),
                    )
                  ],
                ),
              ),
            );
          case _:
            return _buildWorkoutCard(index - 2, ref, customerValue);
        }
      },
    );
  }

  Widget? _buildWorkoutCard(
    int index,
    WidgetRef ref,
    AsyncValue<Customer> customer,
  ) {
    if (!customer.hasValue) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: CustomerWorkoutCard(workout: AsyncValue.loading()),
      );
    }

    final page = index ~/ pageSize;
    final pageIndex = index - page * pageSize;
    final workouts = ref.watch(
      userWorkoutsProvider(customer.valueOrNull!.userId, page, pageSize),
    );
    final workout = workouts.map(
      data: (data) => pageIndex < data.value.length
          ? AsyncData(data.value[pageIndex])
          : null,
      error: (error) => AsyncError<Workout>(error.error, error.stackTrace),
      loading: (loading) => const AsyncLoading<Workout>(),
    );

    if (workout == null) {
      return null;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: CustomerWorkoutCard(workout: workout),
    );
  }
}
