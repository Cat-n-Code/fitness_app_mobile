import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/progress_entry.dart';
import 'package:fitness_app/models/radio_tile_style.dart';
import 'package:fitness_app/providers/progress.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/date_diagram.dart';
import 'package:fitness_app/widgets/date_range_dropdown.dart';
import 'package:fitness_app/widgets/mini_calendar.dart';
import 'package:fitness_app/widgets/radio_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum _ProgressViewTab { steps, water }

class CustomerProgressView extends ConsumerStatefulWidget {
  const CustomerProgressView({super.key});

  @override
  ConsumerState<CustomerProgressView> createState() =>
      _CustomerProgressViewState();
}

class _CustomerProgressViewState extends ConsumerState<CustomerProgressView>
    with SingleTickerProviderStateMixin {
  var _activeTab = _ProgressViewTab.steps;
  var _activeRange = DateRange.thisWeek;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final progressValue = ref.watch(
      myProgressProvider(_activeRange.startTime, _activeRange.endTime),
    );

    return TweenAnimationBuilder(
      tween: ColorTween(
        end: switch (_activeTab) {
          _ProgressViewTab.steps => colorScheme.primary,
          _ProgressViewTab.water => colorScheme.secondary,
        },
      ),
      duration: Durations.short2,
      builder: (context, value, child) => Scaffold(
        appBar: _buildAppBar(value!, context),
        body: _buildBody(progressValue, context, value),
      ),
    );
  }

  AppBar _buildAppBar(Color color, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      title: Text(
        'customer_progress_view.title',
        style: textTheme.titleLarge
            ?.copyWith(color: color, fontWeight: FontWeight.w700),
      ).tr(),
    );
  }

  Widget _buildBody(
    AsyncValue<List<ProgressEntry>> progressValue,
    BuildContext context,
    Color value,
  ) {
    final theme = Theme.of(context);

    return RefreshIndicator.adaptive(
      onRefresh: () async {
        ref.invalidate(myProgressProvider);
        await ref.read(myProgressProvider(
          _activeRange.startTime,
          _activeRange.endTime,
        ).future);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Skeletonizer(
          enabled: !progressValue.hasValue,
          child: _buildContent(
            progressValue.valueOrNull ?? [],
            value,
            theme.textTheme,
            theme.colorScheme,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    List<ProgressEntry> progress,
    Color color,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    final radioTileStyle = primaryFilledRadioStyle.copyWith(
      selectedColor: color,
      textStyle: primaryFilledRadioStyle.textStyle.copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
      ),
      selectedTextStyle: primaryFilledRadioStyle.selectedTextStyle.copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
      ),
    ) as RadioTileStyle;

    return Column(
      children: [
        _buildStreakCard(colorScheme),
        const SizedBox(height: 16.0),
        MiniCalendar(onWeekdaySelected: (w) => (), color: color),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 80.0,
          child: Row(
            children: [
              Expanded(
                child: _buildStepsTile(radioTileStyle, color),
              ),
              const SizedBox(width: 32.0),
              Expanded(
                child: _buildHydrationTile(radioTileStyle, color),
              )
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        _buildHeader(context, textTheme),
        const SizedBox(height: 16.0),
        DateDiagram(
          color: color,
          values: progress
              .map((e) => (
                    e.timestamp,
                    _activeTab == _ProgressViewTab.steps
                        ? e.steps.toDouble()
                        : e.waterVolume,
                  ))
              .toList(),
        )
      ],
    );
  }

  Widget _buildStreakCard(ColorScheme colorScheme) {
    return SizedBox(
      width: double.infinity,
      height: 136.0,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 4.0, color: colorScheme.surfaceDim),
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Skeleton.unite(
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: colorScheme.tertiary,
                        ),
                        Expanded(
                          child: Text(
                            'customer_progress_view.streak_label',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
                              color: colorScheme.tertiary,
                            ),
                          ).tr(args: ['25']),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  const Text('customer_progress_view.streak_motivation')
                      .tr(args: ['100'])
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            _buildProgressIndicator(colorScheme)
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(ColorScheme colorScheme) {
    const startColor = Color.fromARGB(255, 128, 90, 255);
    const endColor = Color.fromARGB(255, 219, 117, 255);

    return SizedBox(
      width: 100.0,
      height: 100.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) =>
                  const LinearGradient(colors: [startColor, endColor])
                      .createShader(bounds),
              child: Text(
                '25%',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
          CircularProgressIndicator(
            value: 1.0,
            color: colorScheme.surfaceDim,
            strokeWidth: 8.0,
            strokeAlign: -1.0,
          ),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => const SweepGradient(
              startAngle: 0.0,
              endAngle: 2.0 * pi * 0.4,
              colors: [startColor, endColor],
              tileMode: TileMode.decal,
              transform: GradientRotation(-0.6 * pi),
            ).createShader(bounds),
            child: CircularProgressIndicator(
              value: 0.3,
              color: colorScheme.primary,
              strokeCap: StrokeCap.round,
              strokeWidth: 8.0,
              strokeAlign: -1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MarkdownBody(
          data: switch (_activeTab) {
            _ProgressViewTab.steps =>
              'customer_progress_view.steps_average_value'.tr(
                context: context,
                args: ['5,342'],
              ),
            _ProgressViewTab.water =>
              'customer_progress_view.water_average_value'
                  .tr(context: context, args: ['1,700'])
          },
          styleSheet: MarkdownStyleSheet(
            p: textTheme.bodyLarge?.copyWith(fontSize: 17.0),
          ),
        ),
        DateRangeDropdown(
          currentRange: _activeRange,
          onChanged: (r) => setState(() => _activeRange = r!),
        ),
      ],
    );
  }

  Widget _buildStepsTile(
    RadioTileStyle style,
    Color color,
  ) {
    return RadioTile(
      value: _ProgressViewTab.steps,
      groupValue: _activeTab,
      onChanged: (tab) => setState(() => _activeTab = tab!),
      addRadio: false,
      style: style,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('customer_progress_view.steps_tab_label'.tr()),
                  const SizedBox(height: 4.0),
                  Text('6,035'),
                ],
              ),
            ),
            const Icon(Icons.directions_walk, size: 40.0),
          ],
        ),
      ),
    );
  }

  Widget _buildHydrationTile(
    RadioTileStyle style,
    Color color,
  ) {
    return RadioTile(
      value: _ProgressViewTab.water,
      groupValue: _activeTab,
      onChanged: (tab) => setState(() => _activeTab = tab!),
      addRadio: false,
      style: style,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('customer_progress_view.water_tab_label'.tr()),
                  const SizedBox(height: 4.0),
                  Text('common.water_value'.tr(args: ['500'])),
                ],
              ),
            ),
            const Icon(Icons.water_drop_outlined, size: 40.0),
          ],
        ),
      ),
    );
  }
}

