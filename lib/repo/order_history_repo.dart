import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:manjushree/controller/core_controller.dart';
import 'package:manjushree/models/Order.dart';
import 'package:manjushree/utils/apis.dart';


class GetOrderRepo {
  static Future<void> getOrderRepo({
    required Function(List<OrderDetails> orders) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var coreController = Get.find<CoreController>();
      var userId = coreController.currentUser.value!.userId.toString();
      var headers = {
        'Accept': 'application/json',
      };

      var url = Uri.parse("${Api.getOrderUrl}?user_id=$userId");
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<OrderDetails> orders = ordersFromJsom(data["data"]);
        onSuccess(orders);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry! something went wrong");
    }
  }
}