import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tquicker/controller/owner_controller.dart';
import 'package:tquicker/static_variable/size_config.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';
import 'package:tquicker/widgets/button.dart';
import 'package:tquicker/widgets/custom_textformfield.dart';

class RegisterDriverPage extends StatefulWidget {
  const RegisterDriverPage({Key? key,required this.vehicleId}) : super(key: key);
  final int vehicleId;

  @override
  _RegisterDriverPageState createState() => _RegisterDriverPageState();
}

class _RegisterDriverPageState extends State<RegisterDriverPage> {
  bool _isLoading=false;

  final TextEditingController _name=TextEditingController(text: '');
  final TextEditingController _email=TextEditingController(text: '');
  final TextEditingController _contactNo=TextEditingController(text: '');
  final TextEditingController _nationalId=TextEditingController(text: '');
  final TextEditingController _address=TextEditingController(text: '');
  final TextEditingController _password=TextEditingController(text: '');
  final TextEditingController _dlLicenseNo=TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnerController>(
        builder: (ownerController) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: Text('ADD Driver',style: TextStyle(color: ThemeAndColor.textColor,fontWeight: FontWeight.w700,fontSize: customWidth(0.05))),
            ),
            body: _bodyUI(ownerController),
          );
        }
    );
  }

  Widget _bodyUI(OwnerController ownerController)=>SingleChildScrollView(
    physics:const ClampingScrollPhysics(),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: customWidth(0.04)),
      child: Column(
        children: [
          SizedBox(height: customWidth(0.05)),
          CustomTextFormField(controller: _name, hintText: 'Full Name',textInputType: TextInputType.text),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _email, hintText: 'Email Address',textInputType: TextInputType.text),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _contactNo, hintText: 'Contact Number',textInputType: TextInputType.number),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _address, hintText: 'Address',textInputType: TextInputType.text),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _password, hintText: 'password',textInputType: TextInputType.text),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _nationalId, hintText: 'National ID',textInputType: TextInputType.number),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _dlLicenseNo, hintText: 'License No',textInputType: TextInputType.number),
          SizedBox(height: customWidth(0.04)),

          _isLoading
              ?spinCircle()
              :SolidButton(child: Text('Register',style: TextStyle(color: ThemeAndColor.textColor,fontWeight: FontWeight.bold,fontSize: customWidth(0.04))),
              onPressed: (){
                _registerDriver(ownerController);
              },
              height: customWidth(0.1),
              width: customWidth(0.4),
              borderRadius: customWidth(0.02)),
        ],
      ),
    ),
  );

  void _registerDriver(OwnerController ownerController)async{
    setState(()=> _isLoading=true);
    Map dataMap={
      'vahicals_id':widget.vehicleId.toString(),
      'name': _name.text,
      'email':_email.text,
      'contact_no':_contactNo.text,
      'national_id':_nationalId.text,
      'contact_address':_contactNo.text,
      'password':_password.text,
      'dl_lincence_no':_dlLicenseNo.text};

    await ownerController.registerDriver(dataMap).then((result){
      if(result){
        setState(()=> _isLoading=false);
        showToast('Success');
        Get.back();
      }else{
        setState(()=> _isLoading=false);
        showToast('Failed');
      }
    });
  }
}
