import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'allPhase-role.g.dart';

/*List<GetStressDataByTimeRole> getGeneralProjectList(List<dynamic> list){
    List<GetStressDataByTimeRole> result = [];
    list.forEach((item){
      result.add(GetStressDataByTimeRole.fromJson(item));
    });
    return result;
  }*/

@JsonSerializable()
class AllPhaseRole extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'phaseIndex')
  int phaseIndex;

  @JsonKey(name: 'subprojectId')
  int subprojectId;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'startTime')
  String startTime;

  @JsonKey(name: 'endTime')
  String endTime;

  AllPhaseRole(
    this.id,
    this.phaseIndex,
    this.subprojectId,
    this.name,
    this.startTime,
    this.endTime,
  );

  //反序列化
  factory AllPhaseRole.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$AllPhaseRoleFromJson(map);
  }

  factory AllPhaseRole.fromMap(Map map) {
    return _$AllPhaseRoleFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$AllPhaseRoleToJson(this);

  /*bool isLegal() {
    bool res = false;
    if (roleId != null && mark != null) {
      res = true;
    }

    return res;
  }*/
}
