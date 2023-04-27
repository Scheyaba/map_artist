import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:map_artist/theme/theme.dart';

part 'map_provider.g.dart';

// flutter pub run build_runner watch で CodeGenerating

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeData build() {
    return ThemeData.light();
  }
  void recordingState() {
    state = recordTheme;
  }
  void resetState() {
    state = ThemeData.light();
  }
}

@riverpod
class PointsNotifier extends _$PointsNotifier {
  @override
  List<LatLng> build() {
    return [
      LatLng(35.6841, 139.7614),
      LatLng(35.6844, 139.7703),
      LatLng(35.6815, 139.7645),
      LatLng(35.6890, 139.7670),
      LatLng(35.6818, 139.7684),
      LatLng(35.6841, 139.7614),
    ];
  }
  void addPointState(LatLng newPoint) {
    var newState = [...state];
    newState.add(newPoint);
    state = newState;
  }
}
