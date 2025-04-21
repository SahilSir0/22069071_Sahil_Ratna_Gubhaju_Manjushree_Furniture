import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:manjushree/models/chatbot_model.dart';
import 'package:manjushree/utils/apis.dart';

class GetChatbotDetailsRepo {
  static Future<void> getChatbotDetailsRepo({
    required Function(List<ChatBotDetails> chat) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

      http.Response response = await http.get(
        Uri.parse(Api.getChatDetailsUrl),
        headers: headers,
      );
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<ChatBotDetails> chat = chatFromJson(data["data"]);
        onSuccess(chat);
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
