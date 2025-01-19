/*
* Created by Neloy on 19 January, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:http/http.dart' as http;

import '../constant/constant_paths.dart';
import '../constant/constant_values.dart';

class GetAllBikesAPI {
  Future<String> run() async {
    try {
      var request = http.Request(
        ConstantValues.requestGet,
        Uri.parse(
          ConstantPaths.baseUrl + ConstantPaths.getAllBikes,
        ),
      );

      var headers = {
        ConstantValues.accept: ConstantValues.applicationJson,
      };

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      return await response.stream.bytesToString();
    } on Exception {
      return ConstantValues.error;
    }
  }
}
