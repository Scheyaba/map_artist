import 'package:geolocator/geolocator.dart';
import 'dart:async';

List<Position> locationList = [];
late StreamSubscription<Position> subscription;

// 削除予定

void startGettingLocationUpdates() async {
  final stream = Geolocator.getPositionStream();
  subscription = stream.listen((Position position) {
    locationList.add(position);
  });
}

void pauseGettingLocationUpdates() {
  if (subscription != null) {
    subscription.pause();
  }
}

void resumeGettingLocationUpdates() {
  if(subscription.isPaused) {
    subscription.resume();
  }
}

void stopGettingLocationUpdates() {
  if (subscription != null) {
    subscription.cancel();
  }
}