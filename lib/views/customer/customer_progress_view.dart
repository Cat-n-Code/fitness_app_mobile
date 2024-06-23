import 'dart:async';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/radio_tile_style.dart';
import 'package:fitness_app/providers/progress.dart';
import 'package:fitness_app/providers/scaffold_messenger.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fitness_app/utils/extensions.dart';
import 'package:fitness_app/widgets/date_diagram.dart';
import 'package:fitness_app/widgets/date_range_dropdown.dart';
import 'package:fitness_app/widgets/increment_counter.dart';
import 'package:fitness_app/widgets/mini_calendar.dart';
import 'package:fitness_app/widgets/radio_tile.dart';
import 'package:fitness_app/widgets/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pedometer/pedometer.dart';
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
  late StreamSubscription<StepCount> _stepCountSubscription;

  static const waterVolumePerCup = 250;

  var _activeTab = _ProgressViewTab.steps;
  var _activeRange = DateRange.thisWeek;
  bool _isWaterUpdating = false;

  @override
  void initState() {
    super.initState();

    _stepCountSubscription = Pedometer.stepCountStream.listen(
      (steps) async {
        final notifier = ref.read(todayStepsProgressProvider.notifier);
        final result = await notifier.updateSteps(steps.steps);
        if (result case Right(value: final exception)) {
          presentError(exception, widgetRef: ref);
        }
      },
      onError: (error) {
        if (error case Exception()) {
          if (error case PlatformException()) {
            final snackBar = buildErrorSnackBar(
              'errors.pedometer_not_available'.tr(),
            );

            ref.read(scaffoldMessengerProvider)?.showSnackBar(snackBar);
          } else {
            presentError(error, widgetRef: ref);
          }
        } else {
          throw error;
        }
      },
    );
  }

  @override
  void dispose() {
    _stepCountSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final stepsEntries = ref
        .watch(
          stepsProgressProvider(
            _activeRange.startTime,
            _activeRange.endTime,
          ),
        )
        .map(
          data: (data) => AsyncData(
            data.value.map((s) => s.asTuple()).toList(),
          ),
          error: (error) => AsyncError<List<DateDiagramEntry>>(
            error.error,
            error.stackTrace,
          ),
          loading: (loading) => const AsyncLoading<List<DateDiagramEntry>>(),
        );
    final waterEntries = ref
        .watch(
          waterProgressProvider(_activeRange.startTime, _activeRange.endTime),
        )
        .map(
          data: (data) => AsyncData(
            data.value.map((s) => s.asTuple()).toList(),
          ),
          error: (error) => AsyncError<List<DateDiagramEntry>>(
            error.error,
            error.stackTrace,
          ),
          loading: (loading) => const AsyncLoading<List<DateDiagramEntry>>(),
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
        body: _buildBody(
          switch (_activeTab) {
            _ProgressViewTab.steps => stepsEntries,
            _ProgressViewTab.water => waterEntries,
          },
          context,
          value,
        ),
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
    AsyncValue<List<DateDiagramEntry>> progressValue,
    BuildContext context,
    Color value,
  ) {
    final theme = Theme.of(context);

    return RefreshIndicator.adaptive(
      onRefresh: () async {
        ref.invalidate(stepsProgressProvider);
        ref.invalidate(waterProgressProvider);
        await Future.wait([
          ref.read(stepsProgressProvider(
            _activeRange.startTime,
            _activeRange.endTime,
          ).future),
          ref.read(waterProgressProvider(
            _activeRange.startTime,
            _activeRange.endTime,
          ).future)
        ]);
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
    List<DateDiagramEntry> progress,
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
          height: 90.0,
          child: Row(
            children: [
              Expanded(
                child: _buildStepsTile(radioTileStyle, color),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: _buildHydrationTile(radioTileStyle, color),
              )
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        _buildHeader(progress, context, textTheme),
        const SizedBox(height: 16.0),
        DateDiagram(color: color, values: progress),
        if (_activeTab == _ProgressViewTab.water) ...[
          const SizedBox(height: 16.0),
          const Text('customer_progress_view.hydration_picker_label').tr(),
          _buildHydrationPicker(colorScheme),
        ],
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
                  const SizedBox(height: 8.0),
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
      width: 80.0,
      height: 80.0,
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
                  fontSize: 24.0,
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

  Widget _buildHeader(
    List<DateDiagramEntry> progress,
    BuildContext context,
    TextTheme textTheme,
  ) {
    final averageValue =
        progress.map((t) => t.$2).average()?.toStringAsFixed(0) ?? '0.0';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MarkdownBody(
          data: switch (_activeTab) {
            _ProgressViewTab.steps =>
              'customer_progress_view.steps_average_value'.tr(
                context: context,
                args: [averageValue],
              ),
            _ProgressViewTab.water =>
              'customer_progress_view.water_average_value'
                  .tr(context: context, args: [averageValue])
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
    final stepsValue = ref.watch(todayStepsProgressProvider);

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
                  Text(stepsValue.valueOrNull?.steps.toString() ?? '1000'),
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
    final waterValue = ref.watch(todayWaterProgressProvider);

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
                  Text(
                    'common.water_value'.tr(args: [
                      waterValue.valueOrNull?.waterVolume.toString() ?? '1000'
                    ]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Icon(Icons.water_drop_outlined, size: 40.0),
          ],
        ),
      ),
    );
  }

  Widget _buildHydrationPicker(ColorScheme colorScheme) {
    final waterValue = ref.watch(todayWaterProgressProvider);

    return Skeletonizer(
      enabled: _isWaterUpdating,
      child: IncrementCounter(
        min: 0,
        value: (waterValue.valueOrNull?.waterVolume ?? 0) ~/ waterVolumePerCup,
        onChanged: (value) async {
          setState(() => _isWaterUpdating = true);

          final result = await ref
              .read(todayWaterProgressProvider.notifier)
              .updateWater(value * waterVolumePerCup);
          if (result case Right(value: final exception)) {
            presentError(exception, widgetRef: ref);
          }

          setState(() => _isWaterUpdating = false);
        },
        color: colorScheme.secondary,
      ),
    );
  }
}
