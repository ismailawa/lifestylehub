import 'package:life_style_hub/storage/session.dart';
import 'package:http/http.dart' as http;
import 'package:life_style_hub/providers/end_points.dart';
import 'package:life_style_hub/utils/constants.dart';
import 'package:life_style_hub/model/model.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:life_style_hub/responses/responses.dart';

class ApiProvider {
  Future<DefaultResponse> login(String email, String password) async {
    var requestBody = <String, dynamic>{
      KEY_EMAIL:
          email, // This field does not require encryption as implemented on the server
      KEY_PASSWORD: password
    };

    var statusCode;
    try {
      var response = await doPostRequest(ENDPOINT_LOGIN, requestBody);
      statusCode = response.statusCode;
      //print(jsonDecode(response.body.toString()));

      if (_isConnectionSuccessful(statusCode)) {
        var decodedBody = jsonDecode(response.body);
        var apiResponse = DefaultResponse.fromJson(decodedBody);
        apiResponse.statusCode = statusCode;
        return apiResponse;
      } else {
        return _createDefaultResponse(statusCode);
      }
    } catch (e) {
      return _createDefaultResponseMessage(statusCode, e.toString());
    }
  }

  Future<DefaultResponse> register(User userObj) async {
    print(DEFAULT_USER_ROLE);
    var requestBody = <String, dynamic>{
      KEY_FIRST_NAME: userObj.firstName,
      KEY_LAST_NAME: userObj.lastName,
      KEY_EMAIL: userObj.email,
      KEY_ROLE: DEFAULT_USER_ROLE,
      KEY_PASSWORD: userObj.password,
    };

    var statusCode;
    try {
      http.Response response =
          await doPostRequest(ENDPOINT_REGISTER, requestBody);
      statusCode = response.statusCode;
          print(statusCode);
      if (_isConnectionSuccessful(statusCode)) {
        var decodedBody = jsonDecode(response.body);
        var apiResponse = DefaultResponse.fromJson(decodedBody);
        apiResponse.statusCode = statusCode;
        return apiResponse;
      } else {
        return _createDefaultResponse(statusCode);
      }
    } catch (e) {
      return _createDefaultResponseMessage(statusCode, e.toString());
    }
  }

  Future<ReflectionGetApiResponse> getReflectionList() async {
    int statusCode;

    try {
      http.Response response = await doGetRequest(ENDPOINT_GET_REFLECTION_LIST);
      statusCode = response.statusCode;
      if (_isConnectionSuccessful(statusCode)) {
        Map<String, dynamic> json = jsonDecode(response.body);
        var apiResponse = ReflectionGetApiResponse.fromJson(json);
        apiResponse.statusCode = statusCode;
        return apiResponse;
      } else {
        return _createDefaultReflectGetApiResponse(statusCode);
      }
    } catch (e) {
      return _createDefaultReflectGetApiResponseMessage(
          statusCode, e.toString());
    }
  }

  Future<ReflectionGetApiResponse> viewReflection(String reflectionId) async {
    int statusCode;
    try {
      http.Response response =
          await doGetRequest('$ENDPOINT_VIEW_REFLECTION$reflectionId');
      statusCode = response.statusCode;

      if (_isConnectionSuccessful(statusCode)) {
        var decodedBody = jsonDecode(response.body);
        var apiResponse = ReflectionGetApiResponse.fromJson(decodedBody);
        return apiResponse;
      } else {
        return _createDefaultReflectGetApiResponse(statusCode);
      }
    } catch (e) {
      return _createDefaultReflectGetApiResponse(statusCode);
    }
  }

  bool _isConnectionSuccessful(int statusCode) =>
      statusCode == STATUS_CODE_SUCCESS;

  ReflectionGetApiResponse _createDefaultReflectGetApiResponse(int statusCode) {
    var response = ReflectionGetApiResponse();
    response.status = RESPONSE_FAIL;
    response.list = List<Reflection>();
    response.message = 'Reflection not found';
    return response;
  }

  ReflectionGetApiResponse _createDefaultReflectGetApiResponseMessage(
      int statusCode, String message) {
    var response = ReflectionGetApiResponse();
    response.status = RESPONSE_FAIL;
    response.list = List<Reflection>();
    response.message = message;
    return response;
  }

  DefaultResponse _createDefaultResponse(int statusCode) {
    var response = DefaultResponse();
    response.error = true;
    response.status = RESPONSE_FAIL;
    response.message = 'Error $statusCode occured';
    response.statusCode = statusCode;
    return response;
  }

  DefaultResponse _createDefaultResponseMessage(
      int statusCode, String message) {
    var response = DefaultResponse();
    response.error = true;
    response.status = RESPONSE_FAIL;
    response.message = 'Error $statusCode occured. $message';
    response.statusCode = statusCode;
    return response;
  }
}

Future<http.Response> doPostRequest(String endPoint, dynamic body) async {
  var header = await _getNormalHeader();
  //print('body:${jsonEncode(body)}');
  return http.post(
    Uri.encodeFull("$BASE_API$API_VERSION$endPoint"),
    headers: header,
    body: jsonEncode(body),
  );
}

Future<Response> postFormData(String endPoint, dynamic formData) async {
  var header = await _getFormDataHeader();

  var dio = Dio();
  dio.options.baseUrl = '$BASE_API$API_VERSION';

  Response response = Response();
  try {
    response = await dio.post(endPoint,
        data: formData, options: Options(headers: header));
  } catch (e) {
    if (e.toString().contains('$UNAUTHORIZED_STATUS_CODE')) {
      response.statusCode = 401;
    } else {
      response.statusCode = 400;
    }
  }
  return response;
}

Future<http.Response> doGetRequest(String endPoint) async {
  var header = await _getNormalHeader();
  return http.get(Uri.encodeFull("$BASE_API$API_VERSION$endPoint"),
      headers: header);
}

/// Get header for normal GET-POST requests.
Future<Map<String, String>> _getNormalHeader() async {
  var header = Map<String, String>();
  header[_KEY_CONTENT_TYPE] = "application/json";

  String token = await getToken();
  //print('token: $token');
  if (token != null && token.isNotEmpty) {
    header[_KEY_AUTHORIZATION] = "$_KEY_BEARER $token";
  }

  return header;
}

/// Get header for Form-Data GET/POST request.
Future<Map<String, String>> _getFormDataHeader() async {
  var header = Map<String, String>();

  String token = await getToken();
  if (token != null && token.isNotEmpty) {
    header[_KEY_AUTHORIZATION] = "$token";
  }

  return header;
}

Future<String> getToken() async => await SessionManager().getToken();

const _KEY_AUTHORIZATION = "Authorization";
const _KEY_CONTENT_TYPE = "Content-type";
const _KEY_BEARER = "Bearer";
