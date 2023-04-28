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