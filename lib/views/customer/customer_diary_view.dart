import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/models/diary.dart';
import 'package:fitness_app/providers/diary.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/date_range_dropdown.dart';
import 'package:fitness_app/widgets/mini_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomerDiaryView extends ConsumerStatefulWidget {
  const CustomerDiaryView({super.key});

  @override
  ConsumerState<CustomerDiaryView> createState() => _CustomerDiaryViewState();
}

class _CustomerDiaryViewState extends ConsumerState<CustomerDiaryView> {
  int _selectedWeekday = 0;
  DateRange _selectedPeriod = DateRange.thisWeek;
  DiaryMood _selectedMood = DiaryMood.neutral;
  DiaryMoodReason? _selectedReason;
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: _buildAppBar(theme.colorScheme),
      body: _buildBody(theme.textTheme, theme.colorScheme),
      resizeToAvoidBottomInset: false,
    );
  }

  AppBar _buildAppBar(ColorScheme colorScheme) {
    return AppBar(
      title: Text(
        'customer_diary_view.title',
        style: TextStyle(color: colorScheme.tertiary),
      ).tr(),
    );
  }

  Widget _buildBody(TextTheme textTheme, ColorScheme colorScheme) {
    final todayDateTime = DateTime.now();
    final todayDate = DateTime(
      todayDateTime.year,
      todayDateTime.month,
      todayDateTime.day,
    );
    final selectedDate = todayDate.add(Duration(days: _selectedWeekday));
    final diaryValue = ref.watch(diaryEntryProvider(selectedDate));

    return Skeletonizer(
      enabled: !diaryValue.hasValue,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DateRangeDropdown(
                  currentRange: _selectedPeriod,
                  onChanged: (i) => setState(() => _selectedPeriod = i!),
                ),
                const SizedBox(height: 8.0),
                MiniCalendar(
                  onWeekdaySelected: (w) =>
                      setState(() => _selectedWeekday = w),
                  color: colorScheme.tertiary,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'customer_diary_view.state_title'.tr(),
                  style: textTheme.titleMedium,
                ),
                const SizedBox(height: 8.0),
                Text(
                  'customer_diary_view.state_description'.tr(),
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          _MoodPicker(
            mood: _selectedMood,
            onMoodChanged: (i) => _selectedMood = i,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'customer_diary_view.reason_title'.tr(),
                  style: textTheme.titleMedium,
                ),
                const SizedBox(height: 8.0),
                Text(
                  'customer_diary_view.reason_description'.tr(),
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(height: 8.0),
                _buildReasons(textTheme, colorScheme),
                const SizedBox(height: 16.0),
                Text('customer_diary_view.add_title'.tr(),
                    style: textTheme.titleMedium),
                const SizedBox(height: 8.0),
                Text(
                  'customer_diary_view.add_description'.tr(),
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: _textController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  maxLength: 500,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(16.0),
                  ),
                ),
                const SizedBox(height: 8.0),
                OutlinedButton(
                  onPressed: () => (),
                  style: darkOutlinedButton,
                  child: Text('customer_diary_view.record_button'.tr()),
                ),
                const SizedBox(height: 16.0),
                FilledButton(
                  onPressed: () => (),
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.tertiary,
                    foregroundColor: colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 36.0),
                  ),
                  child: Text('common.save_button'.tr()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildReasons(TextTheme textTheme, ColorScheme colorScheme) {
    return Wrap(
      spacing: 4.0,
      runSpacing: 4.0,
      children: DiaryMoodReason.values
          .map((reason) => _buildReasonChip(
                reason.translationKey.tr(),
                _selectedReason == reason,
                () => setState(() => _selectedReason =
                    _selectedReason != reason ? reason : null),
                textTheme,
                colorScheme,
              ))
          .toList(),
    );
  }

  Widget _buildReasonChip(
    String label,
    bool isSelected,
    void Function() onSelected,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    final textColor = isSelected ? colorScheme.onPrimary : darkColor;

    return FilterChip(
      selected: isSelected,
      selectedColor: colorScheme.tertiary,
      backgroundColor: colorScheme.surfaceDim,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(style: BorderStyle.none),
      ),
      showCheckmark: false,
      label: Text(
        label,
        style: textTheme.bodyMedium!.copyWith(color: textColor),
      ),
      onSelected: (b) => onSelected(),
    );
  }
}

class _MoodPicker extends StatefulWidget {
  const _MoodPicker({required this.mood, required this.onMoodChanged});

  final DiaryMood mood;
  final void Function(DiaryMood) onMoodChanged;

  @override
  State<_MoodPicker> createState() => _MoodPickerState();
}

class _MoodPickerState extends State<_MoodPicker> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      viewportFraction: 0.3,
      initialPage: widget.mood.index,
    );
  }

  @override
  void didUpdateWidget(_MoodPicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!_pageController.hasClients) {
      return;
    }

    if (_pageController.page?.round() != widget.mood.index) {
      _pageController.animateTo(
        widget.mood.index.toDouble(),
        duration: Durations.short3,
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [colorScheme.secondary, colorScheme.surface],
              ),
            ),
          ),
          _buildMoodsView()
        ],
      ),
    );
  }

  Widget _buildMoodsView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (page) {
        setState(() => ());
        widget.onMoodChanged(DiaryMood.values[page]);
      },
      padEnds: true,
      children: DiaryMood.values.indexed
          .map((t) => _buildMoodOption(
                t.$1,
                t.$2.iconAsset,
                t.$2.translationKey.tr(),
              ))
          .toList(),
    );
  }

  Widget _buildMoodOption(
    int index,
    String image,
    String text,
  ) {
    final bool isSelected;
    if (_pageController.hasClients) {
      isSelected = index == _pageController.page?.round();
    } else {
      isSelected = index == widget.mood.index;
    }

    return AnimatedScale(
      key: ValueKey(index),
      scale: isSelected ? 1.0 : 0.75,
      duration: Durations.short3,
      child: Center(
        child: SizedBox(
          width: 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Skeleton.shade(
                child: Image.asset(image, alignment: Alignment.topCenter),
              ),
              const SizedBox(height: 16.0),
              Text(text, textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }
}
