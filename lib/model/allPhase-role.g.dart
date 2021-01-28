// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allPhase-role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllPhaseRole _$AllPhaseRoleFromJson(Map<String, dynamic> json) {
  return AllPhaseRole(
    json['id'] as int,
    json['phaseIndex'] as int,
    json['subprojectId'] as int,
    json['name'] as String,
    json['startTime'] as String,
    json['endTime'] as String,
  );
}

Map<String, dynamic> _$AllPhaseRoleToJson(AllPhaseRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phaseIndex': instance.phaseIndex,
      'subprojectId': instance.subprojectId,
      'name': instance.name,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
