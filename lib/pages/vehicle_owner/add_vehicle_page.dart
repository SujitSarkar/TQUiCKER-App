import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tquicker/pages/home_page.dart';
import 'package:tquicker/static_variable/size_config.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';
import 'package:tquicker/widgets/button.dart';
import 'package:tquicker/widgets/custom_textformfield.dart';
import 'package:tquicker/widgets/drawer_widget.dart';

class AddVehiclePage extends StatelessWidget {
  AddVehiclePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey();

  final TextEditingController _type=TextEditingController(text: '');
  final TextEditingController _metro=TextEditingController(text: '');
  final TextEditingController _serial=TextEditingController(text: '');
  final TextEditingController _number=TextEditingController(text: '');
  final TextEditingController _model=TextEditingController(text: '');
  final TextEditingController _openOrCovurd=TextEditingController(text: '');
  final TextEditingController _brta=TextEditingController(text: '');
  final TextEditingController _numberPlate=TextEditingController(text: '');
  final TextEditingController _nid=TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: (){
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Icon(CupertinoIcons.bars,color: Colors.grey,size: customWidth(0.08))),
        title: Text('ADD Vehicles',style: TextStyle(color: ThemeAndColor.textColor,fontWeight: FontWeight.w700,fontSize: customWidth(0.05))),
        titleSpacing: -10,
      ),
      body: _bodyUI(),
    );
  }

  Widget _bodyUI()=>SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: customWidth(0.04)),
      child: Column(
        children: [
          SizedBox(height: customWidth(0.05)),
          CustomTextFormField(controller: _type, hintText: 'Select Vehicles Type'),
          SizedBox(height: customWidth(0.06)),

          Row(
            children: [
              Expanded(child: CustomTextFormField(controller: _metro, hintText: 'Matro')),
              SizedBox(width: customWidth(0.04)),
              Expanded(child: CustomTextFormField(controller: _serial, hintText: 'Serial')),
              SizedBox(width: customWidth(0.04)),
              Expanded(child: CustomTextFormField(controller: _number, hintText: 'Number')),
            ],
          ),
          SizedBox(height: customWidth(0.06)),

          Row(
            children: [
              Expanded(child: CustomTextFormField(controller: _model, hintText: 'Model')),
              SizedBox(width: customWidth(0.04)),
              Expanded(child: CustomTextFormField(controller: _openOrCovurd, hintText: 'Open/Covurd')),
            ],
          ),
          SizedBox(height: customWidth(0.06)),

          CustomTextFormField(controller: _brta, hintText: 'BRTA Document Upload'),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _numberPlate, hintText: 'Vehicles Image With Number Plate'),
          SizedBox(height: customWidth(0.06)),
          CustomTextFormField(controller: _nid, hintText: 'NID'),
          SizedBox(height: customWidth(0.2)),

          SolidButton(child: Text('Send',style: TextStyle(color: ThemeAndColor.textColor,fontWeight: FontWeight.bold,fontSize: customWidth(0.04))),
              onPressed: ()=>Get.to(()=>const HomePage()),
              height: customWidth(0.1),
              width: customWidth(0.4),
              borderRadius: customWidth(0.02)),
        ],
      ),
    ),
  );
}
