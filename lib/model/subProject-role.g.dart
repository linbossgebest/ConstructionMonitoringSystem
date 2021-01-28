// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subProject-role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubProjectRole _$SubProjectRoleFromJson(Map<String, dynamic> json) {
  return SubProjectRole(
    json['id'] as int,
    json['name'] as String,
    json['projectState'] as int,
    json['readonly'] as bool,
    (json['latitude'] as num)?.toDouble(),
    (json['longitude'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$SubProjectRoleToJson(SubProjectRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'projectState': instance.projectState,
      'readonly': instance.readonly,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
