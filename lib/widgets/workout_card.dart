import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    super.key,
    required this.onTap,
  });

  static const defaultHeight = 140.0;
  static const backgroundColor = Color.fromARGB(255, 148, 187, 195);
  static const foregroundColor = Colors.white;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: false,
      child: SizedBox(
        height: defaultHeight,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          clipBehavior: Clip.hardEdge,
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final bodyMedium = theme.textTheme.bodyMedium!.copyWith(
      color: foregroundColor,
    );
    final locale = EasyLocalization.of(context)!.locale;
    final dateFormat = DateFormat.yMMMd(locale.toLanguageTag());

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(color: backgroundColor),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildContent(
            bodyMedium,
            dateFormat,
            theme.textTheme,
            theme.colorScheme,
          ),
        ),
        Material(
          type: MaterialType.transparency,
          child: InkResponse(onTap: onTap, highlightShape: BoxShape.rectangle),
        )
      ],
    );
  }

  Widget _buildContent(
    TextStyle textStyle,
    DateFormat dateFormat,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FractionallySizedBox(
                widthFactor: 0.7,
                child: Text(
                  'Muscle Building',
                  style: textTheme.titleMedium!.copyWith(
                    fontSize: 20.0,
                    color: foregroundColor,
                  ),
                ),
              ),
              Text('Full Body', style: textStyle),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildChip(
                      textStyle,
                      Icons.event,
                      dateFormat.format(DateTime.now()),
                    ),
                    const SizedBox(width: 4.0),
                    _buildChip(textStyle, Icons.fitness_center, 'Beginner'),
                  ],
                ),
              )
            ],
          ),
        ),
        _buildProgress(textTheme, colorScheme)
      ],
    );
  }

  Widget _buildChip(
    TextStyle textStyle,
    IconData icon,
    String content,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: foregroundColor,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 12.0, 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: foregroundColor),
          const SizedBox(width: 4.0),
          Text(content, style: textStyle)
        ],
      ),
    );
  }

  Widget _buildProgress(TextTheme textTheme, ColorScheme colorScheme) {
    return SizedBox(
      width: 64.0,
      height: 64.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Text(
              '65%',
              style: textTheme.bodyLarge!.copyWith(color: foregroundColor),
            ),
          ),
          CircularProgressIndicator(
            value: 0.3,
            color: foregroundColor,
            backgroundColor: colorScheme.surfaceDim.withAlpha(180),
            strokeCap: StrokeCap.round,
            strokeWidth: 8.0,
            strokeAlign: -1.0,
          ),
        ],
      ),
    );
  }
}
