/*
* Created by Neloy on 21 January, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:bike_hub/network/constant/constant_paths.dart';
import 'package:bike_hub/network/constant/constant_values.dart';
import 'package:bike_hub/network/models/model_notification.dart';
import 'package:http/http.dart' as http;

class AddNewBikeRequestAPI {
  Future<String> run({required NotificationModel notification}) async {
    try {
      var request = http.Request(
        ConstantValues.requestPost,
        Uri.parse(
          ConstantPaths.baseUrl + ConstantPaths.addNewBikeRequest,
        ),
      );

      request.body = notification.toRawJson();

      var headers = {
        ConstantValues.contentType: ConstantValues.applicationJson,
      };

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      return await response.stream.bytesToString();
    } on Exception {
      return ConstantValues.error;
    }
  }
}
