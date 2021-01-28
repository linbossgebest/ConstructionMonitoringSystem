import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'rolebyId-role.g.dart';

@JsonSerializable()
class RolebyIdRole extends Object {
  @JsonKey(name: 'moduleAuthority')
  int moduleAuthority;

  @JsonKey(name: 'projectAuthority')
  int projectAuthority;

  @JsonKey(name: 'organizationId')
  int organizationId;

  RolebyIdRole(
    this.moduleAuthority,
    this.projectAuthority,
    this.organizationId,
  );

  //反序列化
  factory RolebyIdRole.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$RolebyIdRoleFromJson(map);
  }

  factory RolebyIdRole.fromMap(Map map) {
    return _$RolebyIdRoleFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$RolebyIdRoleToJson(this);

  /*bool isLegal() {
    bool res = false;
    if (roleId != null && mark != null) {
      res = true;
    }

    return res;
  }*/
}
