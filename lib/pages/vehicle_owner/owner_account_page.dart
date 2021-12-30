import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tquicker/controller/owner_controller.dart';
import 'package:tquicker/static_variable/size_config.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';
import 'package:tquicker/widgets/button.dart';
import 'package:tquicker/widgets/custom_textformfield.dart';

class OwnerAccountPage extends StatefulWidget {
  const OwnerAccountPage({Key? key}) : super(key: key);

  @override
  _OwnerAccountPageState createState() => _OwnerAccountPageState();
}

class _OwnerAccountPageState extends State<OwnerAccountPage> {
  bool _isLoading=false;
  File? _imageFile;
  final TextEditingController _name=TextEditingController(text: '');
  final TextEditingController _contactNo=TextEditingController(text: '');
  final TextEditingController _email=TextEditingController(text: '');
  final TextEditingController _nationalId=TextEditingController(text: '');
  final TextEditingController _address=TextEditingController(text: '');
  final TextEditingController _passwprd=TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    OwnerController ownerController = Get.find();
    _name.text = ownerController.ownerModel.value.name!;
    _contactNo.text = ownerController.ownerModel.value.contactNo!;
    _email.text = ownerController.ownerModel.value.email!;
    _nationalId.text = ownerController.ownerModel.value.nationalId!;
    _address.text = ownerController.ownerModel.value.contactAddress!;
  }

  @override
  Widget build(BuildContext context){
    return GetBuilder<OwnerController>(
        builder: (ownerController) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: Text('Account',style: TextStyle(color: ThemeAndColor.textColor,fontWeight: FontWeight.w700,fontSize: customWidth(0.05))),
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
          //SizedBox(height: customWidth(0.05)),

          InkWell(
            onTap: ()=> _getImageFromGallery(),
            child: Container(
              child:_imageFile==null
                  ? ownerController.ownerModel.value.image!=null
                  ? ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: Image.network(ownerController.ownerModel.value.image!,
                      height: customWidth(0.3),
                      width: customWidth(0.3),
                      fit: BoxFit.cover))
                  : Icon(Icons.person,size: customWidth(0.3))
                  : ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: Image.file(_imageFile!,
                      height: customWidth(0.3),
                      width: customWidth(0.3),
                      fit: BoxFit.cover)),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                border: Border.all(color: Theme.of(context).primaryColor,width: 2),
              ),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(100)),
          ),
          SizedBox(height: customWidth(0.06)),

          CustomTextFormField(controller: _name, labelText: 'Name',textInputType: TextInputType.text),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _contactNo, labelText: 'Contact No',textInputType: TextInputType.number),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _email, labelText: 'Email',textInputType: TextInputType.emailAddress),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _nationalId, labelText: 'National Id',textInputType: TextInputType.number),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _address, labelText: 'Address',textInputType: TextInputType.text),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _passwprd, labelText: 'Change Password',textInputType: TextInputType.text),
          SizedBox(height: customWidth(0.06)),

          _isLoading
              ?spinCircle()
              :SolidButton(child: Text('Update',style: TextStyle(color: ThemeAndColor.textColor,fontWeight: FontWeight.bold,fontSize: customWidth(0.04))),
              onPressed: ()=>_updateProfile(ownerController),
              height: customWidth(0.1),
              width: customWidth(0.4),
              borderRadius: customWidth(0.02)),
        ],
      ),
    ),
  );

  Future<void> _getImageFromGallery()async{
    final ImagePicker _picker = ImagePicker();
    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
    if(_image!=null){
      _imageFile = File(_image.path);
      setState((){});
    }else {
      _imageFile=null;
      setState((){});
      showToast('Image not selected');
    }
  }

  void _updateProfile(OwnerController ownerController)async{
    setState(()=>_isLoading=true);
    Map dataMap;

    if(_imageFile!=null){
      final List<int> _imageBytes = _imageFile!.readAsBytesSync();
      final String _base64Image = base64Encode(_imageBytes);
      if(_passwprd.text.isNotEmpty){
        dataMap={
          'name':_name.text,
          'email':_email.text,
          'contact_no':_contactNo.text,
          'national_id':_nationalId.text,
          'contact_address':_address.text,
          'password':_passwprd.text,
          'image':_base64Image};
      }else{
        dataMap={
          'name':_name.text,
          'email':_email.text,
          'contact_no':_contactNo.text,
          'national_id':_nationalId.text,
          'contact_address':_address.text,
          'image':_base64Image};
      }
    }else{
      if(_passwprd.text.isNotEmpty){
        dataMap={
          'name':_name.text,
          'email':_email.text,
          'contact_no':_contactNo.text,
          'national_id':_nationalId.text,
          'contact_address':_address.text,
          'password':_passwprd.text};
      }else{
        dataMap={
          'name':_name.text,
          'email':_email.text,
          'contact_no':_contactNo.text,
          'national_id':_nationalId.text,
          'contact_address':_address.text};
      }
    }

    await ownerController.updateOwnerAccount(dataMap).then((result){
      if(result){
        setState(()=>_isLoading=false);
        showToast('Success');
      }else{
        setState(()=>_isLoading=false);
        showToast('Failed');
      }
    });

  }
}
