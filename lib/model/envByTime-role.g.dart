// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'envByTime-role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnvByTimeRole _$EnvByTimeRoleFromJson(Map<String, dynamic> json) {
  return EnvByTimeRole(
    json['id'] as int,
    (json['temperature'] as num)?.toDouble(),
    (json['humidity'] as num)?.toDouble(),
    json['sampleTime'] as String,
    json['isMachine'] as bool,
  );
}

Map<String, dynamic> _$EnvByTimeRoleToJson(EnvByTimeRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'sampleTime': instance.sampleTime,
      'isMachine': instance.isMachine,
    };
