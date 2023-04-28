// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'points.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArtRecord {
  int get key => throw _privateConstructorUsedError;
  PointsRecord get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArtRecordCopyWith<ArtRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtRecordCopyWith<$Res> {
  factory $ArtRecordCopyWith(ArtRecord value, $Res Function(ArtRecord) then) =
      _$ArtRecordCopyWithImpl<$Res, ArtRecord>;
  @useResult
  $Res call({int key, PointsRecord value});

  $PointsRecordCopyWith<$Res> get value;
}

/// @nodoc
class _$ArtRecordCopyWithImpl<$Res, $Val extends ArtRecord>
    implements $ArtRecordCopyWith<$Res> {
  _$ArtRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PointsRecord,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PointsRecordCopyWith<$Res> get value {
    return $PointsRecordCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ArtRecordCopyWith<$Res> implements $ArtRecordCopyWith<$Res> {
  factory _$$_ArtRecordCopyWith(
          _$_ArtRecord value, $Res Function(_$_ArtRecord) then) =
      __$$_ArtRecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int key, PointsRecord value});

  @override
  $PointsRecordCopyWith<$Res> get value;
}

/// @nodoc
class __$$_ArtRecordCopyWithImpl<$Res>
    extends _$ArtRecordCopyWithImpl<$Res, _$_ArtRecord>
    implements _$$_ArtRecordCopyWith<$Res> {
  __$$_ArtRecordCopyWithImpl(
      _$_ArtRecord _value, $Res Function(_$_ArtRecord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_$_ArtRecord(
      null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as int,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PointsRecord,
    ));
  }
}

/// @nodoc

class _$_ArtRecord implements _ArtRecord {
  _$_ArtRecord(this.key, this.value);

  @override
  final int key;
  @override
  final PointsRecord value;

  @override
  String toString() {
    return 'ArtRecord(key: $key, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArtRecord &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArtRecordCopyWith<_$_ArtRecord> get copyWith =>
      __$$_ArtRecordCopyWithImpl<_$_ArtRecord>(this, _$identity);
}

abstract class _ArtRecord implements ArtRecord {
  factory _ArtRecord(final int key, final PointsRecord value) = _$_ArtRecord;

  @override
  int get key;
  @override
  PointsRecord get value;
  @override
  @JsonKey(ignore: true)
  _$$_ArtRecordCopyWith<_$_ArtRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

PointsRecord _$PointsRecordFromJson(Map<String, dynamic> json) {
  return _PointsRecord.fromJson(json);
}

/// @nodoc
mixin _$PointsRecord {
  String get title => throw _privateConstructorUsedError;
  List<dynamic> get points => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointsRecordCopyWith<PointsRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointsRecordCopyWith<$Res> {
  factory $PointsRecordCopyWith(
          PointsRecord value, $Res Function(PointsRecord) then) =
      _$PointsRecordCopyWithImpl<$Res, PointsRecord>;
  @useResult
  $Res call({String title, List<dynamic> points, DateTime createdAt});
}

/// @nodoc
class _$PointsRecordCopyWithImpl<$Res, $Val extends PointsRecord>
    implements $PointsRecordCopyWith<$Res> {
  _$PointsRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? points = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PointsRecordCopyWith<$Res>
    implements $PointsRecordCopyWith<$Res> {
  factory _$$_PointsRecordCopyWith(
          _$_PointsRecord value, $Res Function(_$_PointsRecord) then) =
      __$$_PointsRecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<dynamic> points, DateTime createdAt});
}

/// @nodoc
class __$$_PointsRecordCopyWithImpl<$Res>
    extends _$PointsRecordCopyWithImpl<$Res, _$_PointsRecord>
    implements _$$_PointsRecordCopyWith<$Res> {
  __$$_PointsRecordCopyWithImpl(
      _$_PointsRecord _value, $Res Function(_$_PointsRecord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? points = null,
    Object? createdAt = null,
  }) {
    return _then(_$_PointsRecord(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PointsRecord implements _PointsRecord {
  _$_PointsRecord(
      {required this.title,
      required final List<dynamic> points,
      required this.createdAt})
      : _points = points;

  factory _$_PointsRecord.fromJson(Map<String, dynamic> json) =>
      _$$_PointsRecordFromJson(json);

  @override
  final String title;
  final List<dynamic> _points;
  @override
  List<dynamic> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'PointsRecord(title: $title, points: $points, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PointsRecord &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title,
      const DeepCollectionEquality().hash(_points), createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PointsRecordCopyWith<_$_PointsRecord> get copyWith =>
      __$$_PointsRecordCopyWithImpl<_$_PointsRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PointsRecordToJson(
      this,
    );
  }
}

abstract class _PointsRecord implements PointsRecord {
  factory _PointsRecord(
      {required final String title,
      required final List<dynamic> points,
      required final DateTime createdAt}) = _$_PointsRecord;

  factory _PointsRecord.fromJson(Map<String, dynamic> json) =
      _$_PointsRecord.fromJson;

  @override
  String get title;
  @override
  List<dynamic> get points;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_PointsRecordCopyWith<_$_PointsRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
