import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';
import 'package:tquicker/widgets/grediant_bg.dart';

import '../size_config.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  GredientBG(
                    context: context,
                    height: 0.33,
                    child: Container(),
                  ),
                  Positioned(
                    bottom: customWidth(0),
                    right: customWidth(0),
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.asset(
                        "assets/images/user.png",
                        height: customWidth(0.6),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: customWidth(0.08),
                        vertical: customWidth(0.04)),
                    child: Text(
                      "Log or Registration",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: customWidth(0.05)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: customWidth(0.1),
              ),
              // const widgetUserType(
              //   img: "assets/images/customer.png",
              //   userType: "Customer",
              // ),
              // const widgetUserType(
              //   img: "assets/images/vahicales owner.png",
              //   userType: "Vehicels Owner",
              // ),
              // const widgetUserType(
              //   img: "assets/images/driver.png",
              //   userType: "Driver",
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
