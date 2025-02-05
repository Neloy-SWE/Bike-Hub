/*
* Created by Neloy on 18 January, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/material.dart';

import '../values/app_image_path.dart';

class MyLoader extends StatefulWidget {
  const MyLoader({super.key});

  @override
  State<MyLoader> createState() => _MyLoaderState();
}

class _MyLoaderState extends State<MyLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController rotationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 4))
        ..repeat();

  @override
  dispose() {
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
        child: Image.asset(
          AppImagePath.loader,
          width: 70,
        ),
      ),
    );
  }
}
