import 'package:flutter/material.dart';
import 'package:tquicker/widgets/custom_textformfield.dart';

class FinalPage extends StatelessWidget {
  FinalPage({Key? key}) : super(key: key);
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomTextFormField(
          controller: _controller,
          hintText: "Phone Number",
        ),
      ),
    );
  }
}
