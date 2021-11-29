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
                    bottom: customeWidth(0),
                    right: customeWidth(0),
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.asset(
                        "assets/images/user.png",
                        height: customeWidth(0.6),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: customeWidth(0.08),
                        vertical: customeWidth(0.04)),
                    child: Text(
                      "Log or Registration",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: customeWidth(0.05)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: customeWidth(0.1),
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

class widgetUserType extends StatelessWidget {
  const widgetUserType({
    Key? key,
    required this.img,
    required this.userType,
  }) : super(key: key);

  final String img;
  final String userType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(LoginPage()),
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: customeWidth(0.06), vertical: customeWidth(0.02)),
        padding: EdgeInsets.all(customeWidth(0.03)),
        decoration: BoxDecoration(
            color: ThemeAndColor.buttonBGColor,
            border: Border.all(color: ThemeAndColor.themeColor, width: 1.3),
            borderRadius: BorderRadius.circular(customeWidth(0.04))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: customeWidth(0.15),
              width: customeWidth(0.15),
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: ThemeAndColor.buttonBGColor,
                  border:
                      Border.all(color: ThemeAndColor.themeColor, width: 1.3),
                  borderRadius: BorderRadius.circular(customeWidth(0.4))),
              child: Image.asset(
                img,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              userType,
              style: TextStyle(
                  fontSize: customeWidth(0.05), fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
