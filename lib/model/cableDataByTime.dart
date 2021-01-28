import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'cableDataByTime.g.dart';

@JsonSerializable()
class CableDataByTime extends Object {
  @JsonKey(name: 'markId')
  int markId;

  @JsonKey(name: 'timeStart')
  int timeStart;

  @JsonKey(name: 'timeEnd')
  int timeEnd;

  CableDataByTime(
    this.markId,
    this.timeStart,
    this.timeEnd,
  );

  factory CableDataByTime.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$CableDataByTimeFromJson(map);
  }

  Map<String, dynamic> toJson() => _$CableDataByTimeToJson(this);
}
