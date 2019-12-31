import 'package:json_annotation/json_annotation.dart';
import 'package:life_style_hub/utils/constants.dart';

class Role {
  @JsonKey(name: KEY_ID)
  int id;

  @JsonKey(name: KEY_NAME)
  String name;

  Role();

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
  Map<String, dynamic> toJson() => _$RoleToJson(this);
}

Role _$RoleFromJson(Map<String, dynamic> json) {
  var obj = Role();

  obj.id = json[KEY_ID];
  obj.name = json[KEY_NAME];

  return obj;
}

Map<String, dynamic> _$RoleToJson(Role obj) => <String, dynamic>{
      KEY_ID: obj.id,
      KEY_NAME: obj.name,
    };
