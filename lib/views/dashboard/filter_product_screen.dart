import 'package:flutter/material.dart';
import 'package:manjushree/models/categories.dart';

class FilterProductScreen extends StatelessWidget {
  
  FilterProductScreen({super.key, required this.categories});
final Categories categories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Page"),
      
      
      ),
      body: Column(children: [
        
      ],),
    );
  }
}