import 'dart:convert';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/providers/users.dart';
import 'package:fitness_app/providers/workouts.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/utils/api.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fitness_app/utils/result.dart';
import 'package:fitness_app/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WorkoutEditView extends ConsumerStatefulWidget {
  const WorkoutEditView({super.key, this.workoutId, this.customerId});

  final int? workoutId;
  final int? customerId;

  @override
  ConsumerState<WorkoutEditView> createState() => _WorkoutEditViewState();
}

class _WorkoutEditViewState extends ConsumerState<WorkoutEditView> {
  bool _isLoading = true;
  bool _isEditable = true;
  var _workout = Workout.mock();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _startTimeController = TextEditingController();
  WorkoutType? _workoutType;
  DateTime? _startTime;
  Map<ExerciseStage, List<Exercise>> _exercisesByStage = {
    ExerciseStage.warmup: [
      Exercise.mock().copyWith(id: 1),
    ],
    ExerciseStage.main: [
      Exercise.mock().copyWith(id: 2),
      Exercise.mock().copyWith(id: 3),
      Exercise.mock().copyWith(id: 4),
    ],
    ExerciseStage.coolDown: [
      Exercise.mock().copyWith(id: 5),
      Exercise.mock().copyWith(id: 6),
    ],
  };
  final _removedExercisesIds = <int>[];

