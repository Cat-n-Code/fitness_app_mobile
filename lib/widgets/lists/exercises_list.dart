import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/providers/exercise.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/cards/exercise_template_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExercisesList extends ConsumerStatefulWidget {
  const ExercisesList({
    super.key,
    this.hasAddButton = false,
    this.padding,
    this.onTap,
    this.onAddTap,
  });

  static const pageSize = 10;

  final bool hasAddButton;
  final EdgeInsetsGeometry? padding;
  final void Function(ExerciseTemplate)? onTap;
  final void Function()? onAddTap;

  @override
  ConsumerState<ExercisesList> createState() => _ExercisesListState();
}

class _ExercisesListState extends ConsumerState<ExercisesList> {
  final _textController = TextEditingController();
  String? _searchText;

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
      appBar: _buildAppBar(),
      body: _buildBody(),
      resizeToAvoidBottomInset: false,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: TextField(
        decoration: searchInputDecoration,
        controller: _textController,
      ),
      actions: [
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
    );
  }

  Widget _buildBody() {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        ref.invalidate(myExercisesProvider);
        await ref.read(
          myExercisesProvider(0, ExercisesList.pageSize, _searchText).future,
        );
      },
      child: ListView.builder(
        padding: widget.padding,
        itemBuilder: (context, index) {
          final page = index ~/ ExercisesList.pageSize;
          final pageIndex = index - page * ExercisesList.pageSize;
          final exercises = ref.watch(
            myExercisesProvider(page, ExercisesList.pageSize, _searchText),
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
