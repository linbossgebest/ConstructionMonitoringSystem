// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'managementByOrgaId-role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManagementByOrgaIdRole _$ManagementByOrgaIdRoleFromJson(
    Map<String, dynamic> json) {
  return ManagementByOrgaIdRole(
    json['id'] as int,
    json['orderDataId'] as int,
    json['fileType'] as int,
    json['phase'] as String,
    json['senderId'] as int,
    json['publishType'] as int,
    json['processState'] as int,
    json['toDealOrganizationIds'] as String,
    json['secondDealOrgIds'] as String,
    json['deadTime'] as int,
    json['time'] as String,
    json['sendName'] as String,
    json['orderFileName'] as String,
  );
}

Map<String, dynamic> _$ManagementByOrgaIdRoleToJson(
        ManagementByOrgaIdRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderDataId': instance.orderDataId,
      'fileType': instance.fileType,
      'phase': instance.phase,
      'senderId': instance.senderId,
      'publishType': instance.publishType,
      'processState': instance.processState,
      'toDealOrganizationIds': instance.toDealOrganizationIds,
      'secondDealOrgIds': instance.secondDealOrgIds,
      'deadTime': instance.deadTime,
      'time': instance.time,
      'sendName': instance.sendName,
      'orderFileName': instance.orderFileName,
    };
