import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/controller/auth/edit_profile_controller.dart';
import 'package:manjushree/controller/core_controller.dart';
import 'package:manjushree/utils/colors.dart';
import 'package:manjushree/utils/custom_text_style.dart';
import 'package:manjushree/utils/validatior.dart';
import 'package:manjushree/widgets/custom/custom_textfield.dart';
import 'package:manjushree/widgets/custom/elevated_button.dart';

class EditProfileScreen extends StatelessWidget {
  final c = Get.put(EditProfileController());
  final coreController = Get.put(CoreController());
  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        elevation: 2,
        centerTitle: false,
        backgroundColor: AppColors.extraWhite,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text("My Details",
            style: CustomTextStyles.f14W600(color: AppColors.textColor)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: c.formKey,
          child: Column(children: [
            const SizedBox(height: 25),
            Obx(
              () => ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: (c.image.value != null && c.image.value!.path.isNotEmpty)
                    ? Image.file(
                        File(c.image.value!
                            .path), // ✅ Convert path to File object
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      )
                    : CachedNetworkImage(
                        imageUrl: c.avatarUrl.value ??
                            "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg", // ✅ Default fallback
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Image.network(
                          "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg",
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                c.pickImage();
              },
              child: Text(
                "Change Avatar",
                style:
                    CustomTextStyles.f14W600(color: AppColors.secondaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 30),
              child: Column(
                children: [
                  CustomTextField(
                      controller: c.nameController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter your Full Name",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  const SizedBox(height: 25),
                  CustomTextField(
                      controller: c.addressController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter your address",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  const SizedBox(height: 25),
                  CustomTextField(
                      controller: c.phoneController,
                      validator: Validators.checkPhoneField,
                      hint: "Enter your phone number",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  const SizedBox(height: 25),
                  CustomTextField(
                      controller: c.genderController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter your gender",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 16),
        child: SizedBox(
          height: 60,
          child: CustomElevatedButton(
              title: "Save",
              onTap: () {
                c.submit();
              }),
        ),
      ),
    );
  }
}
