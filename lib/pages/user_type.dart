import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tquicker/pages/login_page.dart';
import 'package:tquicker/size_config.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';
import 'package:tquicker/widgets/grediant_bg.dart';

class UserTypePage extends StatelessWidget {
  const UserTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  GredientBG(
                    context: context,
                    height: 0.33,
                    child: Container(),
                  ),
                  Positioned(
                    bottom: customeWidth(-0.12),
                    right: customeWidth(-0.06),
                    child: Opacity(
                      opacity: 0.6,
                      child: Image.asset(
                        "assets/images/car.png",
                        height: customeWidth(0.5),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(customeWidth(0.08)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select User Type",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    color: ThemeAndColor.whiteColor,
                                    fontSize: customeWidth(0.07)),
                          ),
                          const Text(
                            "Coustomer . Owner . Driver",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: customeWidth(0.1),
              ),
              const widgetUserType(
                img: "assets/images/customer.png",
                userType: "Customer",
              ),
              const widgetUserType(
                img: "assets/images/vahicales owner.png",
                userType: "Vehicels Owner",
              ),
              const widgetUserType(
                img: "assets/images/driver.png",
                userType: "Driver",
              ),
            ],
          ),
          Positioned(
            bottom: customeWidth(1.43),
            right: customeWidth(0.08),
            child: Container(
              height: customeWidth(0.14),
              width: customeWidth(0.14),
              padding: EdgeInsets.all(customeWidth(0.018)),
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(customeWidth(0.16))),
              child: Image.asset(
                "assets/images/user.png",
              ),
            ),
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
