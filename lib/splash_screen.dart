import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tquicker/pages/login_page.dart';
import 'package:tquicker/pages/user_type.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';

import 'controller/public_controller.dart';
import 'size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Get.offAll(() => UserTypePage()));
  }

  @override
  Widget build(BuildContext context) {
    final PublicController publicController = Get.put(PublicController());
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Container(
        alignment: Alignment.center,
        color: ThemeAndColor.whiteColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text.rich(
            TextSpan(
                text: "T",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: ThemeAndColor.secondaryColor),
                children: [
                  TextSpan(
                    text: "QUICKER",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: ThemeAndColor.themeColor),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
