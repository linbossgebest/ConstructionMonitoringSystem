import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'sensorInfo.g.dart';

@JsonSerializable()
class SensorInfo extends Object {
  @JsonKey(name: 'subprojectId')
  int subprojectId;

  @JsonKey(name: 'sensorType')
  int sensorType;

  @JsonKey(name: 'rowCount')
  int rowCount;

  @JsonKey(name: 'pageIndex')
  int pageIndex;

  SensorInfo(this.subprojectId, this.sensorType, this.rowCount, this.pageIndex);

  factory SensorInfo.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$SensorInfoFromJson(map);
  }

  Map<String, dynamic> toJson() => _$SensorInfoToJson(this);
}
