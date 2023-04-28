// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PointsRecord _$$_PointsRecordFromJson(Map<String, dynamic> json) =>
    _$_PointsRecord(
      title: json['title'] as String,
      points: json['points'] as List<dynamic>,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_PointsRecordToJson(_$_PointsRecord instance) =>
    <String, dynamic>{
      'title': instance.title,
      'points': instance.points,
      'createdAt': instance.createdAt.toIso8601String(),
    };
