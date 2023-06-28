import 'package:flutter/material.dart';
import 'package:project/src2/screen/OrderScreen.dart';
import 'package:project/src2/screen/Wel.dart';

import 'package:project/src2/screen/sign%20in%20.dart';

import 'Address.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<Profile> {
  static const List<String> userOptions = [
    "Your Orders",
    "Your Address",
    "Your Coupons",
    "Log Out",
  ];

  List<String> userOrders = [
    "Pepperoni Pizza",
    "Margherita Pizza",
    "BBQ Chicken Pizza",
    "Vegetarian Pizza",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 242, 239, 230),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: const DecorationImage(
                  image: AssetImage('assets/images/profile.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {
                    handleEditProfile();
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 1, 1, 1),
                    size: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: userOptions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 235, 95, 95),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          handleUserOptionTap(index);
                        },
                        child: Text(
                          userOptions[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleUserOptionTap(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderScreen(),
          ),
        );
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddressPage()));
        print("Your Address");
        break;
      case 2:
        print("Your Coupons");
        break;
      case 3:
        print("Log Out");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
        );
        break;
    }
  }

  void handleEditProfile() {
    print("Edit profile");
  }
}