class _StepsView extends StatelessWidget {
  const _StepsView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildHeader(theme.textTheme),
          const SizedBox(height: 8.0),
          _VerticalDiagram(color: theme.colorScheme.primary),
        ],
      ),
    );
  }

  Widget _buildHeader(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('shared.average'.tr(), style: textTheme.titleMedium),
            Text(
              'shared.x_steps'.tr(args: ['5,342']),
              style: textTheme.bodyMedium!.copyWith(fontSize: 18.0),
            )
          ],
        ),
        // DateRangeField(selectedPeriodIndex: 0, onPeriodChanged: (i) => ()),
      ],
    );
  }
}

class _HydrationView extends StatelessWidget {
  const _HydrationView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildHeader(theme.textTheme),
          const SizedBox(height: 8.0),
          _VerticalDiagram(color: theme.colorScheme.secondary),
        ],
      ),
    );
  }

  Widget _buildHeader(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('shared.average'.tr(), style: textTheme.titleMedium),
            Text(
              'shared.water_ml'.tr(args: ['1,700']),
              style: textTheme.bodyMedium!.copyWith(fontSize: 18.0),
            )
          ],
        ),
        // DateRangeField(selectedPeriodIndex: 0, onPeriodChanged: (i) => ()),
      ],
    );
  }
}

class _VerticalDiagram extends StatelessWidget {
  const _VerticalDiagram({required this.color});

  static final progressValues = [0.6, 0.5, 0.7, 0.8, 0.55, 0.2, 0.3];
  final Color color;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 200.0,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: colorScheme.onBackground.withAlpha(50),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = -6; i <= 0; ++i)
              _buildColumn(
                DateFormat.E().format(
                  DateTime.now().add(Duration(days: i)),
                ),
                progressValues[i + 6],
              )
          ],
        ),
      ),
    );
  }

  Widget _buildColumn(String label, double progress) {
    return SizedBox(
      height: double.infinity,
      child: FractionallySizedBox(
        heightFactor: progress,
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 10.0,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
            Text(label)
          ],
        ),
      ),
    );
  }
}
