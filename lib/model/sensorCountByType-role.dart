import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'sensorCountByType-role.g.dart';

/*List<GetGeneralProjectRole> getGeneralProjectList(List<dynamic> list){
    List<GetGeneralProjectRole> result = [];
    list.forEach((item){
      result.add(GetGeneralProjectRole.fromJson(item));
    });
    return result;
  }*/


@JsonSerializable()
class SensorCountByTypeRole extends Object {

  @JsonKey(name: 'sensorCount')
  int sensorCount;
 

  SensorCountByTypeRole(
    this.sensorCount,
  );

  //反序列化
  factory SensorCountByTypeRole.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$SensorCountByTypeRoleFromJson(map);
  }

  factory SensorCountByTypeRole.fromMap(Map map) { 
    return _$SensorCountByTypeRoleFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$SensorCountByTypeRoleToJson(this);

  /*bool isLegal() {
    bool res = false;
    if (roleId != null && mark != null) {
      res = true;
    }

    return res;
  }*/
}