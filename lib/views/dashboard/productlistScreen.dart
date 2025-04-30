import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  final String categoryName;

  ProductListScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$categoryName Products"),
      ),
      body: Center(
        child: Text("Showing products for $categoryName"),
      ),
    );
  }
}
