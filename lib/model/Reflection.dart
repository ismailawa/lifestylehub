import 'package:json_annotation/json_annotation.dart';
import 'package:life_style_hub/utils/constants.dart';

class Reflection {
  @JsonKey(name: KEY_ID)
  int id;

  @JsonKey(name: KEY_TITLE)
  String title;

  @JsonKey(name: KEY_CONTENT)
  String content;

  @JsonKey(name: KEY_AUTHOR)
  String author;

  @JsonKey(name: KEY_IMAGE_LINK)
  String imageLink;

  @JsonKey(name: KEY_AUDIO_LINK)
  String audioLink;

  @JsonKey(name: KEY_POSTED_BY)
  int postedBy;

  @JsonKey(name: KEY_CREATED_AT)
  String createdAt;

  @JsonKey(name: KEY_UPDATED_AT)
  String updateAt;

  Reflection();

  factory Reflection.fromJson(Map<String, dynamic> json) =>
      _$ReflectionFromJson(json);
  Map<String, dynamic> toJson() => _$ReflectionToJson(this);
}

Reflection _$ReflectionFromJson(Map<String, dynamic> json) {
  var obj = Reflection();
  obj.id = json[KEY_ID];
  obj.title = json[KEY_TITLE];
  obj.content = json[KEY_CONTENT];
  obj.author = json[KEY_AUTHOR];
  obj.imageLink = json[KEY_IMAGE_LINK];
  obj.audioLink = json[KEY_AUDIO_LINK];
  obj.postedBy = json[KEY_POSTED_BY];
  obj.createdAt = json[KEY_CREATED_AT];
  obj.updateAt = json[KEY_UPDATED_AT];

  return obj;
}

Map<String, dynamic> _$ReflectionToJson(Reflection obj) => <String, dynamic>{
      KEY_ID: obj.id,
      KEY_TITLE: obj.title,
      KEY_CONTENT: obj.content,
      KEY_AUTHOR: obj.author,
      KEY_IMAGE_LINK: obj.imageLink,
      KEY_AUDIO_LINK: obj.audioLink,
      //KEY_POSTED_BY: obj.postedBy,
      KEY_CREATED_AT: obj.createdAt,
      //KEY_UPDATED_AT: obj.updateAt,
    };
