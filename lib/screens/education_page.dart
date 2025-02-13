import 'package:bundacare/screens/widgets/bar_widget.dart';
import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

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
