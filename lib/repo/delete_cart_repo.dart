import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:manjushree/utils/apis.dart';
import 'package:manjushree/utils/http_request.dart';

class DeleteCartRepo {
  static Future<void> deleteCartRepo({
    required String cartItemId,
  
    required Function() onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "cart_item_id": cartItemId,
       
      };
      log("$headers");
      log("$body");
      http.Response response = await HttpRequestManjushree.post(
          Uri.parse(Api.deleteCartUrl),
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
