import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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
    ];
  }

  void addPointState(LatLng newPoint) {
    var newState = [...state];
    newState.add(newPoint);
    state = newState;
  }
  void resetPointState() {
    state = [
    ];
  }
}
