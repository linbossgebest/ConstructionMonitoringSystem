import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'stressDataByTime.g.dart';

@JsonSerializable()
class StressDataByTime extends Object {
  @JsonKey(name: 'markId')
  int markId;

  @JsonKey(name: 'timeStart')
  int timeStart;

  @JsonKey(name: 'timeEnd')
  int timeEnd;

  StressDataByTime(
    this.markId,
    this.timeStart,
    this.timeEnd,
  );

  factory StressDataByTime.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$StressDataByTimeFromJson(map);
  }

  Map<String, dynamic> toJson() => _$StressDataByTimeToJson(this);
}
