// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Management _$ManagementFromJson(Map<String, dynamic> json) {
  return Management(
    json['subprojectId'] as int,
    json['rowCount'] as int,
    json['pageIndex'] as int,
  );
}

Map<String, dynamic> _$ManagementToJson(Management instance) =>
    <String, dynamic>{
      'subprojectId': instance.subprojectId,
      'rowCount': instance.rowCount,
      'pageIndex': instance.pageIndex,
    };
