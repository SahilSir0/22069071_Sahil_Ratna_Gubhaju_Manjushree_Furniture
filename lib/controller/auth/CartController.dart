// lib/controller/auth/CartController.dart
import 'package:get/get.dart';
import 'package:manjushree/models/cart.dart';
import 'package:manjushree/repo/add_cart_repo.dart';
import 'package:manjushree/repo/delete_cart_repo.dart';
import 'package:manjushree/repo/get_cart_item_repo.dart';
import 'package:manjushree/utils/custom_snackbar.dart';

class CartController extends GetxController {
  RxBool loading = RxBool(false);

  addToCart(String productId, String productSkuId, String quantity) async {
    loading.value = true;
    await AddCartRepo.addCartRepo(
        productId: productId,
        productSkuId: productSkuId,
        quantity: quantity,
        onSuccess: () {
          allCartItemsDetails.clear();
          getAllCartItems();
          CustomSnackBar.success(
              title: "Cart", message: "Add to Cart successfully");

          // // Navigate to HistoryScreen to show the updated order history
        },
        onError: (message) {
          loading.value = false;
          CustomSnackBar.error(message: message, title: "Cart");
        });
  }

  RxList<CartItem> allCartItemsDetails = <CartItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllCartItems();
  }

  getAllCartItems() async {
    loading.value = true;
    await GetCartItemRepo.getCartItemRepo(onSuccess: (cart) {
      loading.value = false;
      allCartItemsDetails.addAll(cart);
    }, onError: (message) {
      loading.value = false;
      // CustomSnackBar.error(title: "Cart", message: message);
    });
  }

  void removeCartItem(String cartItemId) async {
    loading.value = true;
    await DeleteCartRepo.deleteCartRepo(
      cartItemId: cartItemId,
      onSuccess: () {
        loading.value = false;
        allCartItemsDetails
            .removeWhere((item) => item.cartItemId == cartItemId);
        CustomSnackBar.success(
            title: "Cart", message: "Item removed from cart");
      },
      onError: (message) {
        loading.value = false;
        CustomSnackBar.error(title: "Cart", message: message);
      },
    );
  }
}
