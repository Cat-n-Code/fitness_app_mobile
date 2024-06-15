import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/providers/exercise.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/cards/exercise_template_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ExercisesList extends ConsumerStatefulWidget {
  const ExercisesList({
    super.key,
    this.hasAddButton = false,
    this.hasSearchInput = false,
    this.onTap,
    this.onAddTap,
  });

  static const pageSize = 10;

  final bool hasAddButton;
  final bool hasSearchInput;
  final void Function(ExerciseTemplate)? onTap;
  final void Function()? onAddTap;

  @override
  ConsumerState<ExercisesList> createState() => _ExercisesListState();
}

class _ExercisesListState extends ConsumerState<ExercisesList> {
  final _textController = TextEditingController();
  String? _searchText;
  String? _muscleFilter;
  String? _equipmentFilter;
  ExerciseType? _typeFilter;
  ExerciseDifficulty? _difficultyFilter;
  bool _isFilterShowed = false;

  @override
  void initState() {
    super.initState();

    _textController.addListener(
      () => setState(() {
        final s = _textController.text.trim();
        _searchText = s.isNotEmpty ? s : null;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          ref.invalidate(myExerciseTemplatesProvider);
          await ref.read(
            myExerciseTemplatesProvider(
              0,
              ExercisesList.pageSize,
              _searchText,
              _muscleFilter,
              _equipmentFilter,
              _typeFilter,
              _difficultyFilter,
            ).future,
          );
        },
        child: CustomScrollView(
          slivers: [
            _buildAppBar(context),
            _buildBody(),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  SliverAppBar _buildAppBar(BuildContext context) {
    final theme = Theme.of(context);
    final padding = MediaQuery.viewPaddingOf(context);
    final textTheme = theme.textTheme;

    final double height;
    if (!widget.hasSearchInput) {
      height = 0.0;
    } else {
      height = _isFilterShowed ? 424.0 + padding.top : 104.0;
    }

    return SliverAppBar(
      snap: true,
      floating: true,
      pinned: false,
      automaticallyImplyLeading: false,
      expandedHeight: height,
      flexibleSpace: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, padding.top, 16.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  if (context.canPop()) const BackButton(),
                  if (widget.hasSearchInput)
                    Expanded(
                      child: TextField(
                        decoration: searchInputDecoration,
                        controller: _textController,
                      ),
                    ),
                  if (widget.hasAddButton)
                    Tooltip(
                      message: 'common.add_exercise_tooltip'.tr(
                        context: context,
                      ),
                      child: IconButton(
                        onPressed: widget.onAddTap,
                        icon: const Icon(Icons.add),
                      ),
                    )
                ],
              ),
              if (widget.hasSearchInput) ...[
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    FilledButton(
                      onPressed: () => setState(
                        () => _isFilterShowed = !_isFilterShowed,
                      ),
                      style: smallPrimaryButton,
                      child: Row(
                        children: [
                          const Text('common.filter_button').tr(),
                          const SizedBox(width: 4.0),
                          Icon(
                            _isFilterShowed
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
              if (_isFilterShowed) ...[
                const SizedBox(height: 16.0),
                Text(
                  'exercises_list.muscle_filter_label',
                  style: textTheme.labelMedium,
                ).tr(),
                TextField(
                  onChanged: (s) => setState(() {
                    s = s.trim();
                    _muscleFilter = s.isNotEmpty ? s : null;
                  }),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'exercises_list.equipment_filter_label',
                  style: textTheme.labelMedium,
                ).tr(),
                TextField(
                  onChanged: (s) => setState(() {
                    s = s.trim();
                    _equipmentFilter = s.isNotEmpty ? s : null;
                  }),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'exercises_list.type_filter_label',
                  style: textTheme.labelMedium,
                ).tr(),
                Wrap(
                  runSpacing: 8.0,
                  spacing: 8.0,
                  children: ExerciseType.values
                      .map(
                        (d) => ChoiceChip(
                          label: Text(d.translationKey).tr(),
                          selected: _typeFilter == d,
                          onSelected: (value) => setState(
                            () => _typeFilter = value ? d : null,
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'exercises_list.difficulty_filter_label',
                  style: textTheme.labelMedium,
                ).tr(),
                Wrap(
                  runSpacing: 8.0,
                  spacing: 8.0,
                  children: ExerciseDifficulty.values
                      .map(
                        (d) => ChoiceChip(
                          label: Text(d.translationKey).tr(),
                          selected: _difficultyFilter == d,
                          onSelected: (value) => setState(
                            () => _difficultyFilter = value ? d : null,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList.builder(
        itemBuilder: (context, index) {
          final page = index ~/ ExercisesList.pageSize;
          final pageIndex = index - page * ExercisesList.pageSize;
          final exercises = ref.watch(
            myExerciseTemplatesProvider(
              page,
              ExercisesList.pageSize,
              _searchText,
              _muscleFilter,
              _equipmentFilter,
              _typeFilter,
              _difficultyFilter,
            ),
          );
          final exercise = exercises.map(
            data: (data) => pageIndex < data.value.length
                ? AsyncData(data.value[pageIndex])
                : null,
            error: (error) =>
                AsyncError<ExerciseTemplate>(error.error, error.stackTrace),
            loading: (loading) => const AsyncLoading<ExerciseTemplate>(),
          );

          if (exercise == null) {
            return null;
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ExerciseTemplateCard(
              type: ExerciseCardType.fromId(exercise.value?.id ?? 0),
              exercise: exercise,
              onTap: () {
                if (widget.onTap != null) {
                  widget.onTap!(exercise.valueOrNull!);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
