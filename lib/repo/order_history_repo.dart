import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:manjushree/models/Order.dart';

class OrderHistoryRepo {
  static Future<List<OrderModel>> fetchOrderHistory() async {
    final response =
        await http.get(Uri.parse("https://your-api-url.com/orders"));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => OrderModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load order history");
    }
  }
}
