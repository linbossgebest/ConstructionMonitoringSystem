import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'generalProject-role.g.dart';

/*List<GetGeneralProjectRole> getGeneralProjectList(List<dynamic> list) {
  List<GetGeneralProjectRole> result = [];
  list.forEach((item) {
    result.add(GetGeneralProjectRole.fromJson(item));
  });
  return result;
}*/

@JsonSerializable()
class GeneralProjectRole extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  /*@JsonKey(name: 'symbol')
  String symbol;*/

  @JsonKey(name: 'readonly')
  bool readonly;

  GeneralProjectRole(
      this.id,
      this.name,
      //this.symbol,
      this.readonly);

  //反序列化
  factory GeneralProjectRole.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$GeneralProjectRoleFromJson(map);
  }

  factory GeneralProjectRole.fromMap(Map map) {
    return _$GeneralProjectRoleFromJson(map);
  }

  //序列化
  Map<String, dynamic> toJson() => _$GeneralProjectRoleToJson(this);

  /*bool isLegal() {
    bool res = false;
    if (roleId != null && mark != null) {
      res = true;
    }

    return res;
  }*/
}
