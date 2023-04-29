import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

LatLng culcCenter(List<dynamic> points) {
  final List pointsList = points.map((e) => e.toJson()).toList();
  final int numRows = pointsList.length;
  final int numCols = pointsList[0].length;

  List<double> colSums = List.filled(numCols, 0);

  for (int i = 0; i < numCols; i++) {
    for (int j = 0; j < numRows; j++) {
      colSums[i] += pointsList[j][i];
    }
    colSums[i] /= numRows;
  }

  return LatLng.fromJson(colSums) ?? const LatLng(0, 0);
}


LatLng culcBestCamera(List<dynamic> points) {
  final List pointsList = points.map((e) => e.toJson()).toList();
  final int numRows = pointsList.length;
  final int numCols = pointsList[0].length;

  List<double> colSums = List.filled(numCols, 0);

  min_lat = pointsList[0][0];
  max_lat = pointsList[0][0];
  min_lon = pointsList[0][1];
  max_lon = pointsList[0][1];

  max_range = 0;
  for (int j = 0; j < numRows; j++) {
    if pointsList[j][0] > max_lat {
      max_lat = pointsList[j][0];
    }
    if pointsList[j][0] < min_lat {
      min_lat = pointsList[j][0];
    }
    if pointsList[j][0] > max_lon {
      max_lon = pointsList[j][1];
    }
    if pointsList[j][0] < min_lon {
      min_lon = pointsList[j][1];
    }
  }

  LatLng point1 = LatLng(min_lat, min_lon);
  LatLng point2 = LatLng(max_lat, max_lon);

  LatLngBounds bounds = LatLngBounds(
    southwest: LatLng(point1.latitude, point1.longitude),
    northeast: LatLng(point2.latitude, point2.longitude),
  );

  CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50.0);

  return bounds, cameraUpdate;
}