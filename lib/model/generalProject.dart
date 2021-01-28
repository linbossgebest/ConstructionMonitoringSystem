import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'generalProject.g.dart';

@JsonSerializable()
class GeneralProject extends Object {
  /* @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'password')
  String password;*/

  GeneralProject();

  factory GeneralProject.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$GeneralProjectFromJson(map);
  }

  Map<String, dynamic> toJson() => _$GeneralProjectToJson(this);
}
