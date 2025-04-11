import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manjushree/controller/core_controller.dart';
import 'package:manjushree/controller/dashboard/profile_screen_controller.dart';
import 'package:manjushree/models/user.dart';
import 'package:manjushree/repo/edit_user_repo.dart';
import 'package:manjushree/utils/custom_snackbar.dart';
import 'package:manjushree/utils/storage_keys.dart';

import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class EditProfileController extends GetxController {
  final coreController = Get.find<CoreController>();
  final profileController = Get.put(ProfileScreenController());
  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }

  void getUserDetails() {
    var user = Get.find<CoreController>().currentUser.value;
    if (user != null) {
      nameController.text = user.name ?? "";
      addressController.text = user.address ?? "";
      genderController.text = user.gender ?? "";
      phoneController.text = user.phoneNumber ?? "";
      avatarUrl.value = user.image ?? "";
    }
  }

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final picker = ImagePicker();

  Rxn<User> user = Rxn<User>();
  Rxn<File> image = Rxn<File>();
  Rxn<String> avatarUrl = Rxn<String>();

  void pickImage() async {
    log("Picking image");
    final pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxHeight: 500,
        maxWidth: 500);

    if (pickedImage != null) {
      image.value = File(pickedImage.path);
    }
  }

  String? getImageString() {
    if (image.value == null) return null;

    File file = File(image.value!.path);
    List<int> bytes = file.readAsBytesSync();

    String extension = image.value!.path.split('.').last.toLowerCase();
    String mimeType = (extension == "png")
        ? "image/png"
        : "image/jpeg";

    
    String base64Image = "data:$mimeType;base64,${base64Encode(bytes)}";
    return base64Image;
  }

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);
  void submit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "Please wait..");
      log("Submitting profile update: Name: ${nameController.text}, Phone: ${phoneController.text}, Address: ${addressController.text} Gender: ${genderController.text}");

      await EditProfileRepo.editProfile(
        userId: coreController.currentUser.value!.userId.toString(),
        image: image.value,
        name: nameController.text,
        address: addressController.text,
        phoneNumber: phoneController.text,
        gender: genderController.text,
        onSuccess: (user) async {
          loading.hide();
          final box = GetStorage();
          if (user.token == null) {
            user.token = coreController.currentUser.value?.token;
          }
          await box.write(StorageKeys.USER, json.encode(user.toJson()));
          coreController.currentUser.value = user;
          getUserDetails();
          Get.find<CoreController>().loadCurrentUser();
          Get.back();
          CustomSnackBar.success(
              title: "Update Profile", message: "Profile update Successful");
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Profile", message: message);
        },
      );
    }
  }
}
