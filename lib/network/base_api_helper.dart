import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:image_loading/extras/constants.dart';

import 'api_exception.dart';
import 'response_item.dart';

class BaseApiHelper {
  static Future<ResponseItem> postRequest(
      String requestUrl, Map<String, dynamic> requestData) async {
    "request: $requestUrl".showLog();
    "body: ${json.encode(requestData)}".showLog();
    return await http
        .get(Uri.parse(requestUrl))
        .then((response) => onValue(response))
        .onError((error, stackTrace) => onError(error));
  }

  static Future<ResponseItem> onValue(http.Response response) async {
    ResponseItem result;

    final responseData = json.decode(response.body);
    bool status = false;
    String message = "";
    dynamic data = responseData;

    if (response.statusCode == 200) {
      message = "Success";
      status = true;
      data = responseData;
    } else {
      "response: $data".showLog();
      message = errorText;
    }

    result = ResponseItem(data: data, message: message, status: status);
    "response: {data: ${result.data}, message: $message, status: $status}"
        .showLog();
    return result;
  }

  static onError(error) {
    "Error caused: ${error.toString()}".showLog();
    bool status = false;
    String message = "Unsuccessful request";
    if (error is SocketException) {
      message = ResponseException("No internet connection").toString();
    } else if (error is FormatException) {
      message = ResponseException("Something wrong in response.").toString() +
          error.toString();
    }
    return ResponseItem(data: null, message: message, status: status);
  }
}
