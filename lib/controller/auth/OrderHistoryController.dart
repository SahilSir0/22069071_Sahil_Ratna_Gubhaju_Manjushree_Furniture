import 'package:get/get.dart';
import 'package:manjushree/models/Order.dart';
import 'package:manjushree/repo/order_history_repo.dart';

final orderHistoryController = Get.put(OrderHistoryController());

class OrderHistoryController extends GetxController {
  var orderList = <OrderModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadOrderHistory();
  }

  void loadOrderHistory() async {
    try {
      isLoading.value = true;
      final orders = await OrderHistoryRepo.fetchOrderHistory();
      orderList.assignAll(orders);
    } catch (e) {
      print("Error loading order history: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
