import 'package:churchgroupsmanagement/screens/root_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicationSettings extends StatefulWidget {
  const ApplicationSettings({super.key});

  @override
  State<ApplicationSettings> createState() => _ApplicationSettingsState();
}

class _ApplicationSettingsState extends State<ApplicationSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            zoomDrawerController.toggle!();
          },
          icon: Icon(
            CupertinoIcons.line_horizontal_3,
          ),
        ),
        centerTitle: false,
      ),
    );
  }
}
