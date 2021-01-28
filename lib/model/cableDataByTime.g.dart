// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cableDataByTime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CableDataByTime _$CableDataByTimeFromJson(Map<String, dynamic> json) {
  return CableDataByTime(
    json['markId'] as int,
    json['timeStart'] as int,
    json['timeEnd'] as int,
  );
}

Map<String, dynamic> _$CableDataByTimeToJson(CableDataByTime instance) =>
    <String, dynamic>{
      'markId': instance.markId,
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
    };
