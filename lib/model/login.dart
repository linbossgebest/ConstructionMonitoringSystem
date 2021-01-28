import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class UserInfo extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'password')
  String password;

  UserInfo(
    this.name,
    this.password,
  );

  factory UserInfo.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$UserInfoFromJson(map);
  }

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}