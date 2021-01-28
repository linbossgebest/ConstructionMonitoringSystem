import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'subProject-role.g.dart';

/*List<GetSubProjectRole> getGeneralProjectList(List<dynamic> list) {
  List<GetSubProjectRole> result = [];
  list.forEach((item) {
    result.add(GetSubProjectRole.fromJson(item));
  });
  return result;
}*/

@JsonSerializable()
class SubProjectRole extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'projectState')
  int projectState;

  @JsonKey(name: 'readonly')
  bool readonly;

  @JsonKey(name: 'longitude')
  double longitude;

  @JsonKey(name: 'latitude')
  double latitude;

  SubProjectRole(this.id, this.name, this.projectState, this.readonly,
      this.latitude, this.longitude);

  //反序列化
  factory SubProjectRole.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$SubProjectRoleFromJson(map);
  }

  factory SubProjectRole.fromMap(Map map) {
    return _$SubProjectRoleFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$SubProjectRoleToJson(this);

  /*bool isLegal() {
    bool res = false;
    if (roleId != null && mark != null) {
      res = true;
    }

    return res;
  }*/
}
