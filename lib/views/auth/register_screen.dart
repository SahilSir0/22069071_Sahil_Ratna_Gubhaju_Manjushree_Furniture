import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/controller/auth/register_controller.dart';
import 'package:manjushree/utils/colors.dart';
import 'package:manjushree/utils/custom_text_style.dart';
import 'package:manjushree/views/auth/login_screen.dart';
import 'package:manjushree/widgets/custom/custom_radio_button.dart';
import 'package:manjushree/widgets/custom/custom_textfield.dart';
import 'package:manjushree/widgets/custom/elevated_button.dart';

import '../../widgets/custom/custom_password_fields.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final c = Get.put(RegisterController());

  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Center(
                    child: const Image(
                      image: AssetImage(
                        "assets/common/logo.png",
                      ),
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: c.formKey,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 18.0, right: 18, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create New Account",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor),
                    ),
                    Text(
                      "Don't think twice, Choose us.",
                      style: CustomTextStyles.f14W400(
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Full Name",
                      style: CustomTextStyles.f14W400(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      preIconPath: Icons.person_outline_sharp,
                      hint: "Full Name",
                      controller: c.nameController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Address",
                      style: CustomTextStyles.f14W400(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      preIconPath: Icons.location_on,
                      hint: "Address",
                      controller: c.addressController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Phone No.",
                      style: CustomTextStyles.f14W400(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      preIconPath: Icons.email,
                      hint: "Phone",
                      controller: c.phoneController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Email",
                      style: CustomTextStyles.f14W400(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      preIconPath: Icons.email,
                      hint: "Email",
                      controller: c.emailController,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      textInputType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Gender",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomRadioWidget(
                            title: "Male",
                            value: "male",
                            groupValue: c.selectedGender.value,
                            onChange: (val) {
                              c.selectedGender.value = "male";
                            },
                          ),
                          CustomRadioWidget(
                            title: "Female",
                            value: "female",
                            groupValue: c.selectedGender.value,
                            onChange: (val) {
                              c.selectedGender.value = "female";
                            },
                          ),
                          CustomRadioWidget(
                            title: "Others",
                            value: "others",
                            groupValue: c.selectedGender.value,
                            onChange: (val) {
                              c.selectedGender.value = "others";
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Password",
                      style: CustomTextStyles.f14W400(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx(
                      () => CustomPasswordField(
                        hint: "Password",
                        eye: c.passwordObscure.value,
                        onEyeClick: c.onEyeCLickPassword,
                        controller: c.passwordController,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Confirm Password",
                      style: CustomTextStyles.f14W400(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx(
                      () => CustomPasswordField(
                        hint: "Confirm Password",
                        eye: c.confirmpasswordObscure.value,
                        onEyeClick: c.onEyeCLickConfirm,
                        controller: c.confirmPassword,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomElevatedButton(
                      title: 'Next',
                      onTap: () {
                        // Get.to(() => SubscriptionScreen());
                        log("pending subscription");
                        c.onSubmit();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: CustomTextStyles.f14W400(),
                        ),
                        InkWell(
                          onTap: () {
                            Get.off(LogInScreen());
                          },
                          child: Text(
                            " Log In",
                            style: CustomTextStyles.f14W400(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