  @override
  void initState() {
    super.initState();

    if (widget.workoutId == null) {
      _workout = const Workout(name: '');
      _exercisesByStage = {
        ExerciseStage.warmup: [],
        ExerciseStage.main: [],
        ExerciseStage.coolDown: [],
      };
      _isLoading = false;
      _isEditable = true;
    } else {
      ref.read(workoutNotifierProvider(widget.workoutId!).future).then(
        (value) async {
          final locale = EasyLocalization.of(context)!.locale;
          final dateFormat = DateFormat.yMMMd(locale.toLanguageTag()).add_jm();
          final coach = await ref.read(currentCoachNotifierProvider.future);

          setState(() {
            _isLoading = false;
            _workout = value.toNullable() ?? Workout.mock();
            _isEditable = _workout.coachId == coach.toNullable()?.id;

            _nameController.text = _workout.name;
            _workoutType = _workout.type;
            _startTime = _workout.startTime;
            _startTimeController.text = _workout.startTime != null
                ? dateFormat.format(_workout.startTime!)
                : '';
            _exercisesByStage = _workout.sortedExercises;

            if (widget.customerId != null) {
              _workout = _workout.copyWith(
                id: null,
                customerId: widget.customerId,
              );
            }
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Skeletonizer(
        enabled: _isLoading,
        child: _buildBody(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        if (_workout.id != null)
          Tooltip(
            message: 'common.delete_tooltip'.tr(context: context),
            child: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: _isEditable ? _onDeleted : null,
            ),
          )
      ],
    );
  }

  Widget _buildBody() {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverList.list(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'workout_edit_view.name_label',
                      style: textTheme.labelLarge,
                    ).tr(),
                    const SizedBox(height: 8.0),
                    Skeleton.shade(
                      child: TextFormField(
                        controller: _nameController,
                        enabled: _isEditable,
                        onFieldSubmitted: (s) => _onSaved(),
                        validator: nonEmptyValidator,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'workout_edit_view.type_label',
                      style: textTheme.labelLarge,
                    ).tr(),
                    const SizedBox(height: 8.0),
                    _buildTypeChips(),
                    const SizedBox(height: 8.0),
                    Text(
                      'workout_edit_view.start_time_label',
                      style: textTheme.labelLarge,
                    ).tr(),
                    const SizedBox(height: 8.0),
                    _buildStartTimeField(),
                    const SizedBox(height: 32.0),
                    _buildExerciseLabel(textTheme),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: _buildExerciseList(colorScheme, textTheme),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverList.list(
            children: [
              const SizedBox(height: 32.0),
              FilledButton(
                onPressed:
                    _isEditable || widget.customerId != null ? _onSaved : null,
                child: const Text('common.save_button').tr(),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTypeChips() {
    return SizedBox(
      height: 36.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: WorkoutType.values
            .map(
              (t) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Skeleton.leaf(
                  child: ChoiceChip(
                    label: Text(t.translationKey).tr(),
                    selected: _workoutType == t,
                    onSelected: _isEditable
                        ? (b) => setState(
                              () => _workoutType = b ? t : null,
                            )
                        : null,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildStartTimeField() {
    final locale = EasyLocalization.of(context)!.locale;
    final dateFormat = DateFormat.yMMMd(locale.toLanguageTag()).add_jm();

    return Skeleton.shade(
      child: TextFormField(
        controller: _startTimeController,
        enabled: _isEditable,
        decoration: InputDecoration(
          hintText: dateFormat.format(DateTime.now()),
          suffixIcon: const Icon(Icons.calendar_month),
        ).applyDefaults(primaryInputDecoration),
        keyboardType: TextInputType.none,
        readOnly: true,
        validator: nonEmptyValidator,
        onTap: () async {
          final date = await showDatePicker(
            context: context,
            locale: locale,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 30)),
            initialDate: _startTime,
          );
          if (!mounted || date == null) {
            return;
          }
          final time = await showTimePicker(
            context: context,
            initialTime: _startTime != null
                ? TimeOfDay.fromDateTime(_startTime!)
                : TimeOfDay.now(),
          );
          if (time != null) {
            _startTime = date.copyWith(hour: time.hour, minute: time.minute);
            _startTimeController.text = dateFormat.format(_startTime!);
          }
        },
      ),
    );
  }

  Widget _buildExerciseLabel(TextTheme textTheme) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'workout_edit_view.details_title',
            style: textTheme.titleLarge,
          ).tr(),
        ),
        if (_isEditable)
          Tooltip(
            message: 'workout_edit_view.add_exercise_tooltip'.tr(),
            child: IconButton(
              onPressed: _onExerciseAdded,
              icon: const Icon(Icons.add),
            ),
          )
      ],
    );
  }

  Widget _buildExerciseList(ColorScheme colorScheme, TextTheme textTheme) {
    int getStageIndex(ExerciseStage stage) => switch (stage) {
          ExerciseStage.warmup => 0,
          ExerciseStage.main =>
            _exercisesByStage[ExerciseStage.warmup]!.length + 1,
          ExerciseStage.coolDown =>
            _exercisesByStage[ExerciseStage.warmup]!.length +
                _exercisesByStage[ExerciseStage.main]!.length +
                2,
        };
    ExerciseStage? getStageByIndex(int index) {
      if (index <= 0) {
        return null;
      }
      index -= 1;

      if (index <= _exercisesByStage[ExerciseStage.warmup]!.length) {
        return ExerciseStage.warmup;
      }
      index -= _exercisesByStage[ExerciseStage.warmup]!.length;

      if (index <= _exercisesByStage[ExerciseStage.main]!.length + 1) {
        return ExerciseStage.main;
      }

      return ExerciseStage.coolDown;
    }

    Widget buildExerciseCard(int index, Exercise exercise, double elevation) {
      return Skeleton.leaf(
        key: ValueKey(exercise),
        child: Card(
          color: colorScheme.surfaceContainerHigh,
          elevation: elevation,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    exercise.exercise!.name,
                    style: textTheme.bodyLarge,
                  ),
                ),
                if (_isEditable) ...[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkResponse(
                      onTap: () => _onExerciseEdited(
                        exercise,
                        index - getStageIndex(exercise.stage) - 1,
                      ),
                      radius: 18.0,
                      child: const Icon(Icons.edit),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkResponse(
                      onTap: () => _onExerciseRemoved(exercise),
                      radius: 18.0,
                      child: const Icon(Icons.delete),
                    ),
                  ),
                  ReorderableDragStartListener(
                    index: index,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkResponse(
                        onTap: () => (),
                        radius: 18.0,
                        child: const Icon(Icons.drag_handle),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    }

    final widgets = ExerciseStage.values
        .expand(
          (stage) => [
            Skeleton.leaf(
              key: ValueKey('stage_${stage.name}'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    stage.translationKey,
                    style: textTheme.titleMedium!.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ).tr(),
                  Divider(color: colorScheme.primary, thickness: 2.0),
                ],
              ),
            ),
            ..._exercisesByStage[stage]!.indexed.map(
                  (t) => buildExerciseCard(
                    getStageIndex(t.$2.stage) + t.$1 + 1,
                    t.$2,
                    0.0,
                  ),
                ),
          ],
        )
        .toList();

    return SliverReorderableList(
      onReorder: (oldIndex, newIndex) => setState(() {
        final oldStage = getStageByIndex(oldIndex)!;
        final newStage = getStageByIndex(newIndex);

        if (oldStage == newStage && oldIndex < newIndex) {
          newIndex -= 1;
        }

        if (newStage == null) {
          return;
        }

        final oldStageIndex = oldIndex - getStageIndex(oldStage) - 1;
        final newStageIndex = newIndex - getStageIndex(newStage) - 1;

        final exercise = _exercisesByStage[oldStage]!.removeAt(oldStageIndex);
        _exercisesByStage[newStage]!.insert(
          newStageIndex,
          exercise.copyWith(stage: newStage),
        );
      }),
      proxyDecorator: (child, index, animation) => AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final stage = getStageByIndex(index)!;
          final stageIndex = getStageIndex(stage);
          final curvedValue = Curves.easeIn.transform(animation.value);

          return Transform.scale(
            scale: lerpDouble(1.0, 1.05, curvedValue),
            child: buildExerciseCard(
              index,
              _exercisesByStage[stage]![index - stageIndex - 1],
              lerpDouble(0.0, 6.0, curvedValue)!,
            ),
          );
        },
      ),
      itemCount: widgets.length,
      itemBuilder: (context, index) => widgets[index],
    );
  }

  void _onExerciseAdded() async {
    final result = await context.push('/workout/exercises') as Exercise?;
    if (result == null) {
      return;
    }

    setState(() => _exercisesByStage[result.stage]!.insert(0, result));
  }

  void _onExerciseEdited(Exercise exercise, int index) async {
    final result = await context.push(
      '/workout/exercise/edit',
      extra: exercise,
    ) as Exercise?;

    if (result == null) {
      return;
    }

    setState(() {
      final list = _exercisesByStage[result.stage]!;
      list.removeAt(index);
      list.insert(index, result);
    });
  }

  void _onExerciseRemoved(Exercise exercise) async {
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title:
            const Text('workout_edit_view.remove_exercise_dialog_title').tr(),
        content: const Text('workout_edit_view.remove_exercise_dialog_body')
            .tr(args: [exercise.exercise!.name]),
        actions: [
          TextButton(
            onPressed: () => context.pop(true),
            child: const Text('common.dialog_yes').tr(),
          ),
          TextButton(
            onPressed: () => context.pop(false),
            child: const Text('common.dialog_no').tr(),
          ),
        ],
      ),
    ) as bool?;

    if (result == null || !result) {
      return;
    }

    if (exercise.id != null) {
      _removedExercisesIds.add(exercise.id!);
    }

    setState(() => _exercisesByStage[exercise.stage]!.remove(exercise));
  }

  void _onSaved() async {
    setState(() => _isLoading = true);

    final coach = await ref.read(currentCoachNotifierProvider.future);

    final body = jsonEncode(
      _workout.copyWith(
        name: _nameController.text,
        type: _workoutType,
        startTime: _startTime,
        coachId: (coach as Some<Coach>).value.id,
        exercises: [],
      ).toJson(),
    );
    final ApiResult<Response> result;
    if (_workout.id == null) {
      result = await apiFetch(
        HttpMethod.post,
        '/workouts',
        widgetRef: ref,
        body: body,
      );
    } else {
      result = await apiFetch(
        HttpMethod.put,
        '/workouts',
        widgetRef: ref,
        body: body,
      );
    }

    try {
      switch (result) {
        case Left(value: final response):
          final data = jsonDecode(utf8.decode(response.bodyBytes));
          _workout = Workout.fromJson(data);
          break;
        case Right(value: final exception):
          presentError(exception, widgetRef: ref);
          return;
      }

      for (var id in _removedExercisesIds) {
        final result = await apiFetch(
          HttpMethod.delete,
          '/workouts/exercises/$id',
          widgetRef: ref,
          minTime: Duration.zero,
        );
        switch (result) {
          case Left():
            break;
          case Right(value: final exception):
            presentError(exception, widgetRef: ref);
            break;
        }
      }
      _removedExercisesIds.clear();

      for (var (index, exercise)
          in _exercisesByStage.entries.expand((t) => t.value.indexed)) {
        final body = jsonEncode(
          exercise
              .copyWith(
                id: widget.customerId == null ? exercise.id : null,
                workoutId: _workout.id!,
                order: index,
              )
              .toJson(),
        );
        final ApiResult<Response> response;
        if (exercise.id == null || widget.customerId != null) {
          response = await apiFetch(
            HttpMethod.post,
            '/workouts/exercises',
            widgetRef: ref,
            body: body,
            minTime: Duration.zero,
          );
        } else {
          response = await apiFetch(
            HttpMethod.put,
            '/workouts/exercises/{exercise_workout_id}',
            widgetRef: ref,
            body: body,
            minTime: Duration.zero,
          );
        }

        switch (response) {
          case Left():
            break;
          case Right(value: final exception):
            presentError(exception, widgetRef: ref);
            break;
        }
      }

      final workout = await ref.read(
        workoutNotifierProvider(_workout.id!).future,
      );

      setState(() {
        _workout = (workout as Some<Workout>).value;
        _exercisesByStage = _workout.sortedExercises;
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _onDeleted() async {
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: const Text('workout_edit_view.delete_dialog_title').tr(),
        content: const Text('workout_edit_view.delete_dialog_body').tr(),
        actions: [
          TextButton(
            onPressed: () => context.pop(true),
            child: const Text('common.dialog_yes').tr(),
          ),
          FilledButton(
            onPressed: () => context.pop(false),
            child: const Text('common.dialog_no').tr(),
          ),
        ],
      ),
    ) as bool?;

    if (result == null || !result) {
      return;
    }

    final apiResult = await apiFetch(
      HttpMethod.delete,
      '/workouts/${_workout.id!}',
      widgetRef: ref,
    );

    switch (apiResult) {
      case Left():
        if (mounted) {
          context.pop();
        }
        break;
      case Right(value: final exception):
        presentError(exception, widgetRef: ref);
        break;
    }
  }
}
