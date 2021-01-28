import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'sensorCountByType.g.dart';

@JsonSerializable()
class SensorCountByType extends Object {
  @JsonKey(name: 'subprojectId')
  int subprojectId;

  @JsonKey(name: 'sensorType')
  int sensorType;

  SensorCountByType(
    this.subprojectId,
    this.sensorType
  );

  factory SensorCountByType.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$SensorCountByTypeFromJson(map);
  }

  Map<String, dynamic> toJson() => _$SensorCountByTypeToJson(this);
}