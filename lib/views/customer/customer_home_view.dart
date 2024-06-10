import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/providers/workouts.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/cards/workout_card.dart';
import 'package:fitness_app/widgets/customer_goals.dart';
import 'package:fitness_app/widgets/mini_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomerHomeView extends ConsumerWidget {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final padding = MediaQuery.viewPaddingOf(context);
    final workouts = ref.watch(customerWorkoutsNotifierProvider);

    return Scaffold(
      // appBar: _buildAppBar(),
      body: RefreshIndicator.adaptive(
        onRefresh: () async => await ref
            .read(customerWorkoutsNotifierProvider.notifier)
            .updateWorkouts(),
        child: ListView.builder(
          padding: EdgeInsets.fromLTRB(24.0, padding.top + 16.0, 24.0, 0.0),
          itemBuilder: (context, index) => switch (index) {
            0 => _buildTasksCalendar(),
            1 => Text(
                'customer_home_view.workouts_title',
                style: primaryTitleTextStyle,
              ).tr(),
            _ => !workouts.hasValue || index - 2 < workouts.value!.length
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: WorkoutCard(
                      workout: workouts.map(
                        data: (data) => AsyncValue.data(data.value[index - 2]),
                        error: (error) => AsyncValue.error(
                          error,
                          error.stackTrace,
                        ),
                        loading: (loading) => const AsyncValue.loading(),
                      ),
                      onTap: () => context.push(
                        '/customer/workout/${workouts.value![index - 2].id}',
                      ),
                    ),
                  )
                : null,
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar();
  }

  Widget _buildTasksCalendar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'customer_home_view.schedule_title',
          style: primaryTitleTextStyle,
        ).tr(),
        const SizedBox(height: 4.0),
        MiniCalendar(onWeekdaySelected: (w) => ()),
        const SizedBox(height: 16.0),
        const CustomerGoals(),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
