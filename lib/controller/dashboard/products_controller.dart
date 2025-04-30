import 'package:get/get.dart';
import 'package:manjushree/models/products.dart';
import 'package:manjushree/repo/get_product_repo.dart';
import 'package:manjushree/utils/custom_snackbar.dart';

class ProductsController extends GetxController {
  RxList<Product> productDetails = <Product>[].obs;

  RxBool loading = RxBool(false);
  var selectedCategory = ''.obs;

  void toggleSelection(String category) {
    if (selectedCategory.value == category) {
      selectedCategory.value = ''; // Deselect the category
    } else {
      selectedCategory.value = category;
    }
    print("Selected category: ${selectedCategory.value}"); // Debug log
    filterProductsByCategory(); // Trigger product filtering
  }

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

  getAllProducts({String? category}) async {
    loading.value = true;
    await GetProductRepo.getProduct(onSuccess: (products) {
      loading.value = false;
      if (category != null && category.isNotEmpty) {
        productDetails.assignAll(
            products.where((product) => product.categoryName == category));
      } else {
        productDetails.assignAll(products);
      }
    }, onError: (message) {
      loading.value = false;
      CustomSnackBar.error(message: message, title: "Product Fetch Error");
    });
  }

  void filterProductsByCategory() {
    if (selectedCategory.value.isEmpty) {
      getAllProducts(); // No category selected -> get all products
    } else {
      getAllProducts(
          category: selectedCategory.value); // Filter by selected category
    }
  }
}
