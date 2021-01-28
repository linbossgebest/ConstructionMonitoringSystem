import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'orderData-role.g.dart';

@JsonSerializable()
class OrderDataRole extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'ip')
  String ip;

  @JsonKey(name: 'port')
  String port;

  @JsonKey(name: 'fileMark')
  String fileMark;

  OrderDataRole(
    this.name,
    this.ip,
    this.port,
    this.fileMark,
  );

  //反序列化
  factory OrderDataRole.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$OrderDataRoleFromJson(map);
  }

  factory OrderDataRole.fromMap(Map map) {
    return _$OrderDataRoleFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$OrderDataRoleToJson(this);

  /*bool isLegal() {
    bool res = false;
    if (roleId != null && mark != null) {
      res = true;
    }

    return res;
  }*/
}
