import 'package:flutter/material.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';
import '../static_variable/size_config.dart';

class WidgetUserType extends StatelessWidget {
  const WidgetUserType({
    Key? key,
    required this.img,
    required this.userType,
    required this.onTap
  }) : super(key: key);

  final String img;
  final String userType;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: customWidth(0.06), vertical: customWidth(0.02)),
        padding: EdgeInsets.all(customWidth(0.03)),
        decoration: BoxDecoration(
            color: ThemeAndColor.buttonBGColor,
            border: Border.all(color: ThemeAndColor.themeColor, width: 1.3),
            borderRadius: BorderRadius.circular(customWidth(0.04))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: customWidth(0.13),
              width: customWidth(0.13),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: ThemeAndColor.buttonBGColor,
                  border:
                  Border.all(color: ThemeAndColor.themeColor, width: 1.3),
                  borderRadius: BorderRadius.circular(customWidth(0.4))),
              child: Image.asset(
                img,
                fit: BoxFit.contain
              ),
            ),
            SizedBox(width: customWidth(0.04)),
            Text(
              userType,
              style: TextStyle(
                  fontSize: customWidth(0.05), fontWeight: FontWeight.w500)
            )
          ],
        ),
      ),
    );
  }
}