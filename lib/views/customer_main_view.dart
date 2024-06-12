import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/views/customer/customer_coaches_view.dart';
import 'package:fitness_app/views/customer/customer_home_view.dart';
import 'package:fitness_app/views/customer/customer_progress_view.dart';
import 'package:fitness_app/views/profile_view.dart';
import 'package:flutter/material.dart';

class CustomerMainView extends StatefulWidget {
  const CustomerMainView({super.key});

  @override
  State<CustomerMainView> createState() => _CustomerMainViewState();
}

class _CustomerMainViewState extends State<CustomerMainView>
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
          icon: const Icon(Icons.home_outlined),
          label: 'customer_main_view.home_tab'.tr(context: context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.forum_outlined),
          label: 'customer_main_view.coaches_tab'.tr(context: context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.flag_outlined),
          label: 'customer_main_view.progress_tab'.tr(context: context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: 'customer_main_view.profile_tab'.tr(context: context),
        ),
      ],
    );
  }

  Widget _buildTabView() {
    return TabBarView(
      controller: _tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        CustomerHomeView(),
        CustomerCoachesView(),
        CustomerProgressView(),
        ProfileView()
      ],
    );
  }
}
