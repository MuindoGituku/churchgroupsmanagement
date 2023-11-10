import 'package:churchgroupsmanagement/screens/root_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeLandingScreen extends StatefulWidget {
  const HomeLandingScreen({super.key});

  @override
  State<HomeLandingScreen> createState() => _HomeLandingScreenState();
}

class _HomeLandingScreenState extends State<HomeLandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            zoomDrawerController.toggle!();
          },
          icon: const Icon(
            CupertinoIcons.line_horizontal_3,
          ),
        ),
        centerTitle: false,
      ),
    );
  }
}
