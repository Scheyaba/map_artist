import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import './components/map_position.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(37.4213114, -122.084869);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.map),
        title: const Text('MapPage'),
        centerTitle: true,
        elevation: 10,
      ),
      body: FutureBuilder<Object>(
        future: determinePosition(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GoogleMap(
              onMapCreated: _onMapCreated,
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 14.0,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}')
            );
          } else {
            return const Center(
              child: CircularProgressIndicator()
            );
          }
        }
      ),
      );
  }
}
