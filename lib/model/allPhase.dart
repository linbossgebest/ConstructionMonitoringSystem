import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'allPhase.g.dart';

@JsonSerializable()
class AllPhase extends Object {
  @JsonKey(name: 'subprojectId')
  int subprojectId;

  AllPhase(
    this.subprojectId,
  );

  factory AllPhase.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$AllPhaseFromJson(map);
  }

  Map<String, dynamic> toJson() => _$AllPhaseToJson(this);
}
