import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TQUiCKER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white
      ),
      home: const Scaffold(),
    );
  }
}

