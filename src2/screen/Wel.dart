import 'package:flutter/material.dart';
import 'package:project/src2/screen/sign%20in%20.dart';

import 'login.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ch.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 40),
            Text(
              'Welcome to Pizza Delivery',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Order your favorite pizza and get it delivered\nright to your doorstep!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignUpScreen()));
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
