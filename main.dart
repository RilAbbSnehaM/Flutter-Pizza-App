import 'package:flutter/material.dart';
import 'package:project/src2/screen/Wel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Screen',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: WelcomePage(),
    );
  }
}
