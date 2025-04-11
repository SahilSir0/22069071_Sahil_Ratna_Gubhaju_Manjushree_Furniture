import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:manjushree/controller/core_controller.dart';
import 'package:manjushree/utils/apis.dart';
import 'package:manjushree/utils/http_request.dart';

class AddOrderRepo {
  static Future<void> addOrderRepo({
    required String productId,
    required String shippingAddress,
    required double totalPrice,
    required String quantity,
    required double amount,
    required String paymentMethod,
    required Function() onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var coreController = Get.find<CoreController>();
      var token = coreController.currentUser.value!.token.toString();
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "product_id": productId,
        "token": token,
        "shipping_address": shippingAddress,
        "total_price": totalPrice.toString(),
        "payment_method": paymentMethod,
        "amount": amount.toString(),
        "quantity": quantity
      };
      log("$headers");
      log("$body");
      http.Response response = await HttpRequestManjushree.post(
          Uri.parse(Api.addOrderUrl),
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
