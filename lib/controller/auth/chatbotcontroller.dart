import 'package:get/get.dart';
import 'package:manjushree/models/chatbot_model.dart';
import 'package:manjushree/repo/get_chatbot_details_repo.dart';
import 'package:manjushree/utils/custom_snackbar.dart';

class Chatbotcontroller extends GetxController {
  RxList<ChatBotDetails> allChartDetails = <ChatBotDetails>[].obs;
  RxList<ChatBotDetails> selectedChats = <ChatBotDetails>[].obs;

  RxBool loading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    getAllChats();
  }

  getAllChats() async {
    loading.value = true;
    await GetChatbotDetailsRepo.getChatbotDetailsRepo(onSuccess: (chat) {
      loading.value = false;
      allChartDetails.addAll(chat);
    }, onError: (message) {
      loading.value = false;
      CustomSnackBar.error(title: "Chat", message: message);
    });
  }

  void selectChat(ChatBotDetails chat) {
    selectedChats.add(chat);
  }

  String getFormattedTime(ChatBotDetails chat) {
    final now = DateTime.now();
    final hour = now.hour > 12
        ? now.hour - 12
        : now.hour == 0
            ? 12
            : now.hour;
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.hour >= 12 ? 'PM' : 'AM';

    return '$hour:$minute $period';
  }
}
