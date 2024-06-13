import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/providers/workouts.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/utils/api.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fitness_app/utils/exceptions.dart';
import 'package:fitness_app/widgets/increment_counter.dart';
import 'package:fitness_app/widgets/mini_chip.dart';
import 'package:fitness_app/widgets/page_indicators.dart';
import 'package:fitness_app/widgets/rating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WorkoutExercisesView extends ConsumerStatefulWidget {
  const WorkoutExercisesView({super.key, required this.workoutId});

  final int workoutId;

  @override
  ConsumerState<WorkoutExercisesView> createState() =>
      _WorkoutExercisesViewState();
}

class _WorkoutExercisesViewState extends ConsumerState<WorkoutExercisesView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AsyncValue<Option<Workout>> _workoutValue;
  var _workout = Workout.mock();
  var _exerciseMap = <ExerciseStage, List<Exercise>>{};
  int _warmupExercisesCount = 0;
  int _mainExercisesCount = 0;
  bool _isUpdatingExercise = false;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 0, vsync: this);

    ref.listenManual(
      workoutNotifierProvider(widget.workoutId),
      (oldWorkout, workout) => setState(() {
        if (workout case AsyncData(value: final value)
            when value.isSome() && _workout.id != value.toNullable()!.id) {
          _tabController.dispose();
          _tabController = TabController(
            length: value.toNullable()!.exercises.length + 3,
            vsync: this,
          );
        }

        _workoutValue = workout;
        _workout = workout.valueOrNull?.toNullable() ?? Workout.mock();
        if (workout case AsyncData(value: final value) when value.isSome()) {
          _exerciseMap = (value as Some<Workout>).value.sortedExercises;
          _warmupExercisesCount = _exerciseMap[ExerciseStage.warmup]!.length;
          _mainExercisesCount = _exerciseMap[ExerciseStage.main]!.length;
        }
      }),
      fireImmediately: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: Skeletonizer(
        enabled: !_workoutValue.hasValue,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 43.0),
          child: Skeleton.replace(
            child: _buildBody(theme.textTheme, theme.colorScheme),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Skeletonizer(
        enabled: _isUpdatingExercise,
        child: IconButton(
          onPressed: () {
            if (_tabController.index == 0) {
              context.pop();
            } else {
              _tabController.animateTo(_tabController.index - 1);
            }
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }

  Widget _buildBody(TextTheme textTheme, ColorScheme colorScheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              for (var i = 0; i < _tabController.length; ++i)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: _buildTabFromIndex(i, textTheme, colorScheme),
                )
            ],
          ),
        ),
        const SizedBox(height: 32.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TabPageSelector(
              controller: _tabController,
              selectedColor: colorScheme.primary,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabFromIndex(
    int index,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    if (index == 0) {
      return _buildStageTab(ExerciseStage.warmup, textTheme);
    }
    index -= 1;

    if (index < _warmupExercisesCount) {
      return _buildExerciseTab(_exerciseMap[ExerciseStage.warmup]![index]);
    } else if (index == _warmupExercisesCount) {
      return _buildStageTab(ExerciseStage.main, textTheme);
    }
    index -= _warmupExercisesCount + 1;

    if (index < _mainExercisesCount) {
      return _buildExerciseTab(_exerciseMap[ExerciseStage.main]![index]);
    } else if (index == _mainExercisesCount) {
      return _buildStageTab(ExerciseStage.coolDown, textTheme);
    }
    index -= _mainExercisesCount + 1;

    return _buildExerciseTab(_exerciseMap[ExerciseStage.coolDown]![index]);
  }

  Widget _buildStageTab(ExerciseStage stage, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          stage.translationKey.tr(context: context).toUpperCase(),
          textAlign: TextAlign.center,
          style: textTheme.titleLarge,
        ),
        const SizedBox(height: 32.0),
        Expanded(
          child: ListView(
            children: _exerciseMap[stage]!
                .indexed
                .map(
                  (t) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: FilledButton(
                      onPressed: () => _tabController.animateTo(
                        _tabController.index + t.$1 + 1,
                      ),
                      style: onBackgroundButton,
                      child: Text(
                        t.$2.exercise!.name,
                        textAlign: TextAlign.center,
                        style: textTheme.bodyLarge,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            if (stage == ExerciseStage.coolDown) {
              _onFinished();
              return;
            }
            _tabController.animateTo(
              _tabController.index + _exerciseMap[stage]!.length + 1,
            );
          },
          style: darkOutlinedButton,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('common.skip_button').tr(),
              const SizedBox(width: 10.0),
              const Icon(Icons.arrow_forward),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        FilledButton(
          onPressed: () => _tabController.animateTo(_tabController.index + 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('common.start_button').tr(),
              const SizedBox(width: 10.0),
              const Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExerciseTab(Exercise exercise) {
    return _ExerciseTab(
      exercise: exercise,
      isLoading: _isUpdatingExercise,
      onSaved: _onExerciseSaved,
    );
  }

  void _onExerciseSaved(Exercise exercise) async {
    setState(() => _isUpdatingExercise = true);

    final body = jsonEncode(exercise.toJson());
    final result = await apiFetch(
      HttpMethod.put,
      '/workouts/exercises/{exercise_workout_id}',
      widgetRef: ref,
      body: body,
    );

    switch (result) {
      case Left():
        final _ = await ref.refresh(
          workoutNotifierProvider(widget.workoutId).future,
        );
        if (_tabController.index < _tabController.length - 1) {
          _tabController.animateTo(_tabController.index + 1);
        } else {
          _onFinished();
        }
        break;
      case Right(value: final exception):
        presentError(exception, widgetRef: ref);
        break;
    }

    setState(() => _isUpdatingExercise = false);
  }

  void _onFinished() async {
    final result = await showDialog(
      context: context,
      builder: (context) => RatingDialog(
        title: const Text('workout_exercises_view.rate_dialog_title').tr(),
        body: const Text('workout_exercises_view.rate_dialog_body').tr(),
        submitText: const Text('common.dialog_send').tr(),
        cancelText: const Text('workout_exercises_view.rate_dialog_later').tr(),
        onSubmitted: (rating) => context.pop(rating),
        onCanceled: () => context.pop(),
      ),
    ) as int?;

    if (result != null) {
      setState(() => _isUpdatingExercise = true);
      final body = jsonEncode({'score': result});
      final apiResult = await apiFetch(
        HttpMethod.post,
        '/customers/${_workout.coachId!}',
        widgetRef: ref,
        body: body,
      );

      switch (apiResult) {
        case Left():
          break;
        case Right(value: final exception):
          if (exception case ApiException()
              when exception.statusCode == HttpStatus.notFound) {
          } else {
            presentError(exception, widgetRef: ref);
          }
      }
    }

    if (mounted) {
      context.go('/customer');
    }
  }
}

class _ExerciseTab extends StatefulWidget {
  const _ExerciseTab({
    required this.exercise,
    required this.isLoading,
    required this.onSaved,
  });

  final Exercise exercise;
  final bool isLoading;
  final void Function(Exercise exercise) onSaved;

  @override
  State<StatefulWidget> createState() => _ExerciseTabState();
}

class _ExerciseTabState extends State<_ExerciseTab> {
  late Exercise _exercise;
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _exercise = widget.exercise;

    _pageController.addListener(
      () => setState(() {
        if (_pageController.page != null) {
          _currentPage = _pageController.page!.round();
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeader(textTheme),
        const SizedBox(height: 24.0),
        SizedBox(
          height: 220.0,
          child: PageView(
            controller: _pageController,
            children: [0, 1, 2]
                // TODO: real photo
                .map(
                  (u) => Image.network(
                    'https://placehold.co/600x400/png',
                    loadingBuilder: (context, child, loadingProgress) =>
                        Skeletonizer(
                      enabled: loadingProgress != null &&
                          loadingProgress.cumulativeBytesLoaded <
                              (loadingProgress.expectedTotalBytes ?? 0),
                      child: Skeleton.replace(child: child),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 4.0),
        PageIndicators(pagesCount: 3, page: _currentPage, color: darkColor),
        const SizedBox(height: 4.0),
        _buildSetsText(theme.colorScheme),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _exercise.setsCount != null
                ? [
                    const SizedBox(height: 16.0),
                    const Text(
                      'workout_exercises_view.completed_sets',
                      textAlign: TextAlign.center,
                    ).tr(),
                    IncrementCounter(
                      value: _exercise.setsDoneCount ?? 0,
                      min: 0,
                      max: _exercise.setsCount,
                      onChanged: (value) => setState(
                        () => _exercise =
                            _exercise.copyWith(setsDoneCount: value),
                      ),
                    ),
                  ]
                : [],
          ),
        ),
        _buildButtons(),
      ],
    );
  }

  Widget _buildHeader(TextTheme textTheme) {
    final e = _exercise.exercise!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                e.name,
                style: textTheme.titleLarge,
              ),
            ),
            Text(
              e.muscle ?? 'common.not_available'.tr(),
              style: textTheme.bodyLarge,
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildChip(
              Icons.star,
              (e.difficulty?.translationKey ?? 'common.not_available')
                  .tr(context: context),
            ),
            Text(
              e.additionalMuscle ?? 'common.not_available'.tr(),
              style: textTheme.bodyLarge,
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildChip(
              Icons.fitness_center,
              e.equipment ?? 'common.not_available'.tr(),
            ),
            Text(
              e.type?.translationKey ?? 'common.not_available'.tr(),
              style: textTheme.bodyLarge,
            ).tr(),
          ],
        ),
      ],
    );
  }

  Widget _buildSetsText(ColorScheme colorScheme) {
    final String text;

    if (_exercise.setsCount == null) {
      if (_exercise.repeatsCount != null) {
        text = 'workout_exercises_view.reps_value'
            .tr(args: [_exercise.repeatsCount!.toString()]);
      } else {
        text = '';
      }
    } else {
      if (_exercise.repeatsCount != null) {
        text = 'workout_exercises_view.sets_reps_count_value'.tr(args: [
          _exercise.setsCount!.toString(),
          _exercise.repeatsCount!.toString(),
        ]);
      } else {
        text = 'workout_exercises_view.sets_value'
            .tr(args: [_exercise.setsCount!.toString()]);
      }
    }

    return Text(
      text,
      style: TextStyle(color: colorScheme.primary, fontSize: 16.0),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildButtons() {
    return Skeletonizer(
      enabled: widget.isLoading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_exercise.setsDoneCount == null || _exercise.setsDoneCount! == 0)
            Skeleton.unite(
              borderRadius: BorderRadius.circular(20.0),
              child: OutlinedButton(
                onPressed: () => widget.onSaved(
                  _exercise.copyWith(setsDoneCount: 0),
                ),
                style: darkOutlinedButton,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('common.skip_button').tr(),
                    const SizedBox(width: 10.0),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 16.0),
          FilledButton(
            onPressed: () => widget.onSaved(_exercise),
            style: darkButton,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('common.continue_button').tr(),
                const SizedBox(width: 10.0),
                const Icon(Icons.arrow_forward),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(IconData icon, String text) {
    return MiniChip(
      icon: Icon(icon),
      text: Text(text),
      backgroundColor: darkColor,
      foregroundColor: Colors.white,
    );
  }
}
