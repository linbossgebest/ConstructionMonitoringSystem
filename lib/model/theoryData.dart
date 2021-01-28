import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'theoryData.g.dart';

@JsonSerializable()
class TheoryData extends Object {
  @JsonKey(name: 'sensorId')
  int sensorId;

  @JsonKey(name: 'sensorType')
  int sensorType;

  TheoryData(this.sensorId, this.sensorType);

  factory TheoryData.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$TheoryDataFromJson(map);
  }

  Map<String, dynamic> toJson() => _$TheoryDataToJson(this);
}
