/*
* Created by Neloy on 20 January, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:bike_hub/network/models/model_bike.dart';
import 'package:flutter/material.dart';

import '../network/api/api_bike_details.dart';
import '../network/constant/constant_values.dart';
import '../network/models/model_base.dart';
import '../view/screens/screen_bike_details.dart';
import '../view/utilities/components/custom_Dialogue.dart';
import '../view/utilities/values/app_strings.dart';

class BikeDetailsManager {
  static BikeDetailsManager? _manager;
  late BikeModel details;
  static BuildContext? _context;
  static int _id = 0;

  static BikeDetailsManager getInstance(
      {required BuildContext context, required int id}) {
    _context = context;
    _id = id;
    _manager ??= BikeDetailsManager();
    return _manager!;
  }

  Future<void> connection() async {
    try {
      CustomDialogue.loading(context: _context!);
      String result = await BikeDetailsAPI().run(id: _id.toString());
      if (result != ConstantValues.error) {
        BaseModel baseModel = BaseModel.fromJson(result);
        if (baseModel.status == ConstantValues.success) {
          details = BikeModel.fromMap(baseModel.data);
          Navigator.of(_context!).pop();
          Navigator.of(_context!).push(
            MaterialPageRoute(
              builder: (builder) => BikeDetailsScreen(
                id: _id,
              ),
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
