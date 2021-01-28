import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'theoryData-role.g.dart';

/*List<GetStressDataByTimeRole> getGeneralProjectList(List<dynamic> list){
    List<GetStressDataByTimeRole> result = [];
    list.forEach((item){
      result.add(GetStressDataByTimeRole.fromJson(item));
    });
    return result;
  }*/

@JsonSerializable()
class TheoryDataRole extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'phaseId')
  int phaseId;

  @JsonKey(name: 'temperature')
  double temperature;

  @JsonKey(name: 'humidity')
  double humidity;
  //应力
  @JsonKey(name: 'stress')
  double stress;
  //位移
  @JsonKey(name: 'vOffset')
  double vOffset;

  @JsonKey(name: 'hOffset')
  double hOffset;

  @JsonKey(name: 'lOffset')
  double lOffset;
  //索力
  @JsonKey(name: 'cableForce')
  double cableForce;
  //环境

  TheoryDataRole(
    this.id,
    this.phaseId,
    this.temperature,
    this.humidity,
  );

  //反序列化
  factory TheoryDataRole.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$TheoryDataRoleFromJson(map);
  }

  factory TheoryDataRole.fromMap(Map map) {
    return _$TheoryDataRoleFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$TheoryDataRoleToJson(this);

  /*bool isLegal() {
    bool res = false;
    if (roleId != null && mark != null) {
      res = true;
    }

    return res;
  }*/
}
