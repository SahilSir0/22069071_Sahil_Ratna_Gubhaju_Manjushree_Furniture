import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/controller/auth/login_controller.dart';
import 'package:manjushree/utils/colors.dart';
import 'package:manjushree/utils/validatior.dart';
import 'package:manjushree/views/auth/forget_password_screen.dart';
import 'package:manjushree/views/auth/register_screen.dart';
import 'package:manjushree/widgets/custom/custom_textfield.dart';
import 'package:manjushree/widgets/custom/elevated_button.dart';
import '../../utils/custom_text_style.dart';
import '../../widgets/custom/custom_password_fields.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final c = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Center(
                  child: SizedBox(
                    height: Get.height / 4,
                    width: Get.width / 1.8,
                    child: const Image(
                      image: AssetImage("assets/common/logo.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Form(
                key: c.formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Log In",
                        style: CustomTextStyles.f24W600(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Please sign in to continue",
                        style: CustomTextStyles.f14W400(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Email Address",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        preIconPath: Icons.person_outline_sharp,
                        hint: "Email",
                        validator: Validators.checkEmailField,
                        controller: c.emailController,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Password",
                        style: CustomTextStyles.f14W400(),
                      ),
                      Obx(
                        () => CustomPasswordField(
                          validator: Validators.checkPasswordField,
                          hint: "Password",
                          eye: c.passwordObscure.value,
                          onEyeClick: c.onEyeCLick,
                          controller: c.passwordController,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomElevatedButton(
                        title: "Login",
                        onTap: () {if (c.formKey.currentState!.validate()) {c.onSubmit();}
                          
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have a account ? ",
                            style: CustomTextStyles.f14W400(),
                          ),
                          InkWell(
                            onTap: () {
                              Get.off(() => LogInScreen());
                            },
                            child: InkWell(
                              onTap: () {
                                Get.to(() => RegisterScreen());
                              },
                              child: Text(
                                "Sign Up",
                                style: CustomTextStyles.f14W400(
                                    color: AppColors.primaryColor),
                              ),
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Get.to(() => ForgetPasswordScreen());
                          },
                          child: Text(
                            "Forgot your password",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
