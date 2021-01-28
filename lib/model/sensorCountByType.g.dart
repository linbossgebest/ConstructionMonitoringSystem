// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensorCountByType.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SensorCountByType _$SensorCountByTypeFromJson(Map<String, dynamic> json) {
  return SensorCountByType(
    json['subprojectId'] as int,
    json['sensorType'] as int,
  );
}

Map<String, dynamic> _$SensorCountByTypeToJson(SensorCountByType instance) =>
    <String, dynamic>{
      'subprojectId': instance.subprojectId,
      'sensorType': instance.sensorType,
    };
