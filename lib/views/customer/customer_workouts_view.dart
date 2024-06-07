import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/providers/workouts.dart';
import 'package:fitness_app/widgets/cards/workout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomerWorkoutsView extends ConsumerWidget {
  const CustomerWorkoutsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workouts = ref.watch(customerWorkoutsNotifierProvider);

    return Scaffold(
      appBar: _buildAppBar(),
      body: RefreshIndicator.adaptive(
        onRefresh: () async => await ref
            .read(customerWorkoutsNotifierProvider.notifier)
            .updateWorkouts(),
        child: ListView.builder(
          itemCount: workouts.hasValue ? workouts.value!.length : 10,
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: WorkoutCard(
              workout: workouts.map(
                data: (data) => AsyncValue.data(data.value[index]),
                error: (error) => AsyncValue.error(error, error.stackTrace),
                loading: (loading) => const AsyncValue.loading(),
              ),
              onTap: () => context.push(
                '/customer/workout/${workouts.value![index].id}',
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('customer_workouts_view.title').tr(),
    );
  }
}
