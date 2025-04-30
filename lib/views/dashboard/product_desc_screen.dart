import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/controller/auth/CartController.dart';
import 'package:manjushree/controller/auth/order_controller.dart';
import 'package:manjushree/models/products.dart';
import 'package:manjushree/utils/colors.dart';
import 'package:manjushree/utils/custom_text_style.dart';
import 'package:manjushree/utils/validatior.dart';
import 'package:manjushree/views/dashboard/order_detail_screen.dart';
import 'package:manjushree/widgets/custom/elevated_button.dart';
import '../../widgets/custom/custom_textfield.dart';

final cartController = Get.find<CartController>();

class ProductDescScreen extends StatelessWidget {
  ProductDescScreen({super.key, required this.products});

  final Product products;
  final c = Get.put(OrderScreenController());

  void calculateTotal(double price, int quantity) {
    double totalAmountCost = price * quantity;
    print("Total Amount : \$${totalAmountCost}");
    c.totalAmount.value = totalAmountCost;
    if (c.totalAmount.value != null) {
      Get.to(() => OrderDetailsScreen(
            totalamount: c.totalAmount.value,
            quantity: c.quantityController.text,
            shiftingAddress: c.shippingAddressController.text,
            productName: products.productName.toString(),
            productId: products.productId.toString(),
            productPrice: products.productPrice.toString(),
          ));
    } else {
      print("Total Amount is null. Please calculate it First");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Description"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                fit: BoxFit.fill,
                height: 250,
                width: double.infinity,
                imageUrl: products.productImage ?? "",
                errorWidget: (context, url, error) => Image.asset(
                  'assets/common/blank-image.jpg',
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                products.productName ?? "",
                style: CustomTextStyles.f14W600(),
              ),
              Text(
                products.productDescription ?? "",
                style: CustomTextStyles.f12W400(),
                textAlign: TextAlign.justify,
              ),
              Text("Quantity: ${products.productQuantity}"),
              Text("Price: ${products.productPrice}"),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: Get.width / 2.3,
                        child: CustomElevatedButton(
                          title: "Add to cart",
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
                                    bottom:
                                        MediaQuery.of(context).viewInsets.bottom,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Form(
                                      key: c.formKey,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
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
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 15),
                                            Center(
                                              child: Text(
                                                "Order Details",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              "Quantity",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            CustomTextField(
                                              controller: c.quantityController,
                                              validator:
                                                  Validators.checkFieldEmpty,
                                              hint: "e.g. 2",
                                              textInputAction:
                                                  TextInputAction.done,
                                              textInputType: TextInputType.number,
                                            ),
                                            const SizedBox(height: 25),
                                            Divider(
                                                thickness: 0.8,
                                                color: Colors.grey[300]),
                                            const SizedBox(height: 10),
                                            CustomElevatedButton(
                                              title: "Add to Cart",
                                              onTap: () {
                                                Get.back();
                                                if (products.skus != null &&
                                                    products.skus!.isNotEmpty) {
                                                  cartController.addToCart(
                                                    products.productId.toString(),
                                                    products
                                                        .skus!.first.productSkuId
                                                        .toString(),
                                                    c.quantityController.text,
                                                  );
                                                } else {
                                                  // Handle the case where SKU is missing
                                                  Get.snackbar("Error",
                                                      "No SKU found for this product");
                                                }
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
                    ),
                    SizedBox(
                      width: Get.width / 2.3,
                      child: CustomElevatedButton(
                        title: "Buy Now",
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
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: SingleChildScrollView(
                                  child: Form(
                                    key: c.formKey,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
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
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          Center(
                                            child: Text(
                                              "Order Details",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
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
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          CustomTextField(
                                            controller:
                                                c.shippingAddressController,
                                            validator:
                                                Validators.checkFieldEmpty,
                                            hint: "Enter your address",
                                            textInputAction:
                                                TextInputAction.next,
                                            textInputType: TextInputType.text,
                                          ),
                                          const SizedBox(height: 15),
                                          Text(
                                            "Quantity",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          CustomTextField(
                                            controller: c.quantityController,
                                            validator:
                                                Validators.checkFieldEmpty,
                                            hint: "e.g. 2",
                                            textInputAction:
                                                TextInputAction.done,
                                            textInputType: TextInputType.number,
                                          ),
                                          const SizedBox(height: 25),
                                          Divider(
                                              thickness: 0.8,
                                              color: Colors.grey[300]),
                                          const SizedBox(height: 10),
                                          CustomElevatedButton(
                                            title: "Continue",
                                            onTap: () {
                                              if (products.productPrice !=
                                                  null) {
                                                calculateTotal(
                                                  double.parse(
                                                      products.productPrice!),
                                                  int.parse(c
                                                      .quantityController.text),
                                                );
                                              } else {
                                                print("Product price is null.");
                                              }
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
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 270,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.lGrey,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15),
                      child: Container(
                        width: 360,
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: AppColors.extraWhite,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Ratings & Reviews",
                            style: CustomTextStyles.f12W600(),
                          ),
                        ),
                      ),
                    ),
                    _reviewTile(),
                    _reviewTile(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _reviewTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        width: 350.6,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.extraWhite,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/icons/Profile.png", height: 40, width: 40),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Jonathan Kaminga", style: CustomTextStyles.f12W300()),
                  const SizedBox(height: 4),
                  Text(
                    "Product is product is product is product is product is product is  product is product is product",
                    style: CustomTextStyles.f10W400(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
