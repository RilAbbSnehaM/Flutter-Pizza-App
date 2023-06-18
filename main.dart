// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:project/src2/screen/Homescreen.dart';
import 'package:project/src2/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Home Screen',

      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const ProductScreen(),
    );
  }
}
