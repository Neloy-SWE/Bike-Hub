/*
* Created by Neloy on 20 January, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:http/http.dart' as http;
import '../constant/constant_paths.dart';
import '../constant/constant_values.dart';


class BikeDetailsAPI {
  Future<String> run({required String id}) async {
    try {

      var request = http.Request(
        ConstantValues.requestGet,
        Uri.parse(
          ConstantPaths.baseUrl + ConstantPaths.getSingleBike + id,
        ),
      );

      // var headers = {
      //   ConstantValues.authorization:
      //   ConstantValues.bearer + await box.get(ValueConfigs.token),
      // };
      //
      // request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      return await response.stream.bytesToString();
    } on Exception {
      return ConstantValues.error;
    }
  }
}