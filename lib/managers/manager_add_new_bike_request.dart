/*
* Created by Neloy on 21 January, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:bike_hub/network/models/model_notification.dart';
import 'package:flutter/material.dart';

import '../network/api/api_add_new_bike_request.dart';
import '../network/constant/constant_values.dart';
import '../network/models/model_base.dart';
import '../view/utilities/components/custom_Dialogue.dart';
import '../view/utilities/values/app_strings.dart';

class AddNewBikeRequestManager {
  static AddNewBikeRequestManager? _manager;
  static String _brand = "";
  static String _model = "";
  static BuildContext? _context;

  static AddNewBikeRequestManager getInstance({
    required BuildContext context,
    required String brand,
    required String model,
  }) {
    _brand = brand;
    _model = model;
    _context = context;
    _manager ??= AddNewBikeRequestManager();
    return _manager!;
  }

  Future<void> connection() async {
    try {
      CustomDialogue.loading(context: _context!);
      String result = await AddNewBikeRequestAPI().run(
        notification: NotificationModel(
          brand: _brand,
          model: _model,
        ),
      );
      if (result != ConstantValues.error) {
        BaseModel baseModel = BaseModel.fromJson(result);
        if (baseModel.status == ConstantValues.success) {
          Navigator.of(_context!).pop();
          CustomDialogue.simple(
            context: _context!,
            onPressed: () {
              Navigator.of(_context!).pop();
              Navigator.of(_context!).pop();
            },
            icon: Icons.check_circle_sharp,
            message: baseModel.message!,
            buttonText: AppStrings.close,
          );
        } else {
          Navigator.of(_context!).pop();
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
      Navigator.of(_context!).pop();

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
