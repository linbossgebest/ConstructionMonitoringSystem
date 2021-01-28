// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stressDataByTime-role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StressDataByTimeRole _$StressDataByTimeRoleFromJson(Map<String, dynamic> json) {
  return StressDataByTimeRole(
    json['id'] as int,
    (json['temperature'] as num)?.toDouble(),
    (json['phasesStress'] as num)?.toDouble(),
    json['sampleTime'] as String,
    json['isMachine'] as bool,
  );
}

Map<String, dynamic> _$StressDataByTimeRoleToJson(
        StressDataByTimeRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'temperature': instance.temperature,
      'phasesStress': instance.phasesStress,
      'sampleTime': instance.sampleTime,
      'isMachine': instance.isMachine,
    };
