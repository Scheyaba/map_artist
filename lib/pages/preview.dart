import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:map_artist/data/points.dart';
import 'package:map_artist/utils.dart';

class Preview extends StatelessWidget {
  const Preview({super.key, required this.record});
  final ArtRecord record;

  @override
  Widget build(BuildContext context) {
    final points = record.value.points.toList();
    final List<LatLng?> pointsListNullable = points.map((e) => LatLng.fromJson(e)).toList();
    final List<LatLng> pointsList = [for (var value in pointsListNullable) if (value != null) value];
    final LatLng center = culcCenter(pointsList);
    
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        leading: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: const Icon(Icons.arrow_back, color: Colors.black,),),
        title: Text(record.value.title),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.delete, color: Colors.black,),)
        ],
      ),

      body: GoogleMap(
        zoomControlsEnabled: false,
        myLocationEnabled: false,
        initialCameraPosition: CameraPosition(
          target: center,
          zoom: 14.0,
        ),
        polylines:{Polyline(
          polylineId: const PolylineId('result polyline'),
          color: Colors.orange,
          width: 3,
          points: pointsList,
        )},
      )
    );
  }
}