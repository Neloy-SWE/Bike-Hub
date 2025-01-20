/*
* Created by Neloy on 19 January, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:bike_hub/network/constant/constant_values.dart';
import 'package:bike_hub/view/screens/screen_home_page.dart';
import 'package:flutter/material.dart';

import '../network/api/api_get_all_bikes.dart';
import '../network/models/model_base.dart';
import '../network/models/model_bike.dart';
import '../view/utilities/components/custom_dialogue.dart';
import '../view/utilities/values/app_strings.dart';

class BikeListManager {
  static BikeListManager? _manager;
  List<BikeModel> bikes = [];
  static BuildContext? _context;

  static BikeListManager getInstance({required BuildContext context}) {
    _context = context;
    _manager ??= BikeListManager();
    return _manager!;
  }

  Future<void> connection() async {
    try {
      String result = await GetAllBikesAPI().run();
      if (result != ConstantValues.error) {
        BaseModel baseModel = BaseModel.fromJson(result);
        if (baseModel.status == ConstantValues.success) {
          bikes = baseModel.data
              .map<BikeModel>((e) => BikeModel.fromMap(e))
              .toList();

          Navigator.of(_context!).pushReplacement(
            MaterialPageRoute(
              builder: (builder) => const HomePageScreen(),
            ),
          );
        } else {
          CustomDialogue.simple(
            context: _context!,
            onPressed: () {
              Navigator.of(_context!).pop();
            },
            icon: Icons.error_outline_outlined,
            message: baseModel.message!,
            buttonText: AppStrings.close,
          );
        }
      }
    } on Exception {
      CustomDialogue.simple(
        context: _context!,
        onPressed: () {
          Navigator.of(_context!).pop();
          connection();
        },
        icon: Icons.error_outline_outlined,
        message: AppStrings.checkYourInternet,
        buttonText: AppStrings.retry,
      );
    }
  }
}
