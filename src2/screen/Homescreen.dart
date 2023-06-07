// ignore_for_file: file_names

import 'package:flutter/material.dart';

void main() {
  runApp(const Homescreen());
}

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homescreen"),
        leading: const Icon(Icons.menu, size: 40, color: Colors.amber),
        actions: const [
          Icon(Icons.card_travel),
          Icon(Icons.safety_check),
          Icon(Icons.notifications),
          Icon(Icons.access_alarm),
          Icon(Icons.account_circle),
          Icon(Icons.abc),
          Icon(Icons.ac_unit),
          Icon(Icons.alt_route),
          Icon(Icons.add_a_photo_rounded),
          Icon(Icons.add_call),
          Icon(Icons.animation),
          Icon(Icons.add_location_rounded),
          Icon(Icons.announcement_rounded),
          Icon(Icons.battery_full),
          Icon(Icons.chat)
        ],
        backgroundColor: (const Color.fromARGB(138, 43, 45, 143)),
      ),
    );
  }
}
