import 'package:flutter/material.dart';
import 'package:manjushree/models/categories.dart';
import 'package:manjushree/views/dashboard/productlistScreen.dart';

class FilterProductScreen extends StatelessWidget {
  FilterProductScreen({super.key, required this.categories});

  final List<Categories> categories;

  // Dummy product screen for the selected category
  void navigateToCategoryProducts(BuildContext context, String categoryName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductListScreen(categoryName: categoryName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Page"),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index].name ?? 'Unknown Category'),
            onTap: () {
              // Navigate to a different screen based on the category name
              print("Selected: ${categories[index].name}");
              // Example: Navigate to a product screen for the selected category
              navigateToCategoryProducts(context, categories[index].name ?? 'Unknown Category');
            },
          );
        },
      ),
    );
  }
}