import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:map_artist/providers/map_provider.dart';
import 'record_button.dart';

class MapWidget extends ConsumerStatefulWidget {
  final LocationPermission permission;
  const MapWidget({super.key, this.permission=LocationPermission.denied});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends ConsumerState<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  late LocationPermission _permission;
  late Position _position;
  LatLng _center = const LatLng(35.6816, 139.7655);

  Future<void> _goToCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final GoogleMapController mapController = await _controller.future;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: _position.heading,
          target: LatLng(position.latitude, position.longitude),
          zoom: 14
        )
      )
    );
  }  

  Future<LatLng> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    _position = position;
    _center = LatLng(position.latitude, position.longitude);
    return _center;
  }

  @override
  void initState() {
    super.initState();
    _permission = widget.permission;
  }

  @override
  Widget build(BuildContext context) {
    List<LatLng> points = ref.watch(pointsNotifierProvider);

    if (_permission == LocationPermission.whileInUse || _permission == LocationPermission.always) {
      return FutureBuilder<Object>(
        future: _getCurrentLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                myLocationButtonEnabled:false,
                initialCameraPosition: CameraPosition(
                  target: _center, zoom: 14.0,
                ),
                polylines:{Polyline(
                  polylineId: PolylineId('polyline'),
                  color: Colors.orange,
                  width: 3,
                  points: points,
                )},
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: _goToCurrentLocation,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.my_location,
                  color: Colors.grey.shade800,
                ),
              ),
              bottomNavigationBar: const RecordButton(),
            );
          }
          else {
            return const Center(
              child: CircularProgressIndicator()
            );
          }
        }
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