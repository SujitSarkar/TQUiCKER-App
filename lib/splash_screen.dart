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
    // Future.delayed(const Duration(seconds: 3))
    //     .then((value) => Get.offAll(() => const UserTypePage()));
  }

  @override
  Widget build(BuildContext context) {
    final PublicController publicController = Get.put(PublicController());
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',height: customWidth(0.35)),
            SizedBox(height: customWidth(0.02)),
            Text('An Online Transportation Service')
          ],
        )
      ),
    );
  }
}
