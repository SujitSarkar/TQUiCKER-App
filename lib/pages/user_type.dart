import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tquicker/pages/login_page.dart';
import 'package:tquicker/size_config.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';
import 'package:tquicker/widgets/grediant_bg.dart';
import 'package:tquicker/widgets/widget_user_type.dart';

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
                    bottom: customWidth(-0.12),
                    right: customWidth(-0.06),
                    child: Opacity(
                      opacity: 0.6,
                      child: Image.asset(
                        "assets/images/car.png",
                        height: customWidth(0.5),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(customWidth(0.08)),
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
                                    fontSize: customWidth(0.07)),
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
                height: customWidth(0.1),
              ),
              const WidgetUserType(
                img: "assets/images/customer.png",
                userType: "Customer",
              ),
              const WidgetUserType(
                img: "assets/images/vahicales owner.png",
                userType: "Vehicels Owner",
              ),
              const WidgetUserType(
                img: "assets/images/driver.png",
                userType: "Driver",
              ),
            ],
          ),
          Positioned(
            bottom: customWidth(1.43),
            right: customWidth(0.08),
            child: Container(
              height: customWidth(0.14),
              width: customWidth(0.14),
              padding: EdgeInsets.all(customWidth(0.018)),
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(customWidth(0.16))),
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


