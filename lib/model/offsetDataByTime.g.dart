// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offsetDataByTime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffsetDataByTime _$OffsetDataByTimeFromJson(Map<String, dynamic> json) {
  return OffsetDataByTime(
    json['markId'] as int,
    json['timeStart'] as int,
    json['timeEnd'] as int,
  );
}

Map<String, dynamic> _$OffsetDataByTimeToJson(OffsetDataByTime instance) =>
    <String, dynamic>{
      'markId': instance.markId,
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
    };
