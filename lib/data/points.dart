import 'package:freezed_annotation/freezed_annotation.dart';

// flutter pub run build_runner watch で CodeGenerating

//import 'latlng.dart';[削除予定]


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
    required List points,
    required DateTime createdAt,
  }) = _PointsRecord;

  factory PointsRecord.fromJson(Map<String, dynamic> json) => _$PointsRecordFromJson(json);
}