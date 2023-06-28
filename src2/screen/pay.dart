import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String googleApikey = "AIzaSyCM0jZy1XEDEOyhDqy3vOn_5p0qcUvDUQs";
  double latitude = 27.666994;
  double longitude = 85.309289;

  String address = "";

  @override
  void initState() {
    convertToAddress(
        latitude, longitude, googleApikey); //call convert to address
    super.initState();
  }

  convertToAddress(double lat, double long, String apikey) async {
    Dio dio = Dio(); //initilize dio package
    String apiurl =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$apikey";

    Response response = await dio.get(apiurl); //send get request to API URL

    if (response.statusCode == 200) {
      //if connection is successful
      Map data = response.data; //get response data
      if (data["status"] == "OK") {
        //if status is "OK" returned from REST API
        if (data["results"].length > 0) {
          //if there is atleast one address
          Map firstresult = data["results"][0]; //select the first address

          address = firstresult["formatted_address"];

          setState(() {});
        }
      } else {
        print(data["error_message"]);
      }
    } else {
      print("error while fetching geoconding data");
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
