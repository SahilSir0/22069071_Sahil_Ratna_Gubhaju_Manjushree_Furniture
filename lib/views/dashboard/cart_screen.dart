import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/utils/colors.dart';
import 'package:manjushree/utils/custom_text_style.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        backgroundColor: AppColors.extraWhite,
        centerTitle: false,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.keyboard_arrow_left)),
        title: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Manjushree Furniture"),
                  Image(image: AssetImage("assets/icons/can.png"))
                ],
              ),
              Text(
                "Shopping Cart",
                style: CustomTextStyles.f12W300(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
