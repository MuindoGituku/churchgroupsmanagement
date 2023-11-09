import 'package:flutter/material.dart';

class ScreenDimension {
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  EdgeInsets defaultScreenPadding(BuildContext context) => EdgeInsets.fromLTRB(
        15,
        MediaQuery.of(context).padding.top,
        15,
        MediaQuery.of(context).padding.bottom,
      );
}

class AppColors {
  Color mainBlueColor = const Color.fromARGB(255, 83, 158, 243);
}
