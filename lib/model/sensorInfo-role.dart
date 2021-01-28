import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'sensorInfo-role.g.dart';

/*List<GetSensorInfoRole> getGeneralProjectList(List<dynamic> list) {
  List<GetSensorInfoRole> result = [];
  list.forEach((item) {
    result.add(GetSensorInfoRole.fromJson(item));
  });
  return result;
}*/

@JsonSerializable()
class SensorInfoRole extends Object {
  @JsonKey(name: 'sensorId')
  String sensorId;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'sensorType')
  int sensorType;

  @JsonKey(name: 'insFactoryCode')
  int insFactoryCode;

  @JsonKey(name: 'channelIndex')
  int channelIndex;

  @JsonKey(name: 'markId')
  int markId;

  @JsonKey(name: 'relatedComponent')
  int relatedComponent;

  @JsonKey(name: 'sensorPrecision')
  double sensorPrecision;

  @JsonKey(name: 'installStage')
  int installStage;

  @JsonKey(name: 'factorya')
  String factorya;

  @JsonKey(name: 'sensorMode')
  int sensorMode;

  @JsonKey(name: 'edge')
  int edge;

  @JsonKey(name: 'offerDir')
  int offerDir;

  SensorInfoRole(
      this.sensorId,
      this.id,
      this.sensorType,
      this.insFactoryCode,
      this.channelIndex,
      this.markId,
      this.relatedComponent,
      this.sensorPrecision,
      this.installStage,
      this.factorya,
      this.sensorMode,
      this.edge,
      this.offerDir);

  //反序列化
  factory SensorInfoRole.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$SensorInfoRoleFromJson(map);
  }

  factory SensorInfoRole.fromMap(Map map) {
    return _$SensorInfoRoleFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$SensorInfoRoleToJson(this);

  /*bool isLegal() {
    bool res = false;
    if (roleId != null && mark != null) {
      res = true;
    }

    return res;
  }*/
}
