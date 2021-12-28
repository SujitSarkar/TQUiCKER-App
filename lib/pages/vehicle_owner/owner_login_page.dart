import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tquicker/controller/owner_controller.dart';
import 'package:tquicker/pages/vehicle_owner/add_vehicle_page.dart';
import 'package:tquicker/pages/vehicle_owner/owner_home_page.dart';
import 'package:tquicker/pages/vehicle_owner/owner_registration_page.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';
import 'package:tquicker/widgets/button.dart';
import 'package:tquicker/widgets/custom_textformfield.dart';
import 'package:tquicker/widgets/grediant_bg.dart';
import '../../static_variable/size_config.dart';

class OwnerLoginPage extends StatefulWidget {
  const OwnerLoginPage({Key? key}) : super(key: key);

  @override
  State<OwnerLoginPage> createState() => _OwnerLoginPageState();
}

class _OwnerLoginPageState extends State<OwnerLoginPage> {
  final TextEditingController _username=TextEditingController(text: '');
  final TextEditingController _password=TextEditingController(text: '');
  bool _isLoading=false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnerController>(
      builder: (publicController) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      GradientBG(height: customWidth(0.6)),
                      ///Car
                      Positioned(
                        bottom: customWidth(-0.11),
                        right: customWidth(-0.06),
                        child: Opacity(
                          opacity: 0.3,
                          child: Image.asset(
                            "assets/images/car.png",
                            height: customWidth(0.45),
                          ),
                        ),
                      ),
                      Positioned(
                        left: customWidth(0.05),
                        bottom: customWidth(0.03),
                        child: Text(
                          "Login or Registration",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,fontSize: customWidth(0.04)),
                        ),
                      ),
                    ],
                  ),

                  ///TextField
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: customWidth(0.04)),
                    child: Column(
                      children: [
                        CustomTextFormField(controller: _username, hintText: 'Username (Phone or Email)',textInputType: TextInputType.text),
                        SizedBox(height: customWidth(0.08)),
                        CustomTextFormField(controller: _password, hintText: 'Enter Your Password',textInputType: TextInputType.text),
                        SizedBox(height: customWidth(0.04)),

                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.headline3!.copyWith(
                              fontSize: customWidth(0.04),
                              fontWeight: FontWeight.w600),

                            children: <TextSpan>[
                              const TextSpan(text: 'Don\'t have account?'),
                              TextSpan(text: ' register',
                                  recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>const OwnerRegistrationPage()),
                                  style: TextStyle(color: Theme.of(context).primaryColor)),
                            ],
                          ),
                        ),
                        SizedBox(height: customWidth(0.15)),

                        _isLoading
                            ?spinCircle()
                            :SolidButton(child: Text('Send',style: TextStyle(color: ThemeAndColor.textColor,fontWeight: FontWeight.bold,fontSize: customWidth(0.04))),
                            onPressed: ()async{
                                if(_username.text.isNotEmpty&&_password.text.isNotEmpty){
                                  _loginUser(publicController);
                                }else{showToast('Field can\'t be empty');}
                            },
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
    );
  }

  Future<void> _loginUser(OwnerController publicController)async{
    setState(()=>_isLoading=true);
    Map dataMap={
      'username':_username.text,
      'password':_password.text,
    };
    await publicController.getOwnerLoginData(dataMap).then((result){
      if(result){
        setState(()=>_isLoading=false);
        Get.offAll(()=>const OwnerHomePage());
      }else{
        setState(()=>_isLoading=false);
        //showToast('Registration Failed!');
      }
    });
  }
}
