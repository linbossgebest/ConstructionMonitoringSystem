// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stressDataByTime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StressDataByTime _$StressDataByTimeFromJson(Map<String, dynamic> json) {
  return StressDataByTime(
    json['markId'] as int,
    json['timeStart'] as int,
    json['timeEnd'] as int,
  );
}

Map<String, dynamic> _$StressDataByTimeToJson(StressDataByTime instance) =>
    <String, dynamic>{
      'markId': instance.markId,
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
    };
