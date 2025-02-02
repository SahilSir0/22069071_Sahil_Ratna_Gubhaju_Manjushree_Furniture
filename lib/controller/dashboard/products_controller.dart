import 'package:get/get.dart';
import 'package:manjushree/models/products.dart';
import 'package:manjushree/repo/get_product_repo.dart';
import 'package:manjushree/utils/custom_snackbar.dart';

class ProductsController extends GetxController {
  RxList<Product> productDetails = <Product>[].obs;

  RxBool loading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  getProducts() async {
    loading.value = true;
    await GetProductRepo.getProduct(onSuccess: (products) {
      loading.value = false;
      productDetails.addAll(products);
    }, onError: (message) {
      loading.value = false;
      CustomSnackBar.error(title: "Products", message: message);
    });
  }
}
