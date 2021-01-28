import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'envByTime-role.g.dart';

/*List<GetStressDataByTimeRole> getGeneralProjectList(List<dynamic> list){
    List<GetStressDataByTimeRole> result = [];
    list.forEach((item){
      result.add(GetStressDataByTimeRole.fromJson(item));
    });
    return result;
  }*/

@JsonSerializable()
class EnvByTimeRole extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'temperature')
  double temperature;

  @JsonKey(name: 'humidity')
  double humidity;

  @JsonKey(name: 'sampleTime')
  String sampleTime;

  @JsonKey(name: 'isMachine')
  bool isMachine;

  EnvByTimeRole(
    this.id,
    this.temperature,
    this.humidity,
    this.sampleTime,
    this.isMachine,
  );

  //反序列化
  factory EnvByTimeRole.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$EnvByTimeRoleFromJson(map);
  }

  factory EnvByTimeRole.fromMap(Map map) {
    return _$EnvByTimeRoleFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$EnvByTimeRoleToJson(this);

  /*bool isLegal() {
    bool res = false;
    if (roleId != null && mark != null) {
      res = true;
    }

    return res;
  }*/
}
