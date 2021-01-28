import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'envByTime.g.dart';

@JsonSerializable()
class EnvByTime extends Object {
  @JsonKey(name: 'markId')
  int markId;

  @JsonKey(name: 'timeStart')
  int timeStart;

  @JsonKey(name: 'timeEnd')
  int timeEnd;

  EnvByTime(
    this.markId,
    this.timeStart,
    this.timeEnd,
  );

  factory EnvByTime.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$EnvByTimeFromJson(map);
  }

  Map<String, dynamic> toJson() => _$EnvByTimeToJson(this);
}
