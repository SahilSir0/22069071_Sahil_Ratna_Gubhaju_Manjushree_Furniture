import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:manjushree/controller/auth/OrderHistoryController.dart';
import 'package:manjushree/utils/colors.dart';
import 'package:manjushree/utils/custom_text_style.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final orderHistoryController = Get.put(OrderHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Order History",
          style: CustomTextStyles.f16W600(color: Colors.white),
        ),
      ),
      body: Obx(() {
        final orders =
            orderHistoryController.orderList; // Observe the orderList
        if (orders.isEmpty) {
          return const Center(child: Text("No order history found."));
        }
        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text("Product: ${order.productName}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Address: ${order.shippingAddress}"),
                    Text("Quantity: ${order.quantity}"),
                    Text("Date: ${order.date}"),
                    Text("Payment: ${order.paymentMethod}"),
                  ],
                ),
                trailing: Text("Rs. ${order.totalPrice.toStringAsFixed(2)}"),
              ),
            );
          },
        );
      }),
    );
  }
}
