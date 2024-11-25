import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/controller/auth/login_controller.dart';
import 'package:manjushree/utils/custom_text_style.dart';
import 'package:manjushree/views/auth/login_screen.dart';
import 'package:manjushree/widgets/custom/elevated_button.dart';

import '../../utils/validatior.dart';
import '../../widgets/custom/custom_textfield.dart';

class ConfirmNewPwScreen extends StatelessWidget {
  ConfirmNewPwScreen({super.key});
  final c = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    // Controllers and FocusNodes for each field
    List.generate(4, (_) => TextEditingController());

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 500,
                  child: Image(
                    image: AssetImage("assets/common/confirmpw.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                    right: 50,
                    left: 50,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Your new password must be different from previously used password.",
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.f12W600(),
                        ),
                        const SizedBox(height: 20), // Adds some spacing
                      ],
                    ),
                  ),
                ),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomTextField(
                      preIconPath: Icons.key,
                      hint: "New Password",
                      validator: Validators.checkEmailField,
                      controller: c.emailController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomTextField(
                      preIconPath: Icons.key,
                      hint: "Confirm New Password",
                      validator: Validators.checkEmailField,
                      controller: c.emailController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                    ),
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomElevatedButton(
                    title: "Confirm",
                    onTap: () {
                      Get.to(() => LogInScreen());
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
