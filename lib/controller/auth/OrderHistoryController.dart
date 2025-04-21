import 'package:get/get.dart';
import 'package:manjushree/models/Order.dart';
import 'package:manjushree/repo/order_history_repo.dart';

class OrderHistoryController extends GetxController {
  RxList<OrderDetails> allOrderDetails = <OrderDetails>[].obs;

  final loading = RxBool(false);
  @override
  void onInit() {
    getAllOrders();
    super.onInit();
  }

  getAllOrders() async {
    loading.value = true;
    await GetOrderRepo.getOrderRepo(onSuccess: (orders) {
      loading.value = false;

      allOrderDetails.addAll(orders);
    }, onError: ((message) {
      loading.value = false;
    }));
  }
}
