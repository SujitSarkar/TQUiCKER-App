import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tquicker/controller/public_controller.dart';
import 'package:tquicker/pages/vehicle_owner/add_vehicle_page.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';
import 'package:tquicker/widgets/button.dart';
import 'package:tquicker/widgets/custom_textformfield.dart';
import 'package:tquicker/widgets/grediant_bg.dart';

import '../../static_variable/size_config.dart';

class OwnerRegistrationPage extends StatefulWidget {
  const OwnerRegistrationPage({Key? key}) : super(key: key);

  @override
  State<OwnerRegistrationPage> createState() => _OwnerRegistrationPageState();
}

class _OwnerRegistrationPageState extends State<OwnerRegistrationPage> {
  File? _imageFile;
  bool _isLoading=false;

  final TextEditingController _name = TextEditingController(text: '');
  final TextEditingController _email = TextEditingController(text: '');
  final TextEditingController _contactNo = TextEditingController(text: '');
  final TextEditingController _nationId = TextEditingController(text: '');
  final TextEditingController _contactAddress = TextEditingController(text: '');
  final TextEditingController _password = TextEditingController(text: '');
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  initState(){
    super.initState();
    PublicController publicController= Get.find();
    if(publicController.vehicleCategoryList.isEmpty || publicController.metroNameList.isEmpty
    || publicController.vehicleTypeList.isEmpty || publicController.vehicleSeatCapacityList.isEmpty ||
     publicController.vehicleLengthList.isEmpty || publicController.metroSerialList.isEmpty||
        publicController.loadCapacityList.isEmpty){
      publicController.getAllVehicleDataList();
    }

  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicController>(
      builder: (publicController) {
        return Scaffold(
            key: _scaffoldKey,
            drawer: const Drawer(),
            //resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                SizedBox(
                  height: customWidth(0.6),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GradientBG(height: customWidth(0.6)),

                      ///Profile Image
                      Positioned(
                        bottom: customWidth(0.03),
                        child: _imageFile==null? InkWell(
                          onTap: ()=>_getImageFromGallery(),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/user.png",
                                height: customWidth(0.2),
                              ),
                              Text(
                                'Upload Your Photo',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: customWidth(0.04)),
                              )
                            ],
                          ),
                        ):InkWell(
                          onTap: ()=>_getImageFromGallery(),
                          child: Container(
                            height: customWidth(0.25),
                            width: customWidth(0.25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(customWidth(0.2))),
                              border: Border.all(color: Colors.white,width: 2),
                              image: DecorationImage(
                                image: FileImage(_imageFile!),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                        ),
                      ),

                      ///Header
                      Positioned(
                        left: customWidth(0.02),
                        top: customWidth(0.03),
                        child: SafeArea(
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    _scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: Icon(CupertinoIcons.bars,
                                      color: Colors.grey.shade200)),
                              Text(
                                "Complete Your Registration",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: customWidth(0.045)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all( customWidth(0.04)),
                      child: Column(
                        children: [
                          CustomTextFormField(controller: _name, hintText: 'Full Name (ex: Mr. Enan)',textInputType: TextInputType.text),
                          SizedBox(height: customWidth(0.05)),
                          CustomTextFormField(controller: _email, hintText: 'Email Address',textInputType: TextInputType.emailAddress),
                          SizedBox(height: customWidth(0.05)),
                          CustomTextFormField(controller: _contactNo, hintText: 'Contact No',textInputType: TextInputType.number),
                          SizedBox(height: customWidth(0.05)),
                          CustomTextFormField(controller: _nationId, hintText: 'National ID',textInputType: TextInputType.number),
                          SizedBox(height: customWidth(0.05)),
                          CustomTextFormField(controller: _contactAddress, hintText: 'Contact Address',textInputType: TextInputType.text),
                          SizedBox(height: customWidth(0.05)),
                          CustomTextFormField(controller: _password, hintText: 'password',textInputType: TextInputType.text),
                          SizedBox(height: customWidth(0.15)),

                          _isLoading
                              ?spinCircle()
                              :SolidButton(
                              child: Text('Send',
                                  style: TextStyle(
                                      color: ThemeAndColor.textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: customWidth(0.04))),
                              onPressed: (){
                                if(_imageFile!=null){
                                  if(_name.text.isNotEmpty&&_email.text.isNotEmpty&&_contactNo.text.isNotEmpty&&
                                      _nationId.text.isNotEmpty&&_contactAddress.text.isNotEmpty&_password.text.isNotEmpty){
                                    _registerUser(publicController);
                                  }else{showToast('Field can\'t be empty');}
                                }else{showToast('Select profile image');}
                              },
                              height: customWidth(0.1),
                              width: customWidth(0.4),
                              borderRadius: customWidth(0.02)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
            );
      }
    );
  }

  Future<void> _registerUser(PublicController publicController)async{
    setState(()=>_isLoading=true);

    final List<int> _imageBytes = _imageFile!.readAsBytesSync();
    final String _base64Image = base64Encode(_imageBytes);
    Map dataMap={
      'name':_name.text,
      'email':_email.text,
      'contact_no':_contactNo.text,
      'national_id':_nationId.text,
      'contact_address':_contactAddress.text,
      'password':_password.text,
      'image': _base64Image
    };
    await publicController.getOwnerRegData(dataMap).then((result){
      if(result){
        setState(()=>_isLoading=false);
        Get.offAll(() => AddVehiclePage(ownerToken: publicController.regResponseModel.value.token!));
      }else{
        setState(()=>_isLoading=false);
        //showToast('Registration Failed!');
      }
    });
  }

  Future<void> _getImageFromGallery()async{
    final ImagePicker _picker = ImagePicker();
    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
    if(_image!=null){
      setState(() {
        _imageFile = File(_image.path);
      });
    }else {
      showToast('Image not selected');
    }

  }
}
