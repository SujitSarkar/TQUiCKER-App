import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tquicker/pages/vehicle_owner/add_vehicle_page.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';
import 'package:tquicker/widgets/button.dart';
import 'package:tquicker/widgets/custom_textformfield.dart';
import 'package:tquicker/widgets/grediant_bg.dart';

import '../../static_variable/size_config.dart';

class OwnerRegistrationPage extends StatelessWidget {
  OwnerRegistrationPage({Key? key}) : super(key: key);

  final TextEditingController _name=TextEditingController(text: '');
  final TextEditingController _otp=TextEditingController(text: '');
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  GradientBG(height: customWidth(0.6)),
                  ///User
                  Positioned(
                    bottom: customWidth(0.03),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/user.png",
                          height: customWidth(0.2),
                        ),
                        Text('Upload Your Photo',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold ,fontSize: customWidth(0.04)),)
                      ],
                    ),
                  ),

                  ///Header Section
                  Positioned(
                    left: customWidth(0.02),
                    top: customWidth(0.03),
                    child: SafeArea(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              _scaffoldKey.currentState!.openDrawer();
                            },
                              child: Icon(CupertinoIcons.bars,color: Colors.grey.shade200)),
                          Text(
                            "Complete Your Registration",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,fontSize: customWidth(0.045)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              ///TextField
              Padding(
                padding: EdgeInsets.symmetric(horizontal: customWidth(0.04)),
                child: Column(
                  children: [
                    CustomTextFormField(controller: _name, hintText: 'Full Name (ex: Mr. Enan)'),
                    SizedBox(height: customWidth(0.08)),
                    CustomTextFormField(controller: _otp, hintText: 'Enter OTP'),
                    SizedBox(height: customWidth(0.15)),

                    SolidButton(child: Text('Send',style: TextStyle(color: ThemeAndColor.textColor,fontWeight: FontWeight.bold,fontSize: customWidth(0.04))),
                      onPressed: ()=>Get.to(()=> AddVehiclePage()),
                      height: customWidth(0.1),
                      width: customWidth(0.4),
                      borderRadius: customWidth(0.02)),
                  ],
                ),
              ),
              Container()
            ],
          ),
        ],
      ),
    );
  }
}
