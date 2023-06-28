import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project/src2/screen/home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController LnameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void dispose() {
    fnameController.dispose();
    LnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login(String fname, String Lname, String email, String password) async {
    String fname = fnameController.text;
    String Lname = LnameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    print('fname: $fname');
    print('Lname: $Lname');

    print('Email: $email');
    print('Password: $password');

    try {
      final response = await post(
          Uri.parse('http://ankursingh.xyz/api/registerUser.php'),
          body: {
            "fname": fname,
            "Lname": Lname,
            "email": email,
            "password": password
          });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());
        print(data);
        print('Login successfully');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductScreen()),
        );
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                controller: fnameController,
                decoration: const InputDecoration(
                  labelText: 'Fname',
                  border: OutlineInputBorder(),
                )),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: LnameController,
                decoration: const InputDecoration(
                  labelText: 'Lname',
                  border: OutlineInputBorder(),
                )),
            SizedBox(
              height: 40,
            ),
            TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                )),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                login(
                    fnameController.text.toString(),
                    LnameController.text.toString(),
                    emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 248, 166, 25),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text('Login'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
