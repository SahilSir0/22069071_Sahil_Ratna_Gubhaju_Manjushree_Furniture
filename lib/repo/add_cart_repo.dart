import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:manjushree/controller/core_controller.dart';
import 'package:manjushree/utils/apis.dart';
import 'package:manjushree/utils/http_request.dart';

class AddCartRepo {
  static Future<void> addCartRepo({
    required String productId,
    required String productSkuId,
    required String quantity,
    required Function() onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var coreController = Get.find<CoreController>();
      var userId = coreController.currentUser.value!.userId.toString();
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "product_id": productId,
        "user_id": userId,
        "product_sku_id": productSkuId,
        "quantity": quantity
      };
      log("$headers");
      log("$body");
      http.Response response = await HttpRequestManjushree.post(
          Uri.parse(Api.addCartUrl),
          headers: headers,
          body: body);

      log(json.encode(body));
      //log(response.body);

      dynamic data = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        log("data:$data");
        onSuccess();
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry something went wrong");
    }
  }
}
