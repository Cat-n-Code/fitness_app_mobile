import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/cards/user_card.dart';
import 'package:fitness_app/widgets/customer_goals.dart';
import 'package:fitness_app/widgets/mini_calendar.dart';
import 'package:fitness_app/widgets/workouts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomerHomeView extends ConsumerWidget {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final padding = MediaQuery.viewPaddingOf(context);

    return Scaffold(
      // appBar: _buildAppBar(),
      body: WorkoutsList(
        padding: EdgeInsets.fromLTRB(24.0, padding.top + 16.0, 24.0, 0.0),
        header: _buildHeader(),
        onTap: (workout) => context.push('/workout/${workout.id!}'),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UserCard(),
        const SizedBox(height: 8.0),
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
