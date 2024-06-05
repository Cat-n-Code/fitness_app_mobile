import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoachMainView extends ConsumerStatefulWidget {
  const CoachMainView({super.key});

  @override
  ConsumerState<CoachMainView> createState() => _CoachMainViewState();
}

class _CoachMainViewState extends ConsumerState<CoachMainView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
    _tabController.index = _currentTabIndex;
    _tabController.addListener(() => setState(() {
          _currentTabIndex = _tabController.index;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildTabView(),
      bottomNavigationBar: _buildNavigationBar(context),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentTabIndex,
      onTap: (index) => _tabController.animateTo(index),
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.people),
          label: 'couch_main_view.customer_tab'.tr(context: context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.fitness_center),
          label: 'couch_main_view.workouts_tab'.tr(context: context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.sports_soccer),
          label: 'couch_main_view.exercises_tab'.tr(context: context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: 'couch_main_view.profile_tab'.tr(context: context),
        ),
      ],
    );
  }

  Widget _buildTabView() {
    return TabBarView(
      controller: _tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Scaffold(),
        Scaffold(),
        Scaffold(),
        ProfileView(),
      ],
    );
  }
}
