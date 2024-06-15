import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/providers/exercise.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/utils/validators.dart';
import 'package:fitness_app/widgets/mini_chip.dart';
import 'package:fitness_app/widgets/page_indicators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExerciseView extends ConsumerStatefulWidget {
  const ExerciseView({
    super.key,
    this.exercise,
    this.exerciseTemplateId,
    required this.onSaved,
  });

  final Exercise? exercise;
  final int? exerciseTemplateId;
  final void Function(Exercise exercise) onSaved;

  @override
  ConsumerState<ExerciseView> createState() => _ExerciseViewState();
}

class _ExerciseViewState extends ConsumerState<ExerciseView> {
  final _pageController = PageController();
  int _currentPage = 0;

  final _formKey = GlobalKey<FormState>();
  final _setsController = TextEditingController();
  final _repsController = TextEditingController();

  bool _isLoading = true;
  var _exercise = Exercise.mock();

  @override
  void initState() {
    super.initState();

    _pageController.addListener(
      () => setState(() {
        if (_pageController.page != null) {
          _currentPage = _pageController.page!.round();
        }
      }),
    );

    if (widget.exercise == null) {
      ref
          .read(
            exerciseTemplateNotifierProvider(widget.exerciseTemplateId!).future,
          )
          .then(
            (value) => setState(() {
              final exercise = (value as Some<ExerciseTemplate>).value;
              _isLoading = false;
              _exercise = Exercise(
                exerciseId: exercise.id!,
                order: 0,
                stage: ExerciseStage.warmup,
                exercise: exercise,
              );
            }),
          );
    } else {
      _isLoading = false;
      _exercise = widget.exercise!;
      _setsController.text = _exercise.setsCount?.toString() ?? '';
      _repsController.text = _exercise.repeatsCount?.toString() ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Skeletonizer(
        enabled: _isLoading,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  _exercise.exercise!.name,
                  style: textTheme.titleLarge,
                ),
              ),
              SizedBox(
                width: 140.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _exercise.exercise!.muscle ?? 'common.not_available'.tr(),
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      _exercise.exercise!.additionalMuscle ??
                          'common.not_available'.tr(),
                      style: textTheme.bodyLarge,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16.0),
          _buildChips(),
          const SizedBox(height: 16.0),
          _buildPhotos(),
          const SizedBox(height: 16.0),
          Text('exercise_view.sets_label', style: textTheme.labelLarge).tr(),
          const SizedBox(height: 8.0),
          Skeleton.shade(
            child: TextFormField(
              controller: _setsController,
              keyboardType: TextInputType.number,
              validator: integerValidator(min: 1),
            ),
          ),
          const SizedBox(height: 16.0),
          Text('exercise_view.reps_label', style: textTheme.labelLarge).tr(),
          const SizedBox(height: 8.0),
          Skeleton.shade(
            child: TextFormField(
              controller: _repsController,
              keyboardType: TextInputType.number,
              validator: integerValidator(min: 1),
            ),
          ),
          const SizedBox(height: 32.0),
          FilledButton(
            onPressed: _onSaved,
            child: const Text('common.save_button').tr(),
          ),
        ],
      ),
    );
  }

  Widget _buildChips() {
    final template = _exercise.exercise!;

    return Wrap(
      runSpacing: 8.0,
      spacing: 8.0,
      alignment: WrapAlignment.spaceBetween,
      children: [
        if (template.difficulty != null)
          MiniChip(
            icon: const Icon(Icons.star),
            text: Text(
              template.difficulty!.translationKey,
            ).tr(),
            backgroundColor: darkColor,
            foregroundColor: Colors.white,
          ),
        if (template.equipment != null)
          MiniChip(
            icon: const Icon(Icons.fitness_center),
            text: Text(template.equipment!),
            backgroundColor: darkColor,
            foregroundColor: Colors.white,
          ),
        if (template.type != null)
          MiniChip(
            text: Text(template.type!.translationKey).tr(),
            backgroundColor: darkColor,
            foregroundColor: Colors.white,
          ),
      ],
    );
  }

  Widget _buildPhotos() {
    return Column(
      children: [
        SizedBox(
          height: 220.0,
          child: Skeleton.replace(
            replacement: const Bone(
              width: double.infinity,
              height: double.infinity,
            ),
            child: PageView(
              controller: _pageController,
              children: _exercise.exercise!.photos
                  .map(
                    (u) => Image.network(
                      u.url,
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
        ),
        const SizedBox(height: 4.0),
        PageIndicators(
          pagesCount: _exercise.exercise!.photos.length,
          page: _currentPage,
          color: darkColor,
        ),
      ],
    );
  }

  void _onSaved() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final setsCount = _setsController.text.trim();
    final repsCount = _repsController.text.trim();

    final exercise = _exercise.copyWith(
      setsCount: setsCount.isNotEmpty ? int.parse(setsCount) : null,
      repeatsCount: repsCount.isNotEmpty ? int.parse(repsCount) : null,
    );

    widget.onSaved(exercise);
  }
}
