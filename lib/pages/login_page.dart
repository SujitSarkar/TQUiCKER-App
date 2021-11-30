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
                alignment: Alignment.center,
                children: [
                  GradientBG(height: customWidth(0.65)),
                  ///Car
                  Positioned(
                    bottom: customWidth(0.0),
                    right: customWidth(0.0),
                    child: Opacity(
                      opacity: 0.6,
                      child: Image.asset(
                        "assets/images/user.png",
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

            ],
          ),
        ],
      ),
    );
  }
}
