import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'management.g.dart';

@JsonSerializable()
class Management extends Object {
  @JsonKey(name: 'subprojectId')
  int subprojectId;

  @JsonKey(name: 'rowCount')
  int rowCount;

  @JsonKey(name: 'pageIndex')
  int pageIndex;

  Management(
    this.subprojectId,
    this.rowCount,
    this.pageIndex,
  );

  factory Management.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$ManagementFromJson(map);
  }

  Map<String, dynamic> toJson() => _$ManagementToJson(this);
}
