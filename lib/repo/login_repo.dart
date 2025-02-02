import 'dart:convert';
import 'dart:developer';

import 'package:manjushree/utils/apis.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class LoginRepo {
  static Future<void> login({
    required String email,
    required String password,
    required Function(User user, String token) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      log("Attempting to log in...");
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "email": email,
        "password": password,
        "user_type": "customer"
      };
      log("Request body: $body");

      http.Response response = await http.post(Uri.parse(Api.loginUrl),
          headers: headers, body: body);

      log("Response status: ${response.statusCode}");
      dynamic data = jsonDecode(response.body);
      log("Response data: $data");

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (data["status"] == "success") {
          String accessToken = data["data"]["token"].toString();
          User user = User.fromJson(data["data"]);
          onSuccess(user, accessToken);
        } else {
          onError(data["message"] ?? "Unknown error occurred");
        }
      } else {
        String errorMessage =
            data["message"] ?? "Login failed. Please try again.";
        if (errorMessage.toLowerCase().contains("email")) {
          errorMessage = "Email is invalid";
        }
        onError(errorMessage);
      }
    } catch (e, s) {
      log("Error: $e");
      log("Stack trace: $s");
      onError("Sorry, something went wrong. Please try again later.");
    }
  }
}
