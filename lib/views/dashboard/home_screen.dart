import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/controller/dashboard/products_controller.dart';
import 'package:manjushree/models/categories.dart';
import 'package:manjushree/models/products.dart';
import 'package:manjushree/utils/custom_text_style.dart';
import 'package:manjushree/views/dashboard/cart_screen.dart';
import 'package:manjushree/views/dashboard/chat_bot_screen.dart';
import 'package:manjushree/views/dashboard/product_desc_screen.dart';
import 'package:manjushree/views/dashboard/profile_screen.dart';

import 'package:manjushree/widgets/custom/custom_textfield.dart';
import '../../controller/dashboard/home_screen_controller.dart';
import '../../utils/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final c = Get.put(HomeScreenController());
  final product = Get.put(ProductsController());
  final List<String> imgList = [
    'assets/common/1.png',
    'assets/common/2.png',
    'assets/common/3.png',
    'assets/common/4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: AppColors.extraWhite,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "MANJUSHREE FURNITURE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        getGreeting(),
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, top: 10),
                    child: SizedBox(
                      width: 50,
                      height: 100,
                      child: Image.network(
                          "https://cdn-icons-png.flaticon.com/512/219/219983.png"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 15, right: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      suffixIconPath: Icons.search,
                      hint: "Search",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      // Navigate to the CartScreen when implemented
                      Get.to(() => CartScreen());
                    },
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.shopping_cart,
                              color: Colors.white),
                        ),
                        // Optional: Badge indicator
                        // Positioned(
                        //   right: 0,
                        //   child: Container(
                        //     padding: EdgeInsets.all(2),
                        //     decoration: BoxDecoration(
                        //       color: Colors.red,
                        //       shape: BoxShape.circle,
                        //     ),
                        //     child: Text("2", style: TextStyle(fontSize: 10, color: Colors.white)),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Spacing before slider

              // Carousel Slider widget
              CarouselSlider(
                options: CarouselOptions(
                  height: 180.0,
                  autoPlay: true,
                  enlargeCenterPage: true,

                  aspectRatio: 2.0, // Aspect ratio adjustment
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                items: imgList.map((item) {
                  return Container(
                    margin: EdgeInsets.all(0.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(item),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("Categories",
                          style: CustomTextStyles.f12W600())),
                ],
              ),
              const SizedBox(height: 10),
              Obx(
                () => (c.loading.value)
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: 50,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: c.categoriesDetails.length,
                          itemBuilder: (context, index) {
                            Categories category = c.categoriesDetails[index];
                            return CategoryButton(categories: category);
                          },
                        ),
                      ),
              ),

              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended for you",
                      style: CustomTextStyles.f12W600(),
                    ),
                    InkWell(
                      child: Text(
                        "View all",
                        style: CustomTextStyles.f10W300(),
                        selectionColor: Colors.red,
                      ),
                      onTap: () {
                        Get.to(ProfileScreen());
                      },
                    )
                  ],
                ),
              ),
              Obx(
                () => (c.loading.value)
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: 800, // Ensure the GridView has a defined height
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: product.productDetails.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // Two items per row
                                  crossAxisSpacing:
                                      10.0, // Spacing between columns
                                  mainAxisSpacing: 10.0, // Spacing between rows
                                  mainAxisExtent: 250),
                          itemBuilder: (context, index) {
                            final Product products =
                                product.productDetails[index];
                            return RecommendationWidget(
                              products: products,
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(() => ChatBotScreen());
        },
        child: Container(
          child: Image(
            image: AssetImage("assets/common/chatbot.gif"),
            height: 50,
            width: 50,
          ),
        ),
      ),
    );
  }

  String getGreeting() {
    int hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}

class RecommendationWidget extends StatelessWidget {
  const RecommendationWidget({
    super.key,
    required this.products,
  });
  final Product products;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDescScreen(
              products: products,
            ));
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.secondaryTextColor,
          ),
          height: 150,
          width: Get.width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                child: CachedNetworkImage(
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  fit: BoxFit.fill,
                  height: 130,
                  width: 800,
                  imageUrl: products.productImage ?? "",
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/common/blank-image.jpg',
                    height: 130,
                    width: 800,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 5, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(products.productName ?? "",
                        style: CustomTextStyles.f12W600()),
                    Text(
                      products.productPrice ?? "",
                      style: CustomTextStyles.f8W300(),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            products.categoryName ?? "",
                            style: CustomTextStyles.f12W600(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

// Category Button widget
class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.categories,
  }) : super(key: key);
  final Categories categories;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 40,
            width: 110,
            decoration: BoxDecoration(
              color: AppColors.primaryColor, // Red background color
              borderRadius: BorderRadius.circular(10),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                children: [
                  CachedNetworkImage(
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    fit: BoxFit.fill,
                    height: 20,
                    imageUrl: categories.image ?? "",
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/common/blank-image.jpg',
                      height: 40,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    categories.name ?? "",
                    style:
                        CustomTextStyles.f12W600(color: AppColors.extraWhite),
                  ),
                ],
              ),
            ]),
          ),
        ),
        SizedBox(
          width: 14,
        )
      ],
    );
  }
}
