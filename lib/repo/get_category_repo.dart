import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:manjushree/models/categories.dart';
import 'package:manjushree/utils/apis.dart';

class GetCategoryRepo {
  static Future<void> getCategory({
    required Function(List<Categories> category) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

      http.Response response = await http.get(
        Uri.parse(Api.getCategoryUrl),
        headers: headers,
      );
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<Categories> category = categoriesFromJsom(data["data"]);
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