import 'package:json_annotation/json_annotation.dart';
import 'package:life_style_hub/utils/constants.dart';
import 'package:life_style_hub/model/User.dart';

class DefaultResponse {
  @JsonKey(name: KEY_ERROR)
  bool error;

  @JsonKey(name: KEY_STATUS)
  String status;

  @JsonKey(name: KEY_MESSAGE)
  String message;

  @JsonKey(name: KEY_DATA)
  User data;

  @JsonKey(name: KEY_TOKEN)
  String token;

  int statusCode = -200; //bad request error

  bool isRequestSuccessful() => status == RESPONSE_SUCCESS;

  /// Returns 'true' if connection to server is successful and 'false' otherwise.
  bool isConnectionSuccessful() => statusCode == STATUS_CODE_SUCCESS;

  /// returns the error message depending on the success of the connection or request
  String get formattedErrMessage {
    if ('$statusCode'.startsWith('4')) {
      // connection is successful, hence, error has to do with API request
      return 'Client Error with $statusCode error code';
    } else if ('$statusCode'.startsWith('3')) {
      // connection is NOT successful, hence, returns connection error
      return 'Redirection Error with $statusCode error code';
    } else {
      // every went well.
      return 'Server Error with $statusCode error code';
    }
  }

  DefaultResponse();

  factory DefaultResponse.fromJson(Map<String, dynamic> json) =>
      _$DefaultResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DefaultResponseToJson(this);
}

DefaultResponse _$DefaultResponseFromJson(Map<String, dynamic> json) {
  var obj = DefaultResponse();
  obj.error = json[KEY_ERROR];
  obj.message = json[KEY_MESSAGE];
  obj.data = User.fromJson(json[KEY_DATA]);
  obj.token = json[KEY_TOKEN];
  obj.status = json[KEY_STATUS];

  return obj;
}

Map<String, dynamic> _$DefaultResponseToJson(DefaultResponse obj) =>
    <String, dynamic>{
      KEY_ERROR: obj.error,
      KEY_MESSAGE: obj.message,
      //KEY_DATA: obj.data,
      KEY_STATUS: obj.status,
      KEY_TOKEN: obj.token
    };
