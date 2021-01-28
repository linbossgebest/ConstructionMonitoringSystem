import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'login-role.g.dart';

/*@JsonSerializable()
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
}*/
@JsonSerializable()
class Role extends Object {
  @JsonKey(name: 'datas')
  Datas datas;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  Role(
    this.datas,
    this.code,
    this.msg,
  );

  /*factory Role.fromJson(Map<String, dynamic> srcJson) =>
      _$RoleFromJson(srcJson);*/
  factory Role.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$RoleFromJson(map);
  }

  factory Role.fromMap(Map map) {
    return _$RoleFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$RoleToJson(this);
}

@JsonSerializable()
class Datas extends Object {
  @JsonKey(name: 'access_token')
  String accessToken;

  @JsonKey(name: 'token_type')
  String tokenType;

  @JsonKey(name: 'refresh_token')
  String refreshToken;

  @JsonKey(name: 'expires_in')
  int expiresIn;

  @JsonKey(name: 'scope')
  String scope;

  @JsonKey(name: 'materialModule')
  int materialModule;

  @JsonKey(name: 'authorityModule')
  int authorityModule;

  Datas(
    this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.expiresIn,
    this.scope,
    this.materialModule,
    this.authorityModule,
  );

  /*factory Datas.fromJson(Map<String, dynamic> srcJson) =>
      _$DatasFromJson(srcJson);*/
  factory Datas.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$DatasFromJson(map);
  }

  factory Datas.fromMap(Map map) {
    return _$DatasFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$DatasToJson(this);
}
