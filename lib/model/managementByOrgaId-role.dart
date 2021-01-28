import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'managementByOrgaId-role.g.dart';

@JsonSerializable()
class ManagementByOrgaIdRole extends Object {
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

  @JsonKey(name: 'secondDealOrgIds')
  String secondDealOrgIds;

  @JsonKey(name: 'deadTime')
  int deadTime;

  @JsonKey(name: 'time')
  String time;

  @JsonKey(name: 'sendName')
  String sendName;

  @JsonKey(name: 'orderFileName')
  String orderFileName;

  ManagementByOrgaIdRole(
    this.id,
    this.orderDataId,
    this.fileType,
    this.phase,
    this.senderId,
    this.publishType,
    this.processState,
    this.toDealOrganizationIds,
    this.secondDealOrgIds,
    this.deadTime,
    this.time,
    this.sendName,
    this.orderFileName,
  );

  //反序列化
  factory ManagementByOrgaIdRole.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$ManagementByOrgaIdRoleFromJson(map);
  }

  factory ManagementByOrgaIdRole.fromMap(Map map) {
    return _$ManagementByOrgaIdRoleFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$ManagementByOrgaIdRoleToJson(this);

  /*bool isLegal() {
    bool res = false;
    if (roleId != null && mark != null) {
      res = true;
    }

    return res;
  }*/
}
