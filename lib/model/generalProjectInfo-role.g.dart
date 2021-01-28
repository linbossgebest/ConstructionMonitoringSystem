// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generalProjectInfo-role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralProjectInfoRole _$GeneralProjectInfoRoleFromJson(
    Map<String, dynamic> json) {
  return GeneralProjectInfoRole(
    json['name'] as String,
    json['location'] as String,
    json['company'] as String,
    json['service'] as String,
    json['description'] as String,
    json['createTime'] as String,
  );
}

Map<String, dynamic> _$GeneralProjectInfoRoleToJson(
        GeneralProjectInfoRole instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'company': instance.company,
      'service': instance.service,
      'description': instance.description,
      'createTime': instance.createTime,
    };
