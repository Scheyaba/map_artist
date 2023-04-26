import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final LocationPermission permission;
  const MapWidget({super.key, this.permission=LocationPermission.denied});
  
  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(35.6816, 139.7655);
  late LocationPermission permissionCopy;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _goToNowlocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: position.heading,
          target: LatLng(position.latitude, position.longitude),
          zoom: 14
        )
      )
    );
  }

  @override
  void initState() {
    super.initState();
    permissionCopy = widget.permission;
  }

  @override
  Widget build(BuildContext context) {
    if (permissionCopy == LocationPermission.whileInUse || permissionCopy == LocationPermission.always) {
      return Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled:false,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 14.0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _goToNowlocation,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.my_location,
            color: Colors.grey.shade800,
          ),
        ),
      );
    }
    else{
      return Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          zoomControlsEnabled: false,
          myLocationEnabled: false,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 14.0,
          )
        ),
      );
    }
  }
}