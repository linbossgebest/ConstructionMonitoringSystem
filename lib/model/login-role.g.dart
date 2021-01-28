// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login-role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) {
  return Role(
    json['roleId'] as int,
    json['mark'] as String,
  );
}

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'roleId': instance.roleId,
      'mark': instance.mark,
    };
