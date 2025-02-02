import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manjushree/utils/storage_keys.dart';
import 'package:manjushree/views/auth/login_screen.dart';

import '../models/user.dart';

class CoreController extends GetxController {
  Rx<User?> currentUser = Rxn<User>();
  RxString userToken = "".obs;

  @override
  void onInit() async {
    await loadCurrentUser();
    super.onInit();
  }

  Future<void> loadCurrentUser() async {
    currentUser.value = StorageHelper.getUser();
    userToken.value = StorageHelper.getToken();
    log("current user--------------------- ${currentUser.value?.email}--");
    log("current user token------------------------${currentUser.value?.token}--");
  }

  bool isUserLoggedIn() {
    return currentUser.value != null;
  }

  void logOut() async {
    final box = GetStorage();
    await box.write(StorageKeys.USER, null);
    loadCurrentUser();
    Get.offAll(() => LogInScreen());
  }
}
