import 'package:churchgroupsmanagement/screens/root_navigation.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auctioneers Diary',
      theme: ThemeData(
        primaryColor: AppColors().mainBlueColor,
        scaffoldBackgroundColor: const Color.fromARGB(255, 237, 236, 236),
        fontFamily: "OpenSansRegular",
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors().mainBlueColor,
        ),
        useMaterial3: true,
      ),
      home: const AppRootNavigation(),
    );
  }
}
