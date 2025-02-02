
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/constant/esewa.dart';
import 'package:manjushree/controller/auth/order_controller.dart';
import 'package:manjushree/utils/custom_snackbar.dart';

class Esewa {
  final c = Get.put(OrderScreenController());

  pay({
    required String productId,
    required String productName,
    required String shippingAddress,
    required double totalPrice,
    required String quantity,
    required double amount,
  }) {
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test,
          clientId: kEsewaClientId,
          secretId: kEsewaSecretKey,
        ),
        esewaPayment: EsewaPayment(
          productId: productId,
          productName: productName,
          productPrice: "10",
          callbackUrl: "",
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult data) {
          debugPrint(":::SUCCESS::: => $data");
          verifyTransactionStatus(
            data,
            productId,
            shippingAddress,
            totalPrice,
            quantity,
            amount,
          );
        },
        onPaymentFailure: (data) {
          debugPrint(":::FAILURE::: => $data");
          CustomSnackBar.error(title: "Payment", message: "Payment Failure");
        },
        onPaymentCancellation: (data) {
          debugPrint(":::CANCELLATION::: => $data");
          CustomSnackBar.info(title: "Payment", message: "Payment Cancel");
        },
      );
    } on Exception catch (e) {
      debugPrint("EXCEPTION : ${e.toString()}");
    }
  }

  void verifyTransactionStatus(
    EsewaPaymentSuccessResult result,
    String productId,
    String shippingAddress,
    double totalPrice,
    String quantity,
    double amount,
  ) async {
    c.orderProduct(productId, shippingAddress, totalPrice, quantity, amount);
  }
}