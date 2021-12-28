import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tquicker/model/owner/metro_name_model.dart';
import 'package:http/http.dart' as http;
import 'package:tquicker/model/owner/owner_model.dart';
import 'package:tquicker/model/owner/owner_vehicle_list_model.dart';
import 'package:tquicker/model/owner/vahicle_category_model.dart';
import 'package:tquicker/model/owner/vehicle_length_model.dart';
import 'package:tquicker/model/owner/vehicle_load_capacity_model.dart';
import 'package:tquicker/model/owner/vehicle_metro_serial_model.dart';
import 'package:tquicker/model/owner/vehicle_seat_capacity.dart';
import 'package:tquicker/model/owner/vehicle_type_model.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';

class OwnerController extends GetxController {
  static const String baseUrl='http://app.tquicker.com/api/';
  
  RxBool isPhone = true.obs;
  SharedPreferences? preferences;
  RxDouble size = 0.0.obs;

  Rx<OwnerModel> ownerModel = OwnerModel().obs;

  RxList<VehicleCategoryModel> vehicleCategoryList = <VehicleCategoryModel>[].obs;
  RxList<MetroNameModel> metroNameList = <MetroNameModel>[].obs;
  RxList<VehicleTypeModel> vehicleTypeList = <VehicleTypeModel>[].obs;
  RxList<VehicleSeatCapacityModel> vehicleSeatCapacityList = <VehicleSeatCapacityModel>[].obs;
  RxList<VehicleLengthModel> vehicleLengthList = <VehicleLengthModel>[].obs;
  RxList<VehicleMetroSerialModel> metroSerialList = <VehicleMetroSerialModel>[].obs;
  RxList<VehicleLoadCapacityModel> loadCapacityList = <VehicleLoadCapacityModel>[].obs;
  RxList<OwnerVehicleModel> ownerVehicleList = <OwnerVehicleModel>[].obs;

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
  }

  Future<bool> getOwnerRegData(Map dataMap)async{
    try{
      var response = await http.post(Uri.parse(baseUrl+'owner_store'),
      body: dataMap);
      if(response.statusCode==200){
        Map map={
          'username':dataMap['contact_no'],
          'password':dataMap['password']};

        showToast('Registration Success');
        await getOwnerLoginData(map);
        // var jsonData = jsonDecode(response.body);
        // ownerModel.value = OwnerModel.fromJson(jsonData['data']);
        // update();
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
        var jsonData = jsonDecode(response.body);
        ownerModel.value = OwnerModel.fromJson(jsonData['user']);
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

  Future<void> getOwnerVehicles()async{
    try{
      var response = await http.get(Uri.parse(baseUrl+'vehicle_list_owner/${ownerModel.value.id!}'));
      if(response.statusCode==200){
        ownerVehicleList.value=ownerVehicleModelFromJson(response.body);
        update();
      }
    }catch(error){
      showToast(error.toString());
    }
  }

  Future<bool> addOwnerVehicle(Map dataMap)async{
    try{
      var response = await http.post(Uri.parse(baseUrl+'vehicle_store/${ownerModel.value.apiToken}'),
          body: dataMap);
      if(response.statusCode==200){
        return true;
      }
      else{showToast('Failed');return false;}
    }catch(error){
      showToast(error.toString());
      return false;
    }
  }

  Future<bool> updateOwnerVehicle(Map dataMap, String vehicleId)async{
    try{
      var response = await http.post(Uri.parse(baseUrl+'vehicle_update/$vehicleId/${ownerModel.value.apiToken}'),
          body: dataMap);
      if(response.statusCode==200){
        return true;
      }
      else{showToast('Failed');return false;}
    }catch(error){
      showToast(error.toString());
      return false;
    }
  }

  Future<bool> registerDriver(Map dataMap)async{
    try{
      var response = await http.post(Uri.parse(baseUrl+'drive_store/${ownerModel.value.apiToken}'),
          body: dataMap);
      print(response.body);
      if(response.statusCode==200){
        return true;
      } else{return false;}
    }catch(error){
      showToast(error.toString());
      return false;
    }
  }
}
