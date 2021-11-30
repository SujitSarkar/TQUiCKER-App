import 'package:flutter/material.dart';
import 'package:tquicker/static_variable/size_config.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';
import 'package:tquicker/widgets/button.dart';

class FinalPage extends StatelessWidget {
  FinalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: customWidth(-0.11),
              right: customWidth(-0.12),
              child: Opacity(
                opacity: 0.25,
                child: Image.asset(
                  "assets/images/car.png",
                  height: customWidth(1.1),
                  width: customWidth(1.1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: customWidth(0.03)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: customWidth(0.5),
                  ),
                  Text(
                    "Thank You for",
                    style: textTheme(context, 0.05, FontWeight.bold,
                        ThemeAndColor.themeColor),
                  ),
                  Text(
                    "Registration",
                    style: textTheme(context, 0.135, FontWeight.w900, null),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "We are coming soon....",
                      style: textTheme(context, 0.06, FontWeight.w800, null),
                    ),
                  ),
                  SizedBox(
                    height: customWidth(0.2),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SolidButton(
                        child: Text(
                          "Exit",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: customWidth(0.04),
                                  fontWeight: FontWeight.w800),
                        ),
                        onPressed: () {},
                        height: customWidth(0.1),
                        width: customWidth(0.4)),
                  ),
                  SizedBox(
                    height: customWidth(0.2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
