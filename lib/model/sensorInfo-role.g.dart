// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensorInfo-role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SensorInfoRole _$SensorInfoRoleFromJson(Map<String, dynamic> json) {
  return SensorInfoRole(
    json['sensorId'] as String,
    json['id'] as int,
    json['sensorType'] as int,
    json['insFactoryCode'] as int,
    json['channelIndex'] as int,
    json['markId'] as int,
    json['relatedComponent'] as int,
    (json['sensorPrecision'] as num)?.toDouble(),
    json['installStage'] as int,
    json['factorya'] as String,
    json['sensorMode'] as int,
    json['edge'] as int,
    json['offerDir'] as int,
  );
}

Map<String, dynamic> _$SensorInfoRoleToJson(SensorInfoRole instance) =>
    <String, dynamic>{
      'sensorId': instance.sensorId,
      'id': instance.id,
      'sensorType': instance.sensorType,
      'insFactoryCode': instance.insFactoryCode,
      'channelIndex': instance.channelIndex,
      'markId': instance.markId,
      'relatedComponent': instance.relatedComponent,
      'sensorPrecision': instance.sensorPrecision,
      'installStage': instance.installStage,
      'factorya': instance.factorya,
      'sensorMode': instance.sensorMode,
      'edge': instance.edge,
      'offerDir': instance.offerDir,
    };
