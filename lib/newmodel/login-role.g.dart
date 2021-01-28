// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login-role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) {
  return Role(
    json['datas'] == null ? null : Datas.fromJson(json['datas'] as String),
    json['code'] as int,
    json['msg'] as String,
  );
}

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'datas': instance.datas,
      'code': instance.code,
      'msg': instance.msg,
    };

Datas _$DatasFromJson(Map<String, dynamic> json) {
  return Datas(
    json['access_token'] as String,
    json['token_type'] as String,
    json['refresh_token'] as String,
    json['expires_in'] as int,
    json['scope'] as String,
    json['materialModule'] as int,
    json['authorityModule'] as int,
  );
}

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'scope': instance.scope,
      'materialModule': instance.materialModule,
      'authorityModule': instance.authorityModule,
    };
