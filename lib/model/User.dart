import 'package:json_annotation/json_annotation.dart';
import 'package:life_style_hub/utils/constants.dart';
import 'package:life_style_hub/model/Role.dart';

class User {
  @JsonKey(name: KEY_ID)
  int id;

  @JsonKey(name: KEY_FULL_NAMES)
  String fullName;

  @JsonKey(name: KEY_FIRST_NAME)
  String firstName;

  @JsonKey(name: KEY_LAST_NAME)
  String lastName;

  @JsonKey(name: KEY_EMAIL)
  String email;

  @JsonKey(name: KEY_ROLE)
  Role role;

  @JsonKey(name: KEY_PASSWORD)
  String password;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

User _$UserFromJson(Map<String, dynamic> json) {
  var obj = User();
  obj.id = json[KEY_ID];
  obj.fullName = json[KEY_FULL_NAMES];
  obj.firstName = json[KEY_FIRST_NAME];
  obj.lastName = json[KEY_LAST_NAME];
  obj.email = json[KEY_EMAIL];
  obj.role = Role.fromJson(json[KEY_ROLE]);
  obj.password = json[KEY_PASSWORD];

  return obj;
}

Map<String, dynamic> _$UserToJson(User obj) => <String, dynamic>{
      KEY_FIRST_NAME: obj.firstName,
      KEY_LAST_NAME: obj.lastName,
      KEY_EMAIL: obj.email,
      KEY_PASSWORD: obj.password,
    };
