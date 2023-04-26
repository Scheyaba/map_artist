import 'package:flutter/material.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final LocationPermission permission;
  const MapWidget({super.key, this.permission=LocationPermission.denied});
  
  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  late LocationPermission permissionCopy;
  late Position _position;
  final LatLng _center = const LatLng(35.6816, 139.7655);

  Future<void> _goToCurrentLocation() async {
    final GoogleMapController mapController = await _controller.future;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: _position.heading,
          target: LatLng(_position.latitude, _position.longitude),
          zoom: 14
        )
      )
    );
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _position = position;
    });
  }

  @override
  void initState() {
    super.initState();
    permissionCopy = widget.permission;
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    if (permissionCopy == LocationPermission.whileInUse || permissionCopy == LocationPermission.always) {
      return Scaffold(
        body: GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled:false,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 14.0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _goToCurrentLocation,
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
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
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