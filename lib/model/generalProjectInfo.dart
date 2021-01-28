import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'generalProjectInfo.g.dart';

@JsonSerializable()
class GeneralProjectInfo extends Object {
  @JsonKey(name: 'projectId')
  int projectId;

  GeneralProjectInfo(this.projectId);

  factory GeneralProjectInfo.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$GeneralProjectInfoFromJson(map);
  }

  Map<String, dynamic> toJson() => _$GeneralProjectInfoToJson(this);
}
