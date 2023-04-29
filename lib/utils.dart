import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' as math;

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


double culcBestCamera(List<dynamic> points) {
  final List pointsList = points.map((e) => e.toJson()).toList();
  final int numRows = pointsList.length;

  double minLat = pointsList[0][0];
  double maxLat = pointsList[0][0];
  double minLon = pointsList[0][1];
  double maxLon = pointsList[0][1];

  for (int j = 0; j < numRows; j++) {
    if (pointsList[j][0] > maxLat) {
      maxLat = pointsList[j][0];
    }
    if (pointsList[j][0] < minLat) {
      minLat = pointsList[j][0];
    }
    if (pointsList[j][0] > maxLon) {
      maxLon = pointsList[j][1];
    }
    if (pointsList[j][0] < minLon) {
      minLon = pointsList[j][1];
    }
  }

  LatLng point1 = LatLng(minLat, minLon);
  LatLng point2 = LatLng(maxLat, maxLon);

  LatLngBounds bounds = LatLngBounds(
    southwest: LatLng(point1.latitude, point1.longitude),
    northeast: LatLng(point2.latitude, point2.longitude),
  );

  double mapWidth = 350;
  double mapHeight = 350;
  double latDistance = (bounds.northeast.latitude - bounds.southwest.latitude).abs();
  double lngDistance = (bounds.northeast.longitude - bounds.southwest.longitude).abs();
  double delta = math.max(latDistance, lngDistance);

  double zoomLevel = 0;
  while ((256 * math.pow(2, zoomLevel)) < delta * math.min(mapWidth, mapHeight)) {
    zoomLevel++;
  }
  return zoomLevel;
}