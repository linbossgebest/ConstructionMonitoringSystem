import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class UserInfo extends Object {
  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'deviceId')
  String deviceId;

  @JsonKey(name: 'validCode')
  String validCode;

  UserInfo(this.username, this.password, this.deviceId, this.validCode);

  factory UserInfo.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$UserInfoFromJson(map);
  }

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
