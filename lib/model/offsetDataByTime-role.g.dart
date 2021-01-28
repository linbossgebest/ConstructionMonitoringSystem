// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offsetDataByTime-role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffsetDataByTimeRole _$OffsetDataByTimeRoleFromJson(Map<String, dynamic> json) {
  return OffsetDataByTimeRole(
    json['id'] as int,
    (json['temperature'] as num)?.toDouble(),
    (json['verticalOffset'] as num)?.toDouble(),
    (json['horizontalOffset'] as num)?.toDouble(),
    (json['longitudinalOffset'] as num)?.toDouble(),
    json['sampleTime'] as String,
    json['isMachine'] as bool,
  );
}

Map<String, dynamic> _$OffsetDataByTimeRoleToJson(
        OffsetDataByTimeRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'temperature': instance.temperature,
      'verticalOffset': instance.verticalOffset,
      'horizontalOffset': instance.horizontalOffset,
      'longitudinalOffset': instance.longitudinalOffset,
      'sampleTime': instance.sampleTime,
      'isMachine': instance.isMachine,
    };
