// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'managementByOrgaId.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManagementByOrgaId _$ManagementByOrgaIdFromJson(Map<String, dynamic> json) {
  return ManagementByOrgaId(
    json['subprojectId'] as int,
    json['rowCount'] as int,
    json['pageIndex'] as int,
    json['organizationId'] as int,
    json['isFirst'] as bool,
  );
}

Map<String, dynamic> _$ManagementByOrgaIdToJson(ManagementByOrgaId instance) =>
    <String, dynamic>{
      'subprojectId': instance.subprojectId,
      'rowCount': instance.rowCount,
      'pageIndex': instance.pageIndex,
      'organizationId': instance.organizationId,
      'isFirst': instance.isFirst,
    };
