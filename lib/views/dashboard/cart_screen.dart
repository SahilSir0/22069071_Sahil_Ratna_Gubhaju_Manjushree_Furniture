import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/controller/auth/CartController.dart';
import 'package:manjushree/controller/auth/order_controller.dart';
import 'package:manjushree/models/cart.dart';
import 'package:manjushree/utils/validatior.dart';
import 'package:manjushree/views/dashboard/order_detail_screen.dart';
import 'package:manjushree/widgets/custom/custom_textfield.dart';
import 'package:manjushree/widgets/custom/elevated_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    final c = Get.put(OrderScreenController());

    return Scaffold(
        appBar:
            AppBar(title: const Text("Cart"), backgroundColor: Colors.white),
        body: RefreshIndicator(
          onRefresh: () async {
            cartController.allCartItemsDetails.clear();
            cartController.getAllCartItems();
          },
          child: Obx(() => (cartController.loading.value)
              ? Center(child: CircularProgressIndicator())
              : cartController.allCartItemsDetails.isEmpty
                  ? Center(child: Text("Your cart is empty"))
                  : ListView.builder(
                      itemCount: cartController.allCartItemsDetails.length,
                      itemBuilder: (context, index) {
                        final CartItem item =
                            cartController.allCartItemsDetails[index];
                        final double totalAmount =
                            double.parse(item.price ?? "") *
                                double.parse(item.quantity ?? "");
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Image.network(
                                  item.image ?? "",
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.broken_image),
                                ),
                                title: Text(
                                  item.productName ?? "",
                                  style: CustomTextStyle.headingStyle,
                                ),
                                subtitle: Text("Qty: ${item.quantity}"),
                                trailing: Text(
                                  "Rs. ${item.price}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                    ),
                                    builder: (context) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom,
                                        ),
                                        child: SingleChildScrollView(
                                          child: Form(
                                            key: c.formKey,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Center(
                                                    child: Container(
                                                      width: 40,
                                                      height: 5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[300],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 15),
                                                  Center(
                                                    child: Text(
                                                      "Order Details",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Text(
                                                    "Shipping Address",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey[700],
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 6),
                                                  CustomTextField(
                                                    controller: c
                                                        .shippingAddressController,
                                                    validator: Validators
                                                        .checkFieldEmpty,
                                                    hint:
                                                        "Enter shipping address",
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    textInputType:
                                                        TextInputType.text,
                                                  ),
                                                  const SizedBox(height: 25),
                                                  Divider(
                                                      thickness: 0.8,
                                                      color: Colors.grey[300]),
                                                  const SizedBox(height: 10),
                                                  CustomElevatedButton(
                                                    title: "Buy now",
                                                    onTap: () {
                                                      Get.back();
                                                      Get.to(() =>
                                                          OrderDetailsScreen(
                                                            totalamount:
                                                                totalAmount,
                                                            quantity:
                                                                item.quantity ??
                                                                    "",
                                                            shiftingAddress: c
                                                                .shippingAddressController
                                                                .text,
                                                            productName: item
                                                                .productName
                                                                .toString(),
                                                            productId: item
                                                                .productId
                                                                .toString(),
                                                            productPrice: item
                                                                .price
                                                                .toString(),
                                                          ));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      cartController.removeCartItem(
                                          item.cartItemId.toString());
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )),
        ));
  }
}

class CustomTextStyle {
  static const headingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}
