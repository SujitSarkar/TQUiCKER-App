import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tquicker/controller/owner_controller.dart';
import 'package:tquicker/pages/vehicle_owner/driver_list_model.dart';
import 'package:tquicker/static_variable/size_config.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';
import 'package:tquicker/widgets/button.dart';
import 'package:tquicker/widgets/custom_textformfield.dart';

class UpdateDriverPage extends StatefulWidget {
  const UpdateDriverPage({Key? key,required this.driverModel}) : super(key: key);
  final DriverListModel driverModel;

  @override
  _UpdateDriverPageState createState() => _UpdateDriverPageState();
}

class _UpdateDriverPageState extends State<UpdateDriverPage> {
  bool _isLoading=false;

  final TextEditingController _name=TextEditingController(text: '');
  final TextEditingController _email=TextEditingController(text: '');
  final TextEditingController _contactNo=TextEditingController(text: '');
  final TextEditingController _nationalId=TextEditingController(text: '');
  final TextEditingController _address=TextEditingController(text: '');
  final TextEditingController _password=TextEditingController(text: '');
  final TextEditingController _dlLicenseNo=TextEditingController(text: '');

  @override
  void initState(){
    super.initState();
    _name.text = widget.driverModel.name!;
    _email.text = widget.driverModel.email!;
    _contactNo.text = widget.driverModel.contactNo!;
    _nationalId.text = widget.driverModel.nationalId!;
    _address.text = widget.driverModel.contactAddress!;
    _dlLicenseNo.text = widget.driverModel.dlLincenceNo!;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnerController>(
        builder: (ownerController) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: Text('Update Driver',style: TextStyle(color: ThemeAndColor.textColor,fontWeight: FontWeight.w700,fontSize: customWidth(0.05))),
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
          CustomTextFormField(controller: _name, labelText: 'Full Name',textInputType: TextInputType.text),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _email, labelText: 'Email Address',textInputType: TextInputType.text),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _contactNo, labelText: 'Contact Number',textInputType: TextInputType.number),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _address, labelText: 'Address',textInputType: TextInputType.text),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _password, labelText: 'password',textInputType: TextInputType.text),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _nationalId, labelText: 'National ID',textInputType: TextInputType.number),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _dlLicenseNo, labelText: 'License No',textInputType: TextInputType.number),
          SizedBox(height: customWidth(0.04)),

          _isLoading
              ?spinCircle()
              :SolidButton(child: Text('Update',style: TextStyle(color: ThemeAndColor.textColor,fontWeight: FontWeight.bold,fontSize: customWidth(0.04))),
              onPressed: ()async{
                await _updateDriver(ownerController);
              },
              height: customWidth(0.1),
              width: customWidth(0.4),
              borderRadius: customWidth(0.02)),
        ],
      ),
    ),
  );

  Future<void> _updateDriver(OwnerController ownerController)async{
    setState(()=> _isLoading=true);
    Map dataMap;
    if(_password.text.isNotEmpty){

      dataMap={
        'vahicals_id':widget.driverModel.vahicalsId,
        'name': _name.text,
        'email':_email.text,
        'contact_no':_contactNo.text,
        'national_id':_nationalId.text,
        'contact_address':_contactNo.text,
        'password':_password.text,
        'dl_lincence_no':_dlLicenseNo.text};
    }else{
      dataMap={
        'vahicals_id':widget.driverModel.vahicalsId,
        'name': _name.text,
        'email':_email.text,
        'contact_no':_contactNo.text,
        'national_id':_nationalId.text,
        'contact_address':_contactNo.text,
        'dl_lincence_no':_dlLicenseNo.text};
    }

    await ownerController.updateDriver(dataMap,widget.driverModel.id!.toString()).then((result){
      if(result){
        setState(()=> _isLoading=false);
        showToast('Update Successful');
      }else{
        setState(()=> _isLoading=false);
        showToast('Failed');
      }
    });
  }
}
