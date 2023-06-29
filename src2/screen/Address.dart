import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String googleApikey = "AIzaSyCM0jZy1XEDEOyhDqy3vOn_5p0qcUvDUQs";
  double latitude = 27.666994;
  double longitude = 85.309289;

  String address = "";

  @override
  void initState() {
    convertToAddress(latitude, longitude, googleApikey);
    super.initState();
  }

  TextEditingController _addressController = TextEditingController();
  List<String> _suggestions = [];

  convertToAddress(double lat, double long, String apikey) async {
    final apiKey = 'AIzaSyCM0jZy1XEDEOyhDqy3vOn_5p0qcUvDUQs';
    final apiUrl =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$apikey';

    final response = await http.get(Uri.parse(apiUrl), headers: {
      'Authorization': 'Bearer $apiKey',
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _suggestions = List<String>.from(data['suggestions']);
      });
    } else {
      // Handle error response
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Get Address from Google Map API"),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                "Latitude: $latitude",
                style: TextStyle(fontSize: 25),
              ),
              Text("Longitude: $longitude", style: TextStyle(fontSize: 25)),
              Text(
                "Formatted Address: $address",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
