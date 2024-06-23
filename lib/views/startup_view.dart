import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fitness_app/theme.dart';
import 'package:fitness_app/widgets/page_indicators.dart';

class StartupView extends StatelessWidget {
  const StartupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _StartupViewBody(),
      resizeToAvoidBottomInset: false,
    );
  }
}

class _StartupViewBody extends StatelessWidget {
  const _StartupViewBody();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      fit: StackFit.expand,
      children: [
        _buildBackground(theme.colorScheme),
        _buildImage(),
        _buildContent(context, theme.textTheme, theme.colorScheme)
      ],
    );
  }

  Widget _buildBackground(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [colorScheme.secondary, colorScheme.surface],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Center(
      child: SizedBox(
        height: 400.0,
        child: Image.asset(
          'assets/images/startup_background.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 80.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  'start_up_view.title_1',
                  style: titleTextStyle.copyWith(fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ).tr(),
                Text('start_up_view.title_2', style: titleTextStyle).tr(),
              ],
            ),
          ),
          const _StartupViewTips(),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FilledButton(
                  style: backgroundButton,
                  onPressed: () => _onLoginPressed(context),
                  child: const Text('common.login_button').tr(),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: FilledButton(
                  style: backgroundButton,
                  onPressed: () => _onSignUpPressed(context),
                  child: const Text('common.sign_up_button').tr(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _onLoginPressed(BuildContext context) {
    context.push('/login');
  }

  void _onSignUpPressed(BuildContext context) {
    context.push('/sign_up');
  }
}

class _StartupViewTips extends StatefulWidget {
  const _StartupViewTips();

  @override
  State<StatefulWidget> createState() {
    return _StartupViewTipsState();
  }
}

class _StartupViewTipsState extends State<_StartupViewTips> {
  static const tipsCount = 3;

  int _currentTip = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        if (_pageController.page != null) {
          _currentTip = _pageController.page!.round();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        _buildTipsContainer(theme.textTheme),
        const SizedBox(height: 8.0),
        PageIndicators(
          pagesCount: tipsCount,
          page: _currentTip,
          color: theme.colorScheme.surface,
        )
      ],
    );
  }

  Widget _buildTipsContainer(TextTheme textTheme) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 176.0,
          decoration: BoxDecoration(color: darkColor.withAlpha(20)),
          padding: const EdgeInsets.fromLTRB(18.0, 16.0, 18.0, 8.0),
          child: PageView.builder(
            itemCount: tipsCount,
            controller: _pageController,
            itemBuilder: (context, index) => _buildTipText(index, textTheme),
          ),
        ),
      ),
    );
  }

  Widget _buildTipText(int index, TextTheme textTheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'start_up_view.tips.$index.title',
          style: textTheme.titleMedium?.copyWith(color: Colors.white),
        ).tr(),
        Text(
          'start_up_view.tips.$index.body',
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium?.copyWith(color: Colors.white),
        ).tr()
      ],
    );
  }
}
