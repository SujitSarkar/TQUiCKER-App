import 'package:flutter/material.dart';
import 'package:tquicker/static_variable/theme_and_color.dart';

class GradientBG extends StatelessWidget {
  const GradientBG(
      {Key? key,
      required this.context,
      required this.height,
      required this.child})
      : super(key: key);

  final BuildContext context;
  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * height,
      decoration: const BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.centerLeft,
        colors: [
          ThemeAndColor.rightGradientColor,
          ThemeAndColor.leftGradientColor
        ],
      )),
      child: child,
    );
  }
}
