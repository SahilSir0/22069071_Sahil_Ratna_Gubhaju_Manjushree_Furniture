import 'package:get/get.dart';
import 'package:manjushree/controller/core_controller.dart';
import 'package:manjushree/models/categories.dart';
import 'package:manjushree/repo/get_category_repo.dart';
import 'package:manjushree/utils/custom_snackbar.dart';

class HomeScreenController extends GetxController {
  RxList<Categories> categoriesDetails = <Categories>[].obs;

  RxBool loading = RxBool(false);

  final coreController = Get.find<CoreController>();
  Rxn<String> avatarUrl = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    avatarUrl.value = coreController.currentUser.value?.image ?? "";
    getCategoryDetails();
  }

  getCategoryDetails() async {
    loading.value = true;
    await GetCategoryRepo.getCategory(onSuccess: (categories) {
      loading.value = false;
      categoriesDetails.addAll(categories);
    }, onError: (message) {
      loading.value = false;
      CustomSnackBar.error(title: "categories", message: message);
    });
  }
}
