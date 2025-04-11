import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/repo/add_order_repo.dart';
import 'package:manjushree/utils/custom_snackbar.dart';
import 'package:manjushree/views/dash_screen.dart';

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
          CustomSnackBar.success(
              title: "Order Successful", message: "Rent placed succesfully");
          Get.offAll(() => DashScreen());
        },
        onError: (message) {
          loading.value = false;
          CustomSnackBar.error(message: message, title: "Rent");
        });
  }
}
