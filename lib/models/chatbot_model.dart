List<ChatBotDetails> chatFromJson(List<dynamic> chatJson) =>
    List<ChatBotDetails>.from(
        chatJson.map((chatListJson) => ChatBotDetails.fromJson(chatListJson)));

class ChatBotDetails {
  int? id;
  String? question;
  String? answer;
  String? createdAt;
  String? updatedAt;

  ChatBotDetails(
      {this.id, this.question, this.answer, this.createdAt, this.updatedAt});

  ChatBotDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
