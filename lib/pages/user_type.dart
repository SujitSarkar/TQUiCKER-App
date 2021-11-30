import 'package:flutter/material.dart';
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
                  GradientBG(height: customWidth(0.65)),
                  ///Car
                  Positioned(
                    bottom: customWidth(-0.11),
                    right: customWidth(-0.07),
                    child: Opacity(
                      opacity: 0.6,
                      child: Image.asset(
                        "assets/images/car.png",
                        height: customWidth(0.45),
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
                                    fontSize: customWidth(0.065),fontWeight: FontWeight.bold),
                          ),
                           Text(
                            "Customer . Owner . Driver",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,fontSize: customWidth(0.035)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: customWidth(0.1)),
              const WidgetUserType(
                img: "assets/images/customer.png",
                userType: "Customer",
              ),
              const WidgetUserType(
                img: "assets/images/vahicales owner.png",
                userType: "Vehicles Owner",
              ),
              const WidgetUserType(
                img: "assets/images/driver.png",
                userType: "Driver",
              ),
            ],
          ),

          ///User Circle
          Positioned(
            top: customWidth(0.57),
            right: customWidth(0.08),
            child: Container(
              height: customWidth(0.15),
              width: customWidth(0.15),
              padding: EdgeInsets.all(customWidth(0.018)),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
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


