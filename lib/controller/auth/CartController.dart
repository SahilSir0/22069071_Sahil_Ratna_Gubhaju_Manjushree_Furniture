// lib/controller/auth/CartController.dart
import 'package:get/get.dart';
import 'package:manjushree/models/products.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  void addToCart(Product product) {
    cartItems.add(product);
    Get.snackbar("Success", "Item added to cart");
  }

  void removeFromCart(Product product) {
    print("Removing product: ${product.productName}");
    cartItems.remove(product);
    print("Remaining items in cart: ${cartItems.length}");
  }

  void clearCart() {
    cartItems.clear();
  }

  double get totalPrice => cartItems.fold(
      0, (sum, item) => sum + double.parse(item.productPrice ?? '0'));
}
