import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'managementByOrgaId.g.dart';

@JsonSerializable()
class ManagementByOrgaId extends Object {
  @JsonKey(name: 'subprojectId')
  int subprojectId;

  @JsonKey(name: 'rowCount')
  int rowCount;

  @JsonKey(name: 'pageIndex')
  int pageIndex;

  @JsonKey(name: 'organizationId')
  int organizationId;

  @JsonKey(name: 'isFirst')
  bool isFirst;

  ManagementByOrgaId(this.subprojectId, this.rowCount, this.pageIndex,
      this.organizationId, this.isFirst);

  factory ManagementByOrgaId.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$ManagementByOrgaIdFromJson(map);
  }

  Map<String, dynamic> toJson() => _$ManagementByOrgaIdToJson(this);
}
