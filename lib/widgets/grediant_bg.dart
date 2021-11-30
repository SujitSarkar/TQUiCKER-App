import 'package:flutter/material.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';

class GradientBG extends StatelessWidget {
  const GradientBG({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.centerLeft,
        colors: [
          ThemeAndColor.rightGradientColor,
          ThemeAndColor.leftGradientColor
        ],
      )),
    );
  }
}
