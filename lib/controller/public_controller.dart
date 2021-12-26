import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tquicker/model/owner_reg_model.dart';
import 'package:http/http.dart' as http;
import 'package:tquicker/static_variable/theme_and_color.dart';

class PublicController extends GetxController {
  static const String baseUrl='http://app.tquicker.com/api/';
  
  RxBool isPhone = true.obs;
  SharedPreferences? preferences;
  RxDouble size = 0.0.obs;

  Rx<OwnerRegResponseModel> regResponseModel = OwnerRegResponseModel().obs;

  @override
  void onInit() {
    super.onInit();
    iniatializeApp();
  }

  Future<void> iniatializeApp() async {
    preferences = await SharedPreferences.getInstance();
    isPhone(preferences!.getBool('isPhone')!);

    if (isPhone.value) {size(MediaQuery.of(Get.context!).size.width);}
    else {size(MediaQuery.of(Get.context!).size.height);}
    update();
    print('IsPhone: ${isPhone.value}');
    print('Size: ${size.value}');
    print("Data Initialized !!!");
  }

  Future<bool> getOwnerRegData(Map dataMap)async{
    try{
      var response = await http.post(Uri.parse(baseUrl+'owner_store'),
      body: dataMap);
      if(response.statusCode==200){
        regResponseModel.value=ownerRegResponseModelFromJson(response.body);
        update();
        showToast('Registration Success');
        return true;
      }else if(response.statusCode==400){
        showToast('Already Registered');
        return false;
      }
      else{showToast('Registration Failed');return false;}
    }catch(error){
      showToast(error.toString());
      return false;
    }
  }
}
