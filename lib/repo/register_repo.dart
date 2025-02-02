import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:manjushree/utils/apis.dart';
import 'package:manjushree/utils/http_request.dart';

class RegisterRepo {
  static Future<void> register({
    required String name,
    required String address,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required String gender,
    required Function(String successMessage, String userId) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "name": name,
        "address": address,
        "phone_number": phone,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "gender": gender,
      };

      http.Response response = await HttpRequestManjushree.post(
          Uri.parse(Api.registerUrl),
          headers: headers,
          body: body);
      log("Response status: ${response.statusCode}");
      log("Response body: ${response.body}");

      dynamic data = jsonDecode(response.body);
      log("Decoded data: $data");

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Safely access `message` and `user_id`
        String message = data["message"]?.toString() ?? "Success";
        String userId = data["user_id"]?.toString() ?? "Unknown";

        onSuccess(message, userId);
      } else {
        String errorMessage =
            data["message"]?.toString() ?? "An error occurred.";
        onError(errorMessage);
      }
    } catch (e, s) {
      log("Error: $e");
      log("Stack Trace: $s");
      onError("An unexpected error occurred. Please try again.");
    }
  }
}
