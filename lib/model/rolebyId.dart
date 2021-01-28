import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'rolebyId.g.dart';

@JsonSerializable()
class RolebyId extends Object {
  @JsonKey(name: 'id')
  int id;

  RolebyId(
    this.id,
  );

  factory RolebyId.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$RolebyIdFromJson(map);
  }

  Map<String, dynamic> toJson() => _$RolebyIdToJson(this);
}
