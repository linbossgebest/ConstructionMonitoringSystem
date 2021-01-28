// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderData-role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDataRole _$OrderDataRoleFromJson(Map<String, dynamic> json) {
  return OrderDataRole(
    json['name'] as String,
    json['ip'] as String,
    json['port'] as String,
    json['fileMark'] as String,
  );
}

Map<String, dynamic> _$OrderDataRoleToJson(OrderDataRole instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ip': instance.ip,
      'port': instance.port,
      'fileMark': instance.fileMark,
    };
