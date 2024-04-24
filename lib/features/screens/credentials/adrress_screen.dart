import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:nectar/features/const/color.dart';
import 'package:nectar/features/const/string.dart';
import 'package:nectar/features/screens/credentials/select_location.dart';
import 'package:nectar/features/widgets/custom_button.dart';
import 'package:nectar/features/widgets/methods/methods.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    // getIcons();

    _markers.clear();
    super.initState();
  }

  late GoogleMapController _controller;
  Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              setState(() {
                _controller = controller;
              });
            },
            onTap: _onMapTapped,
            zoomControlsEnabled: false,
            markers: _markers,
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              zoom: 13,
              target: LatLng(21.204234, 72.859516),
            ),
          ),
          _isUserClickedOnMap == true
              ? Positioned(
                  bottom: 10,
                  right: 10,
                  left: 10,
                  child: CustomButton(
                      title: 'Set Address',
                      color: ColorConst.primaryColor,
                      onTap: () {
                        setAddress(latitude, longitude);
                      }))
              : Container(),
        ],
      ),
    );
  }

  int keyIndex = 1;
  bool _isUserClickedOnMap = false;
  double latitude = 21.204234;
  double longitude = 72.859516;

  Future<void> _onMapTapped(LatLng position) async {
    setState(() {
      _isUserClickedOnMap = true;
    });
    List<Marker> marker = [];
    marker.add(Marker(
      markerId: MarkerId(keyIndex.toString()),
      position: LatLng(position.latitude, position.longitude),
      infoWindow: InfoWindow(
          title: StringConst.setAddress,
          onTap: () {
            print('tapped');
            setAddress(position.latitude, position.longitude);
          }),
    ));
    latitude = position.latitude;
    longitude = position.longitude;

    setState(() {
      _markers = marker.toSet();
    });

    print('=====>   Marker: $_markers');
  }

  void setAddress(double latitude, double longitude) async {
    var box = await Hive.openBox('location');

    await GeocodingPlatform.instance
        ?.placemarkFromCoordinates(latitude, longitude)
        .then((value) async {
      print("value address: ===> ");

      String address =
          '${value.first.street}, ${value.first.subLocality}, ${value.first.locality}, ${value.first.administrativeArea}, ${value.first.country}, ${value.first.postalCode}';

      await box.put('1', {
        'latitude': latitude,
        'longitude': longitude,
        'address': address,
      }).then((value) async {
        print("Tapped and success to store inside the hive");
        nextScreenReplace(context: context, nextScreen: SelectLocation());
      });
    });
  }
}
