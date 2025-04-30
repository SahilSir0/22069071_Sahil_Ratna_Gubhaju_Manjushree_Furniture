import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/utils/colors.dart';
import 'package:manjushree/utils/custom_text_style.dart';
import 'package:manjushree/views/dashboard/payment_option_screen.dart';
import 'package:manjushree/widgets/custom/elevated_button.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({
    super.key,
    required this.totalamount,
    required this.quantity,
    required this.shiftingAddress,
    required this.productName,
    required this.productId,
    required this.productPrice,
  });
  final double totalamount;
  final String quantity;
  final String shiftingAddress;
  final String productName;
  final String productId;
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text("Order Details",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Product: ${productName}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text("Price: ${productPrice}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text("Quantity: ${quantity}",
                style: TextStyle(
                    fontSize: 16)), // You can change the quantity dynamically
            SizedBox(height: 20),
            Text("Shifting: ${shiftingAddress}",
                style: TextStyle(
                    fontSize: 16)), // You can change the quantity dynamically
            SizedBox(height: 20),
            Text("Total Amount: ${totalamount}",
                style: TextStyle(
                    fontSize: 16)), // You can change the quantity dynamically
            SizedBox(height: 20),
            CustomElevatedButton(
              title: "Proceed to Payment",
              onTap: () {
                Get.to(() => PaymentOptionScreen(
                      totalamount: totalamount,
                      quantity: quantity,
                      shiftingAddress: shiftingAddress,
                      productId: productId,
                      productName: productName,
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
