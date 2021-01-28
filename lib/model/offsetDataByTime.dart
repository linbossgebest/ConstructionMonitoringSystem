import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'offsetDataByTime.g.dart';

@JsonSerializable()
class OffsetDataByTime extends Object {
  @JsonKey(name: 'markId')
  int markId;

  @JsonKey(name: 'timeStart')
  int timeStart;

  @JsonKey(name: 'timeEnd')
  int timeEnd;

  OffsetDataByTime(
    this.markId,
    this.timeStart,
    this.timeEnd,
  );

  factory OffsetDataByTime.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$OffsetDataByTimeFromJson(map);
  }

  Map<String, dynamic> toJson() => _$OffsetDataByTimeToJson(this);
}
