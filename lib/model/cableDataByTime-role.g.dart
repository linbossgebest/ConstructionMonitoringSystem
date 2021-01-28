// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cableDataByTime-role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CableDataByTimeRole _$CableDataByTimeRoleFromJson(Map<String, dynamic> json) {
  return CableDataByTimeRole(
    json['id'] as int,
    (json['temperature'] as num)?.toDouble(),
    (json['cableForce'] as num)?.toDouble(),
    json['sampleTime'] as String,
    json['isMachine'] as bool,
  );
}

Map<String, dynamic> _$CableDataByTimeRoleToJson(
        CableDataByTimeRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'temperature': instance.temperature,
      'cableForce': instance.cableForce,
      'sampleTime': instance.sampleTime,
      'isMachine': instance.isMachine,
    };
