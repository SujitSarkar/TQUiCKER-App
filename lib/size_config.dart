import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tquicker/controller/public_controller.dart';

class Config {
  final PublicController _publicController = Get.find();

  static late double screenWidth;

  double width(double value) {
    return _publicController.size.value * value;
  }
}

double customeWidth(double? v) {
  return Config().width(v ?? 0);
}
