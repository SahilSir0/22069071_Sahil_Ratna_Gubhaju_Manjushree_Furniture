import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:manjushree/controller/core_controller.dart';
import 'package:manjushree/models/cart.dart';
import 'package:manjushree/utils/apis.dart';

class GetCartItemRepo {
  static Future<void> getCartItemRepo({
    required Function(List<CartItem> cart) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final coreController = Get.put(CoreController());
      final userId = coreController.currentUser.value!.userId.toString();
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

      http.Response response = await http.get(
        Uri.parse("${Api.getCartItemUrl}?user_id=$userId"),
        headers: headers,
      );
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<CartItem> category = cartItemsFromJsom(data["data"]);
        onSuccess(category);
      } else {
        onError(data['message']);
      }
    } catch (e) {
      // log(e.toString());
      onError("Sorry! something went wrong");
      print(e);
    }
  }
}
