import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/repo/verify_otp_repo.dart';
import 'package:manjushree/utils/custom_snackbar.dart';
import 'package:manjushree/views/auth/login_screen.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class VerifyOtpScreenController extends GetxController {
  GlobalKey<FormState> verifyKey = GlobalKey<FormState>();
  RxString verificationCode = ''.obs;
  RxBool isEditing = true.obs;
  RxInt resendSeconds = 0.obs;
  Timer? resendTimer;
  String? userId;

  void onCodeChanged(String code) {
    verificationCode.value = code;
  }

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  void onCompleted(String code, String userId) async {
    isEditing.value = false;
    loading.show(message: "Please wait..");
    await VerifyOtpRepo.verifyOtp(
        userId: userId.toString(),
        code: code.toString(),
        onSuccess: (message) async {
          loading.hide();
          CustomSnackBar.success(
              title: "Register", message: "Register Successful");
          Get.offAll(() => LogInScreen());
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Register", message: message);
        });
  }
}
