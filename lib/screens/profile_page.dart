import 'package:bundacare/screens/widgets/bar_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomeBar(),
          ],
        ),
      ),
    );
  }
}
