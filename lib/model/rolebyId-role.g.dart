// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rolebyId-role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RolebyIdRole _$RolebyIdRoleFromJson(Map<String, dynamic> json) {
  return RolebyIdRole(
    json['moduleAuthority'] as int,
    json['projectAuthority'] as int,
    json['organizationId'] as int,
  );
}

Map<String, dynamic> _$RolebyIdRoleToJson(RolebyIdRole instance) =>
    <String, dynamic>{
      'moduleAuthority': instance.moduleAuthority,
      'projectAuthority': instance.projectAuthority,
      'organizationId': instance.organizationId,
    };
