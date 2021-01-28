// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensorInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SensorInfo _$SensorInfoFromJson(Map<String, dynamic> json) {
  return SensorInfo(
    json['subprojectId'] as int,
    json['sensorType'] as int,
    json['rowCount'] as int,
    json['pageIndex'] as int,
  );
}

Map<String, dynamic> _$SensorInfoToJson(SensorInfo instance) =>
    <String, dynamic>{
      'subprojectId': instance.subprojectId,
      'sensorType': instance.sensorType,
      'rowCount': instance.rowCount,
      'pageIndex': instance.pageIndex,
    };
