import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/controller/auth/verify_otp_controller.dart';
import 'package:manjushree/utils/colors.dart';
import 'package:manjushree/utils/custom_text_style.dart';
import 'package:manjushree/widgets/custom/elevated_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatelessWidget {
  VerifyOtpScreen({
    super.key,
    required this.userId,
  });
  final String userId;

  final controller = Get.put(VerifyOtpScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.extraWhite,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/common/sent-mail 1.png",
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 20),
                  Text("Verify your email", style: CustomTextStyles.f16W600()),
                  const SizedBox(height: 3),
                  SizedBox(
                    width: 230,
                    child: Text(
                      "Thank you for registering. Please type the OTP as shared on your email address abc@gmail.com",
                      style: CustomTextStyles.f12W400(
                          color: AppColors.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 20),
                    child: Center(
                      child: PinCodeTextField(
                        appContext: context,
                        length: 6, // Number of digits
                        textStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 40,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          activeColor: AppColors.primaryColor,
                          selectedColor: AppColors.primaryColor,
                          inactiveColor: AppColors.lGrey,
                        ),
                        cursorColor: AppColors.lightBlue,
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.fade,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        onCompleted: (value) {
                          if (value.length == 6) {
                            controller.onCompleted(value, userId.toString());
                            print('Completed: $value');
                          } else {
                            print('Invalid verification code length');
                          }
                        },
                        onChanged: (value) {
                          print("Changed: $value");
                        },
                      ),
                    ),
                  ),
                  // Center(
                  //   child: VerificationCode(
                  //     textStyle: Theme.of(context)
                  //         .textTheme
                  //         .bodyMedium!
                  //         .copyWith(color: Theme.of(context).primaryColor),
                  //     keyboardType: TextInputType.number,
                  //     underlineColor: Colors.transparent, // Remove underline
                  //     length: 6,
                  //     itemSize: 50, // Adjust the size of each box
                  //     cursorColor: AppColors.lightBlue,
                  //     margin: const EdgeInsets.symmetric(
                  //         horizontal: 8), // Adjust spacing
                  //     onCompleted: (String value) {
                  //       if (value.length == 6) {
                  //         //controller.onCompleted(value, userId.toString());
                  //         print('Completed: $value');
                  //       } else {
                  //         print('Invalid verification code length');
                  //       }
                  //     },
                  //     onEditing: (bool value) {
                  //       controller.isEditing.value = value;
                  //       if (!value) FocusScope.of(context).unfocus();
                  //     },
                  //     boxDecoration: BoxDecoration(
                  //       border:
                  //           Border.all(color: AppColors.primeYellow, width: 2),
                  //       borderRadius: BorderRadius.circular(8), // Rounded corners
                  //       color: Colors.white, // Background color of the box
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 130,
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 35),
          child: CustomElevatedButton(title: "Submit", onTap: () {}),
        ));
  }
}
