import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      titleSpacing: 30.0,
      title: const Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatars/male.png'),
            radius: 24.0,
          ),
          SizedBox(width: 12.0),
          Text('Andrew')
        ],
      ),
    );
  }
}
