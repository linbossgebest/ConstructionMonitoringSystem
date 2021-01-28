import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'subProject.g.dart';

@JsonSerializable()
class SubProject extends Object {
  @JsonKey(name: 'generalProjectId')
  int generalProjectId;

  SubProject(this.generalProjectId);

  factory SubProject.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$SubProjectFromJson(map);
  }

  Map<String, dynamic> toJson() => _$SubProjectToJson(this);
}
