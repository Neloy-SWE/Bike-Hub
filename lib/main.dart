/*
* Created by Neloy on 18 January, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:bike_hub/view/screens/screen_splash.dart';
import 'package:bike_hub/view/utilities/theme/app_theme.dart';
import 'package:bike_hub/view/utilities/values/app_strings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.get,
      title: AppStrings.appTitle,
      home: const SplashScreen(),
    );
  }
}
