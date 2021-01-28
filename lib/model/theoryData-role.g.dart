// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theoryData-role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TheoryDataRole _$TheoryDataRoleFromJson(Map<String, dynamic> json) {
  return TheoryDataRole(
    json['id'] as int,
    json['phaseId'] as int,
    (json['temperature'] as num)?.toDouble(),
    (json['humidity'] as num)?.toDouble(),
  )
    ..stress = (json['stress'] as num)?.toDouble()
    ..vOffset = (json['vOffset'] as num)?.toDouble()
    ..hOffset = (json['hOffset'] as num)?.toDouble()
    ..lOffset = (json['lOffset'] as num)?.toDouble()
    ..cableForce = (json['cableForce'] as num)?.toDouble();
}

Map<String, dynamic> _$TheoryDataRoleToJson(TheoryDataRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phaseId': instance.phaseId,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'stress': instance.stress,
      'vOffset': instance.vOffset,
      'hOffset': instance.hOffset,
      'lOffset': instance.lOffset,
      'cableForce': instance.cableForce,
    };
