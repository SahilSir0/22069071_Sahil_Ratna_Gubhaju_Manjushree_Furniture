import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/controller/auth/login_controller.dart';
import 'package:manjushree/utils/custom_text_style.dart';
import 'package:manjushree/views/auth/confirm_new_pw_screen.dart';
import 'package:manjushree/widgets/custom/elevated_button.dart';

class ForgetPasswordScreenTwo extends StatelessWidget {
  ForgetPasswordScreenTwo({super.key});
  final c = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    // Controllers and FocusNodes for each field
    final List<TextEditingController> controllers =
        List.generate(4, (_) => TextEditingController());
    final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());
    final List<Color> borderColors = List.generate(4, (_) => Colors.grey);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 500,
              child: Image(
                image: AssetImage("assets/common/code.png"),
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
                      "Please enter the 4 digit code sent to abvs@gmail.com",
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.f12W600(),
                    ),
                    const SizedBox(height: 20), // Adds some spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        return SizedBox(
                          width: 50, // Square dimensions
                          height: 50,
                          child: TextFormField(
                            controller: controllers[index],
                            focusNode: focusNodes[index],
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: borderColors[
                                      index], // Initial border color
                                ),
                              ),
                              contentPadding: EdgeInsets.zero,
                              counterText: "", // Removes the "0/1" counter
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 1, // Limit to a single digit
                            style: CustomTextStyles.f12W600(),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomElevatedButton(
                title: "Verify",
                onTap: () {
                  Get.to(() => ConfirmNewPwScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
