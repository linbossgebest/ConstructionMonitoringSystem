import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'generalProjectInfo-role.g.dart';

/*List<GetGeneralProjectInfoRole> getGeneralProjectList(List<dynamic> list) {
  List<GetGeneralProjectInfoRole> result = [];
  list.forEach((item) {
    result.add(GetGeneralProjectInfoRole.fromJson(item));
  });
  return result;
}*/

@JsonSerializable()
class GeneralProjectInfoRole extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'location')
  String location;

  @JsonKey(name: 'company')
  String company;

  @JsonKey(name: 'service')
  String service;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'createTime')
  String createTime;

  GeneralProjectInfoRole(this.name, this.location, this.company, this.service,
      this.description, this.createTime);

  //反序列化
  factory GeneralProjectInfoRole.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$GeneralProjectInfoRoleFromJson(map);
  }

  factory GeneralProjectInfoRole.fromMap(Map map) {
    return _$GeneralProjectInfoRoleFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$GeneralProjectInfoRoleToJson(this);

  /*bool isLegal() {
    bool res = false;
    if (roleId != null && mark != null) {
      res = true;
    }

    return res;
  }*/
}
