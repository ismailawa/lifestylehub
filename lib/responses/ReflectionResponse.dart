import 'package:life_style_hub/model/Reflection.dart';
import 'package:life_style_hub/utils/constants.dart';
import 'package:json_annotation/json_annotation.dart';

class ReflectionGetApiResponse {
  @JsonKey(name: KEY_DATA)
  List<Reflection> _list;

  @JsonKey(name: KEY_STATUS)
  String _status;

  @JsonKey(name: KEY_MESSAGE)
  String _message;

  set list(List<Reflection> value) {
    _list = value;
  }

  List<Reflection> get list => _list;

  set status(String value) {
    _status = value;
  }

  String get status => _status;

  set message(String value) {
    _message = value;
  }

  String get message => _message;

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

  ReflectionGetApiResponse();

  factory ReflectionGetApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ReflectionGetApiResponseFromJson(json);
}

ReflectionGetApiResponse _$ReflectionGetApiResponseFromJson(
    Map<String, dynamic> json) {
  List<Reflection> reflectionList = [];
  if (json.containsKey(KEY_DATA)) {
    var list = json[KEY_DATA] as List;
    reflectionList = list.map((i) => Reflection.fromJson(i)).toList();
  }

  var response = ReflectionGetApiResponse();
  response._list = reflectionList;
  response._status = json[KEY_STATUS];
  //response._message = json[KEY_MESSAGE];

  //print(response.status);

  return response;
}
