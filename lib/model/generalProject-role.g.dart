// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generalProject-role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralProjectRole _$GeneralProjectRoleFromJson(Map<String, dynamic> json) {
  return GeneralProjectRole(
    json['id'] as int,
    json['name'] as String,
    json['readonly'] as bool,
  );
}

Map<String, dynamic> _$GeneralProjectRoleToJson(GeneralProjectRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'readonly': instance.readonly,
    };
