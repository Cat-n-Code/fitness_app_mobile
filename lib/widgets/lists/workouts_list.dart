import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/providers/workouts.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/cards/workout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutsList extends ConsumerStatefulWidget {
  const WorkoutsList({
    super.key,
    this.header,
    this.hasAddButton = false,
    this.hasSearchInput = false,
    this.onTap,
    this.onAddTap,
  });

  static const pageSize = 10;

  final Widget? header;
  final bool hasAddButton;
  final bool hasSearchInput;
  final void Function(Workout)? onTap;
  final void Function()? onAddTap;

  @override
  ConsumerState<WorkoutsList> createState() => _WorkoutsListState();
}

class _WorkoutsListState extends ConsumerState<WorkoutsList> {
  final _nameController = TextEditingController();
  String? _nameFilter;

  @override
  void initState() {
    super.initState();

    _nameController.addListener(
      () => setState(() {
        final s = _nameController.text.trim();
        _nameFilter = s.isNotEmpty ? s : null;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          widget.hasAddButton || widget.hasSearchInput ? _buildAppBar() : null,
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: widget.hasSearchInput
          ? TextField(
              controller: _nameController,
              decoration: searchInputDecoration,
            )
          : null,
      actions: [
        if (widget.hasAddButton)
          Tooltip(
            message: 'common.add_workout_tooltip'.tr(),
            child: IconButton(
              onPressed: widget.onAddTap,
              icon: const Icon(Icons.add),
            ),
          )
      ],
    );
  }

  Widget _buildBody() {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        ref.invalidate(myWorkoutsProvider);
        await ref.read(
          myWorkoutsProvider(0, WorkoutsList.pageSize, _nameFilter).future,
        );
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemBuilder: (context, index) {
          if (widget.header != null) {
            if (index == 0) {
              return widget.header;
            } else {
              index--;
            }
          }

          final page = index ~/ WorkoutsList.pageSize;
          final pageIndex = index - page * WorkoutsList.pageSize;
          final workouts = ref.watch(myWorkoutsProvider(
            page,
            WorkoutsList.pageSize,
            _nameFilter,
          ));
          final workout = workouts.map(
            data: (data) => pageIndex < data.value.length
                ? AsyncData(data.value[pageIndex])
                : null,
            error: (error) => AsyncError<Workout>(
              error.error,
              error.stackTrace,
            ),
            loading: (loading) => const AsyncLoading<Workout>(),
          );

          if (workout == null) {
            return null;
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: WorkoutCard(
              type: WorkoutCardType.fromId(workout.valueOrNull?.id ?? 0),
              workout: workout,
              onTap: () {
                if (widget.onTap != null) {
                  widget.onTap!(workout.valueOrNull!);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
