import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tquicker/controller/public_controller.dart';

class Config {
  final PublicController _publicController = Get.find();
  static late double screenWidth;

  double width(double value) {
    return _publicController.size.value * value;
  }
}

double customWidth(double? v) {
  return Config().width(v ?? 0);
}

TextStyle textTheme(BuildContext context, double fontSize,
    FontWeight fontWeight, Color? color) {
  return Theme.of(context).textTheme.headline1!.copyWith(
      fontSize: customWidth(fontSize), fontWeight: fontWeight, color: color);
}
