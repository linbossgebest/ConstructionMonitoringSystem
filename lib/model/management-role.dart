import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'management-role.g.dart';

@JsonSerializable()
class ManagementRole extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'orderDataId')
  int orderDataId;

  @JsonKey(name: 'fileType')
  int fileType;

  @JsonKey(name: 'phase')
  String phase;

  @JsonKey(name: 'senderId')
  int senderId;

  @JsonKey(name: 'publishType')
  int publishType;

  @JsonKey(name: 'processState')
  int processState;

  @JsonKey(name: 'toDealOrganizationIds')
  String toDealOrganizationIds;

  @JsonKey(name: 'deadTime')
  int deadTime;

  @JsonKey(name: 'time')
  String time;

  @JsonKey(name: 'sendName')
  String sendName;

  @JsonKey(name: 'orderFileName')
  String orderFileName;

  ManagementRole(
    this.id,
    this.orderDataId,
    this.fileType,
    this.phase,
    this.senderId,
    this.publishType,
    this.processState,
    this.toDealOrganizationIds,
    this.deadTime,
    this.time,
    this.sendName,
    this.orderFileName,
  );

  //反序列化
  factory ManagementRole.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$ManagementRoleFromJson(map);
  }

  factory ManagementRole.fromMap(Map map) {
    return _$ManagementRoleFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$ManagementRoleToJson(this);

  /*bool isLegal() {
    bool res = false;
    if (roleId != null && mark != null) {
      res = true;
    }

    return res;
  }*/
}
