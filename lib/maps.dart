import 'dart:async';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:ui' as ui;

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

@override
State<Maps> createState() => _MapsState();

class _MapsState extends State<Maps> {
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController newGoogleMapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.821430, 10.634422),
    zoom: 14.4746,
  );
   late CameraPosition posit;

  BitmapDescriptor? customIcon;

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  late Position cl;
  var lat, amp;
  late Set<Marker> marker = {
    Marker(
      markerId: MarkerId("olym"),
      infoWindow: InfoWindow(title: "olymgym"),
      position: LatLng(37.4255,  10.634422),
    )
  };

  setmarker() async {
    final Uint8List markerIcon = await getBytesFromAsset('images/ahmedkhouaja.png', 50);

    marker.add(
      Marker(
          markerId: MarkerId("olym"),
          infoWindow: InfoWindow(title: "olymgym"),
          position: LatLng(35.821430,  10.634422),
          
          icon: BitmapDescriptor.fromBytes(markerIcon)),
    );
   // marker.add(
   //   Marker(
       //   markerId: MarkerId("olymseka"),
     //     infoWindow: InfoWindow(title: "olympseka"),
       //   position: LatLng(37.4255, -122.0855),
     //      icon: customIcon ?? BitmapDescriptor.defaultMarker,
   //       icon: BitmapDescriptor.fromBytes(markerIcon)),
 //  );
    //  ,position: LatLng(37.4255, -122.0855)));

    //   await BitmapDescriptor.fromAssetImage(
      //   ImageConfiguration(size: Size(48, 48)), '/images/gy.png'
   //   ),

     marker.add(Marker(
         markerId: MarkerId("olym"),
       infoWindow: InfoWindow(title: "olymgym"),
  //   icon: customIcon,
     position: LatLng(37.4253, -122.0854)));
  }

  pos() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    cl = await Geolocator.getCurrentPosition().then((value) => value);
    amp = cl.latitude;
    lat = cl.longitude;
  //                   posit = CameraPosition(
  //   target: LatLng(22.2, 25.5),
  //    zoom: 14.4746,

    // );

   // setState(() {});
  }

  @override
  void initState() {
    loadImg();
    pos();
    setmarker();
     marker = Set.from([]);

    super.initState();
  }

  void loadImg() async {
    await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(12, 12)), 'images/ahmedkhouaja.png')
        .then((d) {
      customIcon = d;
    });
     BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
     ImageConfiguration(),
     "assets/images/bike.png",
);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Text("sign out"),
              IconButton(
                  onPressed: () async {
                //    await FirebaseAuth.instance.signOut();
                  //  Navigator.push(context,
                    //    MaterialPageRoute(builder: (context) => MyLogin()));
                  },
                  icon: Icon(Icons.exit_to_app))
            ],
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: GoogleMap(
            markers: marker,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(height: 30),
          Center(
              child: Row(children: [
            SizedBox(
              width: 30,
            ),
           
          ]))
        ],
      ),
    );
  }
}
