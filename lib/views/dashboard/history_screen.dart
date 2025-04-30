import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/controller/auth/order_controller.dart';
import 'package:manjushree/models/Order.dart';
import 'package:manjushree/utils/colors.dart';
import 'package:manjushree/utils/custom_text_style.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});
  final c = Get.put(OrderScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: AppColors.extraWhite,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 19,
              color: Colors.black,
            )),
        centerTitle: true,
        title: Text(
          "Order History",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          c.allOrderDetails.clear();
          c.getAllOrders();
        },
        child: Obx(() => (c.loading.value)
            ? const Center(child: CircularProgressIndicator())
            : c.allOrderDetails.isEmpty
                ? Center(
                    child: Text(
                    "Order history",
                    style: CustomTextStyles.f12W400(
                        color: AppColors.textGreyColor),
                  ))
                : Container(
                    child: ListView.builder(
                        itemCount: c.allOrderDetails.length,
                        itemBuilder: (context, index) {
                          OrderDetails orders = c.allOrderDetails[index];

                          return OrderHistoryCard(order: orders);
                        }),
                  )),
      ),
    );
  }
}

class OrderHistoryCard extends StatelessWidget {
  final OrderDetails order;

  const OrderHistoryCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order ID: ${order.orderId ?? ''}",
                style: CustomTextStyles.f12W600()),
            const SizedBox(height: 5),
            Text("Total Price: Rs. ${order.orderTotalPrice ?? '0'}",
                style: CustomTextStyles.f12W400()),
            Text("Status: ${order.orderStatus ?? 'Pending'}",
                style: CustomTextStyles.f12W400()),
            Text("Ordered on: ${order.orderCreatedAt ?? ''}",
                style:
                    CustomTextStyles.f10W400(color: AppColors.textGreyColor)),
            const Divider(height: 20),
            ...?order.items?.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          item.productImageUrl ?? '',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.productName ?? '',
                                style: CustomTextStyles.f12W600()),
                            Text("Qty: ${item.quantity ?? '1'}",
                                style: CustomTextStyles.f10W400()),
                            Text("Total: Rs. ${item.itemTotalPrice ?? '0'}",
                                style: CustomTextStyles.f10W400()),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
