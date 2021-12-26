import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tquicker/model/owner/metro_name_model.dart';
import 'package:tquicker/model/owner/owner_login_model.dart';
import 'package:http/http.dart' as http;
import 'package:tquicker/model/owner/owner_reg_model.dart';
import 'package:tquicker/model/owner/vahicle_category_model.dart';
import 'package:tquicker/model/owner/vehicle_length_model.dart';
import 'package:tquicker/model/owner/vehicle_load_capacity_model.dart';
import 'package:tquicker/model/owner/vehicle_metro_serial_model.dart';
import 'package:tquicker/model/owner/vehicle_seat_capacity.dart';
import 'package:tquicker/model/owner/vehicle_type_model.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';

class PublicController extends GetxController {
  static const String baseUrl='http://app.tquicker.com/api/';
  
  RxBool isPhone = true.obs;
  SharedPreferences? preferences;
  RxDouble size = 0.0.obs;

  Rx<OwnerRegResponseModel> regResponseModel = OwnerRegResponseModel().obs;
  Rx<OwnerLoginResponseModel> loginResponseModel = OwnerLoginResponseModel().obs;

  RxList<VehicleCategoryModel> vehicleCategoryList = <VehicleCategoryModel>[].obs;
  RxList<MetroNameModel> metroNameList = <MetroNameModel>[].obs;
  RxList<VehicleTypeModel> vehicleTypeList = <VehicleTypeModel>[].obs;
  RxList<VehicleSeatCapacityModel> vehicleSeatCapacityList = <VehicleSeatCapacityModel>[].obs;
  RxList<VehicleLengthModel> vehicleLengthList = <VehicleLengthModel>[].obs;
  RxList<VehicleMetroSerialModel> metroSerialList = <VehicleMetroSerialModel>[].obs;
  RxList<VehicleLoadCapacityModel> loadCapacityList = <VehicleLoadCapacityModel>[].obs;

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
    getAllVehicleDataList();

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
        regResponseModel.value.data!.name;
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

  Future<bool> getOwnerLoginData(Map dataMap)async{
    try{
      var response = await http.post(Uri.parse(baseUrl+'owner_login'),
          body: dataMap);
      if(response.statusCode==200){
        loginResponseModel.value=ownerLoginResponseModelFromJson(response.body);
        update();
        showToast('Login Success');
        return true;
      }else if(response.statusCode==400){
        showToast('Not registered yet with this username');
        return false;
      }
      else{showToast('Login Failed');return false;}
    }catch(error){
      showToast(error.toString());
      return false;
    }
  }

  Future<void> getAllVehicleDataList()async{
    try{
      var response = await http.get(Uri.parse(baseUrl+'vcategory'));
      if(response.statusCode==200){
        vehicleCategoryList.value=vehicleCategoryModelFromJson(response.body);
        update();
      }
      var response2 = await http.get(Uri.parse(baseUrl+'metroname'));
      if(response.statusCode==200){
        metroNameList.value=metroNameModelFromJson(response2.body);
        update();
      }
      var response3 = await http.get(Uri.parse(baseUrl+'vtype'));
      if(response.statusCode==200){
        vehicleTypeList.value=vehicleTypeModelFromJson(response3.body);
        update();
      }
      var response6 = await http.get(Uri.parse(baseUrl+'metroserial'));
      if(response.statusCode==200){
        metroSerialList.value=vehicleMetroSerialModelFromJson(response6.body);
        update();
      }
      var response4 = await http.get(Uri.parse(baseUrl+'vseatcapacity'));
      if(response.statusCode==200){
        vehicleSeatCapacityList.value=vehicleSeatCapacityModelFromJson(response4.body);
        update();
      }
      var response5 = await http.get(Uri.parse(baseUrl+'vlength'));
      if(response.statusCode==200){
        vehicleLengthList.value=vehicleLengthModelFromJson(response5.body);
        update();
      }
      var response7 = await http.get(Uri.parse(baseUrl+'vloadcapacity'));
      if(response.statusCode==200){
        loadCapacityList.value=vehicleLoadCapacityModelFromJson(response7.body);
        update();
      }
    }catch(error){
      showToast(error.toString());
    }
  }

  Future<bool> getVehicleTypeByCategory(String categoryId)async{
    try{
      var response = await http.get(Uri.parse(baseUrl+'vtype/$categoryId'));
      if(response.statusCode==200){
        vehicleTypeList.value=vehicleTypeModelFromJson(response.body);
        update();
        return true;
      }else{return false;}
    }catch(error){
      showToast(error.toString());
      return false;
    }
  }


  Future<bool> addOwnerVehicle(Map dataMap,String token)async{
    try{
      var response = await http.post(Uri.parse(baseUrl+'vehicle_store/$token'),
          body: dataMap);
      if(response.statusCode==200){
        print(response.body);
        return true;
      }
      else{showToast('Failed');print(response.body);return false;}
    }catch(error){
      showToast(error.toString());
      return false;
    }
  }
}
