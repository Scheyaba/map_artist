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
  final LatLng _center = const LatLng(37.4213114, -122.084869);
  late LocationPermission permissionCopy;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    permissionCopy = widget.permission;
  }

  @override
  Widget build(BuildContext context) {
    final GoogleMap map;
    if (permissionCopy == LocationPermission.whileInUse || permissionCopy == LocationPermission.always) {
      map = GoogleMap(
        onMapCreated: _onMapCreated,
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 14.0,
        ),
      );
    }
    else{
      map = GoogleMap(
        onMapCreated: _onMapCreated,
        zoomControlsEnabled: false,
        myLocationEnabled: false,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 14.0,
        )
      );
    }
    return map;
  }
}