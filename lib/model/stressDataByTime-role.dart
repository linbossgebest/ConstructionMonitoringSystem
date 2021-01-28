import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'stressDataByTime-role.g.dart';

/*List<GetStressDataByTimeRole> getGeneralProjectList(List<dynamic> list) {
  List<GetStressDataByTimeRole> result = [];
  list.forEach((item) {
    result.add(GetStressDataByTimeRole.fromJson(item));
  });
  return result;
}*/

@JsonSerializable()
class StressDataByTimeRole extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'temperature')
  double temperature;

  @JsonKey(name: 'phasesStress')
  double phasesStress;

  @JsonKey(name: 'sampleTime')
  String sampleTime;

  @JsonKey(name: 'isMachine')
  bool isMachine;

  StressDataByTimeRole(
    this.id,
    this.temperature,
    this.phasesStress,
    this.sampleTime,
    this.isMachine,
  );

  //反序列化
  factory StressDataByTimeRole.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$StressDataByTimeRoleFromJson(map);
  }

  factory StressDataByTimeRole.fromMap(Map map) {
    return _$StressDataByTimeRoleFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$StressDataByTimeRoleToJson(this);

  /*bool isLegal() {
    bool res = false;
    if (roleId != null && mark != null) {
      res = true;
    }

    return res;
  }*/
}
