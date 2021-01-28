// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'envByTime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnvByTime _$EnvByTimeFromJson(Map<String, dynamic> json) {
  return EnvByTime(
    json['markId'] as int,
    json['timeStart'] as int,
    json['timeEnd'] as int,
  );
}

Map<String, dynamic> _$EnvByTimeToJson(EnvByTime instance) => <String, dynamic>{
      'markId': instance.markId,
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
    };
