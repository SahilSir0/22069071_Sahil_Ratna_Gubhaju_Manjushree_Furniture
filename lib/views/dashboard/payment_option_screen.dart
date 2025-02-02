import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/controller/auth/order_controller.dart';
import 'package:manjushree/models/products.dart';
import 'package:manjushree/widgets/custom/elevated_button.dart';

class PaymentOptionScreen extends StatelessWidget {
  final c = Get.put(OrderScreenController());

  final double totalamount;
  final String quantity;
  final String shiftingAddress;
  final Product product;

  PaymentOptionScreen({
    Key? key,
    required this.totalamount,
    required this.quantity,
    required this.shiftingAddress,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Options"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Price: ${product.productPrice}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "Select Payment Method:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Khalti Payment Option
            Obx(
              () => ListTile(
                title: const Text("Khalti"),
                leading: Radio<String>(
                  value: 'khalti',
                  groupValue: c.selectedPayment.value,
                  onChanged: (value) {
                    c.updateSelectedPayment(value!);
                  },
                ),
                selected: c.selectedPayment.value == 'khalti',
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => ListTile(
                title: const Text("eSewa"),
                leading: Radio<String>(
                  value: 'esewa',
                  groupValue: c.selectedPayment.value,
                  onChanged: (value) {
                    c.updateSelectedPayment(value!);
                  },
                ),
                selected: c.selectedPayment.value == 'esewa',
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => ListTile(
                title: const Text("stripe"),
                leading: Radio<String>(
                  value: 'stripe',
                  groupValue: c.selectedPayment.value,
                  onChanged: (value) {
                    c.updateSelectedPayment(value!);
                  },
                ),
                selected: c.selectedPayment.value == 'stripe',
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => ListTile(
                title: const Text("cash"),
                leading: Radio<String>(
                  value: 'cash',
                  groupValue: c.selectedPayment.value,
                  onChanged: (value) {
                    c.updateSelectedPayment(value!);
                  },
                ),
                selected: c.selectedPayment.value == 'cash',
              ),
            ),
            const SizedBox(height: 20),
            // Complete Purchase Button
            CustomElevatedButton(
              onTap: () {
                if (c.selectedPayment.value == 'khalti') {
                  // Start Khalti Payment
                }
              },
              title: 'Complete Purchase',
            ),
          ],
        ),
      ),
    );
  }
}

// void payWithKhalti(
//       BuildContext context,
//       double amount,
//       String productIdentity,
//       String productName,
//     ) {
//       KhaltiScope.of(context).pay(
//         config: PaymentConfig(
//           amount: 2000, // Amount in paisa
//           productIdentity: productIdentity,
//           productName: productName,
//         ),
//         preferences: [PaymentPreference.khalti],
//         onSuccess: (success) {
//           c.paymentController.token.value = success.token;
//           c.paymentController.amount.value = success.amount;

//           log("Transaction ID: ${success.token}");
//           c.paymentController.postPayment();
//           c.orderProduct(
//             product.productId.toString(),
//             shiftingAddress,
//             totalamount.toInt(),
//             quantity,
//             totalamount.toInt(),
//           );

//           CustomSnackBar.success(
//             title: "Payment",
//             message: "Payment Successful",
//           );
//         },
//         onFailure: (failure) {
//           CustomSnackBar.error(
//             title: "Payment",
//             message: "Payment Failed: ${failure.message}",
//           );
//         },
//         onCancel: () {
//           CustomSnackBar.info(
//             title: "Payment",
//             message: "Payment Cancelled",
//           );
//         },
//       );
// if (c.selectedPayment.value.isEmpty) {
//                   CustomSnackBar.error(
//                     title: "Payment",
//                     message: "Please select a payment method",
//                   );
//                   return;
//                 }

//                 if (c.selectedPayment.value == "khalti") {
//                   payWithKhalti(
//                     context,
//                     totalamount,
//                     product.productId.toString(),
//                     product.productName ?? "",
//                   );
//                   c.paymentMethod.value = "khalti";
//                 } else if (c.selectedPayment.value == "cash") {
//                   c.orderProduct(
//                     product.productId.toString(),
//                     shiftingAddress,
//                     totalamount.toInt(),
//                     quantity,
//                     totalamount.toInt(),
//                   );
//                   CustomSnackBar.success(
//                     title: "Order Placed",
//                     message: "You have opted for Cash Payment",
//                   );
//                 }
