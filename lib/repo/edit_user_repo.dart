import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:manjushree/controller/core_controller.dart';
import 'package:manjushree/models/user.dart';
import 'package:manjushree/utils/apis.dart';
import 'package:manjushree/utils/http_request.dart';

class EditProfileRepo {
  static Future<void> editProfile({
    required String userId,
    required String name,
    required String address,
    required String phoneNumber,
    required String gender,
    File? image,
    required Function(User user) onSuccess,
    required Function(String message) onError,
  }) async {
    var coreController = Get.find<CoreController>();
    var token = coreController.currentUser.value!.token.toString();
    var headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var url = Uri.parse(Api.editProfileUrl);
    http.MultipartRequest request = http.MultipartRequest("POST", url);
    request.headers.addAll((headers));
    request.fields['user_id'] = userId;
    request.fields['name'] = name;
    request.fields['address'] = address;
    request.fields['phone_number'] = phoneNumber;
    request.fields['gender'] = gender;

    if (image != null) {
      request.files.add(
        http.MultipartFile.fromBytes(
          "image",
          await image.readAsBytes(),
          filename: "user-profile",
          contentType: MediaType("image", "*"),
        ),
      );
    }
    http.StreamedResponse response =
        await HttpRequestManjushree.multiPart(request);
    var responseData = await response.stream.bytesToString();
    var data = jsonDecode(responseData);
    log("User data:$data");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      User user = User.fromJson(data["data"]);
      onSuccess(user);
    } else {
      onError(data['message']);
    }
  }
}
