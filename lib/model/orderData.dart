import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'orderData.g.dart';

@JsonSerializable()
class OrderData extends Object {
  @JsonKey(name: 'orderDataId')
  int orderDataId;

  OrderData(
    this.orderDataId,
  );

  factory OrderData.fromJson(String json) {
    Map map = jsonDecode(json);
    return _$OrderDataFromJson(map);
  }

  Map<String, dynamic> toJson() => _$OrderDataToJson(this);
}
