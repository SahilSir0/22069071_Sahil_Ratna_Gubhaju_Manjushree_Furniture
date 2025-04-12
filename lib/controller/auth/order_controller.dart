import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/controller/auth/OrderHistoryController.dart';
import 'package:manjushree/models/Order.dart';
import 'package:manjushree/repo/add_order_repo.dart';
import 'package:manjushree/utils/custom_snackbar.dart';
import 'package:manjushree/views/dashboard/history_screen.dart';

final orderHistoryController = Get.put(OrderHistoryController());

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

  final paymentMethod = 'khalti'.obs;
  RxBool loading = RxBool(false);

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
          final newOrder = OrderModel(
            orderId: "ORD${DateTime.now().millisecondsSinceEpoch}",
            productName:
                productId, // Assuming productId is the name here, change as necessary
            shippingAddress: shippingAddress,
            date: DateTime.now().toString(),
            quantity: int.parse(quantity),
            totalPrice: totalPrice,
            paymentMethod: paymentMethod.value,
          );
          orderHistoryController.orderList
              .add(newOrder); // Add the order directly to the list

          // Show success message
          CustomSnackBar.success(
              title: "Order Successful", message: "Order placed successfully");

          // Navigate to HistoryScreen to show the updated order history
          Get.to(() => HistoryScreen()); // Navigate to HistoryScreen
        },
        onError: (message) {
          loading.value = false;
          CustomSnackBar.error(message: message, title: "Order");
        });
  }
}
