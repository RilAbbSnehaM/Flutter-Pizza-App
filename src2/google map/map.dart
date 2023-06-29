import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:geolocator/geolocator.dart';

class Map extends StatefulWidget {
  @override
  _Map createState() => _Map();
}

class _Map extends State<Map> {
  String googleApikey = "AIzaSyCM0jZy1XEDEOyhDqy3vOn_5p0qcUvDUQs";
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(27.6602292, 85.308027);
  String location = "Location Name:";

  @override
  void initState() {
    checkGps();
    super.initState();
  }

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    print("service status");
    print(servicestatus);
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        setState(() {
          //refresh the UI
        });

        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
      //refresh the UI
    });
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    long = position.longitude.toString();
    lat = position.latitude.toString();

    setState(() {
      //refresh UI
    });

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457

      long = position.longitude.toString();
      lat = position.latitude.toString();

      setState(() {
        //refresh UI on update
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Get GPS Location"), backgroundColor: Colors.redAccent),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(50),
        child: Column(children: [
          Column(
            children: [
              Text(servicestatus ? "GPS is Enabled" : "GPS is disabled."),
              Text(haspermission ? "GPS is Enabled" : "GPS is disabled."),
              Text("Longitude: $long", style: TextStyle(fontSize: 20)),
              Text(
                "Latitude: $lat",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          Container(
            width: 300,
            height: 300,
            color: Colors.amber,
            child: Stack(
              children: [
                GoogleMap(
                  //Map widget from google_maps_flutter package
                  zoomGesturesEnabled: true, //enable Zoom in, out on map
                  initialCameraPosition: CameraPosition(
                    //innital position in map
                    target: startLocation, //initial position
                    zoom: 14.0, //initial zoom level
                  ),
                  mapType: MapType.normal, //map type
                  onMapCreated: (controller) {
                    //method called when map is created
                    setState(() {
                      mapController = controller;
                    });
                  },
                  onCameraMove: (CameraPosition cameraPositiona) {
                    cameraPosition = cameraPositiona; //when map is dragging
                  },
                  onCameraIdle: () async {
                    //when map drag stops
                    /*  List<Placemark> placemarks = await placemarkFromCoordinates(
                      cameraPosition!.target.latitude,
                      cameraPosition!.target.longitude);
                  setState(() {
                    //get place name from lat and lang
                    location = placemarks.first.administrativeArea.toString() +
                        ", " +
                        placemarks.first.street.toString();
                  }); */
                  },
                ),
                Center(
                  //picker image on google map
                  child: Image.asset(
                    "assets/images/50.png",
                    width: 80,
                  ),
                ),
                Positioned(
                    //widget to display location name
                    bottom: 100,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Card(
                        child: Container(
                            padding: EdgeInsets.all(0),
                            width: MediaQuery.of(context).size.width - 40,
                            child: ListTile(
                              leading: Image.asset(
                                "assets/images/50.png",
                                width: 25,
                              ),
                              title: Text(
                                location,
                                style: TextStyle(fontSize: 18),
                              ),
                              dense: true,
                            )),
                      ),
                    ))
              ],
            ),
          ),
        ]),
      ),
    );

/*
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
      print(data);
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
 */
  }
}
