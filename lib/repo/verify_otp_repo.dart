// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:manjushree/utils/apis.dart';
import 'package:manjushree/utils/http_request.dart';

class VerifyOtpRepo {
  static Future<void> verifyOtp({
    required String userId,
    required String code,
    required Function(String successMessage) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "user_id": userId,
        "code": code,
      };
      http.Response response = await HttpRequestManjushree.post(
          Uri.parse(Api.verifyOtpUrl),
          headers: headers,
          body: body);
      //print(body);
      dynamic data = jsonDecode(response.body);
      //print(data);
      if (data["status"] == "success") {
        onSuccess(data["message"]);
      } else {
        onError(data["message"]);
      }
    } catch (e) {
      print(e);
      onError("Sorry something went wrong");
    }
  }
}
