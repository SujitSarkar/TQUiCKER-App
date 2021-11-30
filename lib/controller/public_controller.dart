import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PublicController extends GetxController {
  RxBool isPhone = true.obs;
  SharedPreferences? preferences;
  RxDouble size = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    iniatializeApp();
  }

  Future<void> iniatializeApp() async {
    preferences = await SharedPreferences.getInstance();
    isPhone(preferences!.getBool('isPhone')!);

    if (isPhone.value) {
      size(MediaQuery.of(Get.context!).size.width);
    } else {
      size(MediaQuery.of(Get.context!).size.height);
    }
    update();
    print('IsPhone: ${isPhone.value}');
    print('Size: ${size.value}');
    print("Data Initialized !!!");
  }
}
