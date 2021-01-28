import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'offsetDataByTime-role.g.dart';

/*List<GetStressDataByTimeRole> getGeneralProjectList(List<dynamic> list){
    List<GetStressDataByTimeRole> result = [];
    list.forEach((item){
      result.add(GetStressDataByTimeRole.fromJson(item));
    });
    return result;
  }*/

@JsonSerializable()
class OffsetDataByTimeRole extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'temperature')
  double temperature;

  @JsonKey(name: 'verticalOffset')
  double verticalOffset;

  @JsonKey(name: 'horizontalOffset')
  double horizontalOffset;

  @JsonKey(name: 'longitudinalOffset')
  double longitudinalOffset;

  @JsonKey(name: 'sampleTime')
  String sampleTime;

  @JsonKey(name: 'isMachine')
  bool isMachine;

  OffsetDataByTimeRole(
    this.id,
    this.temperature,
    this.verticalOffset,
    this.horizontalOffset,
    this.longitudinalOffset,
    this.sampleTime,
    this.isMachine,
  );

  //反序列化
  factory OffsetDataByTimeRole.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$OffsetDataByTimeRoleFromJson(map);
  }

  factory OffsetDataByTimeRole.fromMap(Map map) {
    return _$OffsetDataByTimeRoleFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$OffsetDataByTimeRoleToJson(this);

  /*bool isLegal() {
    bool res = false;
    if (roleId != null && mark != null) {
      res = true;
    }

    return res;
  }*/
}
