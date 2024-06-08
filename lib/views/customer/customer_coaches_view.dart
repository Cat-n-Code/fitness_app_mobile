import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/providers/coach.dart';
import 'package:fitness_app/widgets/cards/coach_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomerCoachesView extends ConsumerWidget {
  const CustomerCoachesView({super.key});

  static const pageSize = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context, ref),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('customer_coaches_view.title').tr(),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      itemBuilder: (context, index) {
        final page = index ~/ pageSize;
        final pageIndex = index - page * pageSize;
        final coachValue = ref.watch(myCoachesProvider(page, pageSize)).map(
              data: (data) => pageIndex < data.value.length
                  ? AsyncValue.data(data.value[pageIndex])
                  : null,
              error: (error) => AsyncValue<Coach>.error(
                error,
                error.stackTrace,
              ),
              loading: (loading) => const AsyncValue<Coach>.loading(),
            );

        if (coachValue != null) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CoachCard(
              coach: coachValue,
              onTap: () => context.push(
                '/chat?userId=${coachValue.valueOrNull?.userId}',
              ),
            ),
          );
        } else {
          return null;
        }
      },
    );
  }
}
