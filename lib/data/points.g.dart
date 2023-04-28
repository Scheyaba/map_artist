// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PointsRecord _$$_PointsRecordFromJson(Map<String, dynamic> json) =>
    _$_PointsRecord(
      title: json['title'] as String,
      points: (json['points'] as List<dynamic>)
          .map((e) => LatLng.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PointsRecordToJson(_$_PointsRecord instance) =>
    <String, dynamic>{
      'title': instance.title,
      'points': instance.points,
    };
