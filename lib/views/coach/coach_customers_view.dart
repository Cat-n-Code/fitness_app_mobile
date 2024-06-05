import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CouchCustomersView extends StatelessWidget {
  const CouchCustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('couch_customers_view.title').tr(),
    );
  }
}
