import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/repo/register_repo.dart';
import 'package:manjushree/utils/custom_snackbar.dart';
import 'package:manjushree/views/auth/verify_otp_screen.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class RegisterController extends GetxController {
  RxBool passwordObscure = true.obs;
  RxBool confirmpasswordObscure = true.obs;

  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmPassword = TextEditingController();

  void onEyeCLickPassword() {
    passwordObscure.value = !passwordObscure.value;
  }

  void onEyeCLickConfirm() {
    confirmpasswordObscure.value = !confirmpasswordObscure.value;
  }

  final formKey = GlobalKey<FormState>();

  var selectedGender = "male".obs;

  final selectedSubscription = ''.obs;
  // final selectedPrice = '100'.obs;
  final subscriptionEndDate = DateTime.now().obs;

  void updateSubscription(String payment) {
    selectedSubscription.value = payment;
  }

  RxInt selectedPrice = 10.obs;

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "Please wait..");
      await RegisterRepo.register(
          name: nameController.text,
          address: addressController.text,
          phone: phoneController.text,
          gender: selectedGender.value,
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: confirmPassword.text,
          onSuccess: (message, userId) async {
            loading.hide();
            Get.offAll(() => VerifyOtpScreen(
                  userId: userId,
                ));
            CustomSnackBar.success(
                title: "Register Successful!!",
                message: "Please check your email for verification.");
          },
          onError: (message) {
            loading.hide();
            CustomSnackBar.error(title: "Register", message: message);
          });
    }
  }
}
