import 'package:json_annotation/json_annotation.dart';
import 'package:life_style_hub/utils/constants.dart';

class Task {
  @JsonKey(name: KEY_ID)
  int id;

  @JsonKey(name: KEY_NAME)
  String title;

  @JsonKey(name: KEY_DESCRIPTION)
  String description;

  @JsonKey(name: KEY_DATE)
  String date;

  @JsonKey(name: KEY_PRIORITY)
  int priority;

  @JsonKey(name: KEY_DONE)
  int done;

  @JsonKey(name: KEY_ALARM_DATE)
  String alarmDate;

  @JsonKey(name: KEY_ALARM_TIME)
  String alarmTime;

  Task();

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
  Map<String, dynamic> toReminder() => _$TaskToReminder(this);
}

Task _$TaskFromJson(Map<String, dynamic> json) {
  var obj = Task();

  obj.id = json[KEY_ID];
  obj.title = json[KEY_TITLE];
  obj.description = json[KEY_DESCRIPTION];
  obj.date = json[KEY_DATE];
  obj.priority = json[KEY_PRIORITY];
  obj.alarmTime = json[KEY_ALARM_TIME];
  obj.alarmDate = json[KEY_ALARM_DATE];
  obj.done = json[KEY_DONE];

  return obj;
}

//this is for todo
Map<String, dynamic> _$TaskToJson(Task obj) => <String, dynamic>{
      KEY_ID: obj.id,
      KEY_TITLE: obj.title,
      KEY_DESCRIPTION: obj.description,
      KEY_DATE: obj.date,
      KEY_PRIORITY: obj.priority,
    };

//this is for reminder
Map<String, dynamic> _$TaskToReminder(Task obj) => <String, dynamic>{
      KEY_ID: obj.id,
      KEY_TITLE: obj.title,
      KEY_DESCRIPTION: obj.description,
      KEY_DATE: obj.date,
      KEY_DONE: obj.done,
      KEY_ALARM_DATE: obj.alarmDate,
      KEY_ALARM_TIME: obj.alarmTime
    };
