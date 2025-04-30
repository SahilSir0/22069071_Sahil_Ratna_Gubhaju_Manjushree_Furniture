import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/controller/dashboard/home_screen_controller.dart';
import 'package:manjushree/controller/dashboard/products_controller.dart';
import 'package:manjushree/views/dashboard/product_desc_screen.dart';
import 'package:manjushree/widgets/custom/elevated_button.dart';

class ProductListPage extends StatelessWidget {
  final String? category;

  const ProductListPage({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductsController());

    // Call filtering after the UI is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getAllProducts(category: category);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.productDetails.isEmpty) {
          return const Center(child: Text('No products found.'));
        }

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            itemCount: controller.productDetails.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 10,
              childAspectRatio: 0.61,
            ),
            itemBuilder: (context, index) {
              final product = controller.productDetails[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.network(
                        product.productImage ?? '',
                        height: 130,
                        width: double.infinity,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.image_not_supported),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.productName ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Rs. ${product.productPrice ?? ''}',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 14),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: double.infinity,
                          child: CustomElevatedButton(
                              title: "See Details",
                              onTap: () {
                                Get.to(
                                    () => ProductDescScreen(products: product));
                              })),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
