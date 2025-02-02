import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/controller/auth/order_controller.dart';
import 'package:manjushree/models/products.dart';
import 'package:manjushree/utils/colors.dart';
import 'package:manjushree/utils/custom_text_style.dart';
import 'package:manjushree/utils/validatior.dart';
import 'package:manjushree/views/dashboard/order_detail_screen.dart';
import 'package:manjushree/widgets/custom/elevated_button.dart';

import '../../widgets/custom/custom_textfield.dart';

class ProductDescScreen extends StatelessWidget {
  ProductDescScreen({super.key, required this.products});

  final Product products;
  final c = Get.put(OrderScreenController());

  void calculateTotal(double price, int quantity) {
    double totalAmountCost = price * quantity;
    print("Total Amount : \$${totalAmountCost}");
    c.totalAmount.value = totalAmountCost;
    if (
        // ignore: unnecessary_null_comparison
        c.totalAmount.value != null) {
      Get.to(() => OrderDetailsScreen(
          totalamount: c.totalAmount.value,
          quantity: c.quantityController.text,
          shiftingAddress: c.shippingAddressController.text,
          products: products));
    } else {
      print("Total Amount is null. PLease calculate it First");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 320,
                        child: CustomTextField(
                          suffixIconPath: Icons.search,
                          hint: "search",
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Image(
                          image: AssetImage("assets/icons/addtocart.png"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              CachedNetworkImage(
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                fit: BoxFit.fill,
                height: 250,
                width: 800,
                imageUrl: products.productImage ?? "",
                errorWidget: (context, url, error) => Image.asset(
                  'assets/common/blank-image.jpg',
                  height: 130,
                  width: 800,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10),
              Text(
                products.productName ?? "",
                style: CustomTextStyles.f14W600(),
              ),
              Text(
                products.description ?? "",
                style: CustomTextStyles.f12W400(),
                textAlign: TextAlign.justify,
              ),
              Text("Quantity: ${products.quantity}"),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: Get.width / 2.3,
                        child: CustomElevatedButton(
                          title: "Add to cart",
                          onTap: () {},
                        ),
                      ),
                      SizedBox(
                        width: Get.width / 2.3,
                        child: CustomElevatedButton(
                          title: "Buy Now",
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (builder) {
                                  return SingleChildScrollView(
                                    child: Form(
                                        key: c.formKey,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 25,
                                              right: 16,
                                              left: 16,
                                              bottom: 25),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 18),
                                              Text("No of people",
                                                  style: CustomTextStyles
                                                      .f14W600()),
                                              const SizedBox(height: 10),
                                              CustomTextField(
                                                  controller: c
                                                      .shippingAddressController,
                                                  validator: Validators
                                                      .checkFieldEmpty,
                                                  hint: "Shipping address",
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  textInputType:
                                                      TextInputType.text),
                                              const SizedBox(height: 18),
                                              CustomTextField(
                                                  controller:
                                                      c.quantityController,
                                                  validator: Validators
                                                      .checkFieldEmpty,
                                                  hint: "quantity",
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  textInputType:
                                                      TextInputType.number),
                                              const SizedBox(height: 100),
                                              CustomElevatedButton(
                                                  title: "Continue",
                                                  onTap: () {
                                                    if (products.productPrice !=
                                                        null) {
                                                      calculateTotal(
                                                          double.parse(products
                                                              .productPrice!),
                                                          int.parse(c
                                                              .quantityController
                                                              .text));
                                                    } else {
                                                      // Handle the case when the property price is null
                                                      print(
                                                          "Property price is null. Please provide a valid price.");
                                                    }
                                                  }),
                                            ],
                                          ),
                                        )),
                                  );
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                child: Container(
                  height: 270,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.lGrey,
                  ),
                  child: Stack(
                    children: [
                      // Main grey container
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.lGrey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      // White background for the text
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15, top: 15),
                            child: Container(
                              width: 360,
                              height: 40,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 11.0),
                              decoration: BoxDecoration(
                                color: AppColors.extraWhite,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "Ratings & Reviews",
                                style: CustomTextStyles.f12W600(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: 350.6,
                              height: 80,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 11.0),
                              decoration: BoxDecoration(
                                color: AppColors.extraWhite,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image:
                                        AssetImage("assets/icons/Profile.png"),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          "Jonathan Kaminga",
                                          style: CustomTextStyles.f12W300(),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 0.6),
                                        child: SizedBox(
                                          width: 300,
                                          child: Text(
                                            "Product is product is product is product is product is product is  product is product is product",
                                            style: CustomTextStyles.f10W400(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 15.0, left: 15),
                            child: Container(
                              width: 350.6,
                              height: 80,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 11.0),
                              decoration: BoxDecoration(
                                color: AppColors.extraWhite,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image:
                                        AssetImage("assets/icons/Profile.png"),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          "Jonathan Kaminga",
                                          style: CustomTextStyles.f12W300(),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 0.6),
                                        child: SizedBox(
                                          width: 300,
                                          child: Text(
                                            "Product is product is product is product is product is product is  product is product is product",
                                            style: CustomTextStyles.f10W400(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
