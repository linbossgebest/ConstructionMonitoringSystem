import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'login-role.g.dart';

@JsonSerializable()
class Role extends Object {
  @JsonKey(name: 'roleId')
  int roleId;

  @JsonKey(name: 'mark')
  String mark;

  Role(
    this.roleId,
    this.mark,
  );

  //反序列化
  factory Role.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$RoleFromJson(map);
  }

  factory Role.fromMap(Map map) { 
    return _$RoleFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$RoleToJson(this);

  bool isLegal() {
    bool res = false;
    if (roleId != null && mark != null) {
      res = true;
    }

    return res;
  }
}