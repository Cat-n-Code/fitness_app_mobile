import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/providers/exercise.dart';
import 'package:fitness_app/providers/users.dart';
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

class ExerciseTemplateView extends ConsumerStatefulWidget {
  const ExerciseTemplateView({super.key, this.exerciseId});

  final int? exerciseId;

  @override
  ConsumerState<ExerciseTemplateView> createState() => _ExerciseViewState();
}

class _ExerciseViewState extends ConsumerState<ExerciseTemplateView> {
  bool _isLoading = true;
  late ExerciseTemplate _exercise;
  bool _isEditable = false;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _equipmentController = TextEditingController();
  final _muscleController = TextEditingController();
  final _additionalMuscleController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _exercise = ExerciseTemplate.mock();

    if (widget.exerciseId == null) {
      _exercise = const ExerciseTemplate(name: '');
      _isLoading = false;
      _isEditable = true;
    } else {
      ref
          .read(exerciseTemplateNotifierProvider(widget.exerciseId!).future)
          .then(
        (value) async {
          final user = await ref.read(currentUserNotifierProvider.future);
          setState(() {
            _isLoading = false;
            _exercise = value.toNullable() ?? ExerciseTemplate.mock();
            _isEditable = _exercise.userId == user.toNullable()?.id;

            _nameController.text = _exercise.name;
            _equipmentController.text = _exercise.equipment ?? '';
            _muscleController.text = _exercise.muscle ?? '';
            _additionalMuscleController.text = _exercise.additionalMuscle ?? '';
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
        child: _buildBody(context),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        if (_exercise.id != null)
          Tooltip(
            message: 'common.delete_tooltip'.tr(context: context),
            child: IconButton(
              onPressed: _isEditable ? _onDeleted : null,
              icon: const Icon(Icons.delete_outline),
            ),
          ),
        Tooltip(
          message: 'exercise_template_view.attach_tooltip'.tr(context: context),
          child: IconButton(
            onPressed: _isEditable ? _onPhotoAttachClicked : null,
            icon: const Icon(Icons.attach_file),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'exercise_template_view.name_label',
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
              'exercise_template_view.difficulty_label',
              style: textTheme.labelLarge,
            ).tr(),
            const SizedBox(height: 8.0),
            _buildDifficultyChips(),
            const SizedBox(height: 8.0),
            Text(
              'exercise_template_view.equipment_label',
              style: textTheme.labelLarge,
            ).tr(),
            const SizedBox(height: 8.0),
            Skeleton.shade(
              child: TextFormField(
                controller: _equipmentController,
                enabled: _isEditable,
                onFieldSubmitted: (s) => _onSaved(),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'exercise_template_view.muscle_label',
              style: textTheme.labelLarge,
            ).tr(),
            const SizedBox(height: 8.0),
            Skeleton.shade(
              child: TextFormField(
                controller: _muscleController,
                enabled: _isEditable,
                onFieldSubmitted: (s) => _onSaved(),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'exercise_template_view.additional_muscle_label',
              style: textTheme.labelLarge,
            ).tr(),
            const SizedBox(height: 8.0),
            Skeleton.shade(
              child: TextFormField(
                controller: _additionalMuscleController,
                enabled: _isEditable,
                onFieldSubmitted: (s) => _onSaved(),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'exercise_template_view.type_label',
              style: textTheme.labelLarge,
            ).tr(),
            const SizedBox(height: 8.0),
            _buildTypeChips(),
            const SizedBox(height: 32.0),
            FilledButton(
              onPressed: _isEditable ? _onSaved : null,
              child: const Text('common.save_button').tr(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDifficultyChips() {
    return SizedBox(
      height: 36.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: ExerciseDifficulty.values
            .map(
              (d) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Skeleton.leaf(
                  child: ChoiceChip(
                    label: Text(d.translationKey).tr(),
                    selected: d == _exercise.difficulty,
                    labelStyle: d == _exercise.difficulty
                        ? TextStyle(color: colorScheme.onPrimary)
                        : null,
                    onSelected: _isEditable
                        ? (b) => setState(
                              () => _exercise =
                                  _exercise.copyWith(difficulty: b ? d : null),
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

  Widget _buildTypeChips() {
    return SizedBox(
      height: 36.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: ExerciseType.values
            .map(
              (d) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Skeleton.leaf(
                  child: ChoiceChip(
                    label: Text(d.translationKey).tr(),
                    selected: d == _exercise.type,
                    labelStyle: d == _exercise.type
                        ? TextStyle(color: colorScheme.onPrimary)
                        : null,
                    onSelected: _isEditable
                        ? (b) => setState(() =>
                            _exercise = _exercise.copyWith(type: b ? d : null))
                        : null,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  void _onPhotoAttachClicked() async {
    await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: false,
      withReadStream: true,
    );
  }

  void _onSaved() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    final nameText = _nameController.text.trim();
    final equipmentText = _equipmentController.text.trim();
    final muscleText = _muscleController.text.trim();
    final additionalMuscleText = _additionalMuscleController.text.trim();

    final exercise = ExerciseTemplate(
      id: _exercise.id,
      name: nameText,
      muscle: muscleText.isNotEmpty ? muscleText : null,
      additionalMuscle:
          additionalMuscleText.isNotEmpty ? additionalMuscleText : null,
      type: _exercise.type,
      equipment: equipmentText.isNotEmpty ? equipmentText : null,
      difficulty: _exercise.difficulty,
    );

    final body = jsonEncode(exercise.toJson());
    ApiResult<Response> result;
    if (_exercise.id == null) {
      result = await apiFetch(
        HttpMethod.post,
        '/exercises',
        widgetRef: ref,
        body: body,
      );
    } else {
      result = await apiFetch(
        HttpMethod.put,
        '/exercises',
        widgetRef: ref,
        body: body,
      );
    }

    switch (result) {
      case Left(value: final response):
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        _exercise = ExerciseTemplate.fromJson(data);
        break;
      case Right(value: final exception):
        presentError(exception, widgetRef: ref);
        break;
    }

    setState(() => _isLoading = false);
  }

  void _onDeleted() async {
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: const Text('exercise_template_view.delete_dialog_title').tr(),
        content: const Text('exercise_template_view.delete_dialog_body').tr(),
        actions: [
          TextButton(
            onPressed: () => context.pop(true),
            child: const Text('common.dialog_yes').tr(),
          ),
          FilledButton(
            onPressed: () => context.pop(false),
            child: const Text('common.dialog_no').tr(),
          )
        ],
      ),
    ) as bool?;

    if (result == null || !result) {
      return;
    }

    final apiResult = await apiFetch(
      HttpMethod.delete,
      '/exercises/${_exercise.id!}',
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
