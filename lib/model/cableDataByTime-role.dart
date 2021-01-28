import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'cableDataByTime-role.g.dart';

/*List<GetStressDataByTimeRole> getGeneralProjectList(List<dynamic> list){
    List<GetStressDataByTimeRole> result = [];
    list.forEach((item){
      result.add(GetStressDataByTimeRole.fromJson(item));
    });
    return result;
  }*/

@JsonSerializable()
class CableDataByTimeRole extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'temperature')
  double temperature;

  @JsonKey(name: 'cableForce')
  double cableForce;

  @JsonKey(name: 'sampleTime')
  String sampleTime;

  @JsonKey(name: 'isMachine')
  bool isMachine;

  CableDataByTimeRole(
    this.id,
    this.temperature,
    this.cableForce,
    this.sampleTime,
    this.isMachine,
  );

  //反序列化
  factory CableDataByTimeRole.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$CableDataByTimeRoleFromJson(map);
  }

  factory CableDataByTimeRole.fromMap(Map map) {
    return _$CableDataByTimeRoleFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$CableDataByTimeRoleToJson(this);

  /*bool isLegal() {
    bool res = false;
    if (roleId != null && mark != null) {
      res = true;
    }

    return res;
  }*/
}
