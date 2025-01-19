/*
* Created by Neloy on 18 January, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:bike_hub/managers/manager_bike_list.dart';
import 'package:bike_hub/view/utilities/values/app_strings.dart';
import 'package:flutter/material.dart';

import '../utilities/components/custom_loader.dart';
import '../utilities/values/app_image_path.dart';
import '../utilities/values/app_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    BikeListManager.getInstance(context: context).connection();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.welcome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AppImagePath.bike,
                height: 200,
              ),
              Column(
                children: [
                  Text(
                    AppStrings.appTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  AppSize.gapH40,
                  const MyLoader(),
                ],
              ),
              Text(
                AppStrings.copyright,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 9,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
