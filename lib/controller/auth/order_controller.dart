import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/controller/auth/CartController.dart';
import 'package:manjushree/models/Order.dart';
import 'package:manjushree/repo/add_order_repo.dart';
import 'package:manjushree/repo/order_history_repo.dart';
import 'package:manjushree/utils/custom_snackbar.dart';
import 'package:manjushree/views/dash_screen.dart';

final orderHistoryController = Get.put(OrderScreenController());

class OrderScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final shippingAddressController = TextEditingController();
  final quantityController = TextEditingController();
  // final paymentController = Get.put(PaymentController());
  RxDouble totalAmount = 0.0.obs;

  final selectedPayment = ''.obs;
  void updateSelectedPayment(String payment) {
    selectedPayment.value = payment;
  }

  final paymentMethod = ''.obs;
  RxBool loading = RxBool(false);

  RxList<OrderDetails> allOrderDetails = <OrderDetails>[].obs;

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

  orderProduct(String productId, String shippingAddress, double totalPrice,
      String quantity, double amount) async {
    loading.value = true;
    await AddOrderRepo.addOrderRepo(
        productId: productId,
        shippingAddress: shippingAddress,
        totalPrice: totalPrice,
        quantity: quantity,
        amount: amount,
        paymentMethod: paymentMethod.value,
        onSuccess: () {
          // Manually add the order to the order history list
          final controller = Get.put(CartController());
          controller.allCartItemsDetails.clear();
          controller.getAllCartItems();
          allOrderDetails.clear();
          getAllOrders();
          Get.to(() => DashScreen()); // Navigate to HistoryScreen
          // Show success message
          CustomSnackBar.success(
              title: "Order Successful", message: "Order placed successfully");

          // // Navigate to HistoryScreen to show the updated order history
        },
        onError: (message) {
          loading.value = false;
          CustomSnackBar.error(message: message, title: "Order");
        });
  }
}
