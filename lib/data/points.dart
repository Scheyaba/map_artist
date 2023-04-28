import 'package:freezed_annotation/freezed_annotation.dart';

import 'latlng.dart';

part 'points.freezed.dart';
part 'points.g.dart';

@freezed
class ArtRecord with _$ArtRecord {
  factory ArtRecord(
    int key,
    PointsRecord value,
  ) = _ArtRecord;
}

@freezed
class PointsRecord with _$PointsRecord {
  factory PointsRecord({
    required String title,
    required List<LatLng> points,
  }) = _PointsRecord;

  factory PointsRecord.fromJson(Map<String, dynamic> json) => _$PointsRecordFromJson(json);
}