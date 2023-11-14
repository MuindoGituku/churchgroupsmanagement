import 'package:churchgroupsmanagement/screens/root_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactSupport extends StatefulWidget {
  const ContactSupport({super.key});

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
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
