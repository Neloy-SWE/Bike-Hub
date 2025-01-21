/*
* Created by Neloy on 19 January, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'dart:convert';

class NotificationModel {
  final String? brand;
  final String? model;

  NotificationModel({
    this.brand,
    this.model,
  });

  factory NotificationModel.fromRawJson(String str) =>
      NotificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        brand: json["brand"],
        model: json["model"],
      );

  Map<String, dynamic> toJson() => {
    "brand": brand,
    "model": model,
  };
}
