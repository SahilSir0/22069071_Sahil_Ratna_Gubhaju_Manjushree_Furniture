import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/controller/core_controller.dart';
import 'package:manjushree/utils/custom_text_style.dart';
import 'package:manjushree/views/auth/about_screen.dart';
import 'package:manjushree/views/dashboard/edit_profile.dart';
import 'package:manjushree/views/dashboard/history_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile_screen';
  ProfileScreen({super.key});

  final corController = Get.put(CoreController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Card
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              width: screenWidth * 0.9,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Obx(
                    () => Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: corController.currentUser.value?.image != null
                              ? NetworkImage(
                                  corController.currentUser.value!.image!)
                              : const NetworkImage(
                                  "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  SizedBox(
                    width: screenWidth * 0.5,
                    child: Obx(
                      () => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            corController.currentUser.value!.name.toString(),
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                                color: Colors.white),
                          ),
                          Text(
                            corController.currentUser.value!.email.toString(),
                            style: const TextStyle(
                                fontSize: 12,
                                fontFamily: "Poppins",
                                color: Colors.white),
                          ),
                          Text(
                            corController.currentUser.value!.phoneNumber
                                .toString(),
                            style: const TextStyle(
                                fontSize: 12,
                                fontFamily: "Poppins",
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Profile Options
            profileItem(
              icon: "assets/icons/Customer.png",
              label: "Profile Settings",
              onTap: () => Get.to(() => EditProfileScreen()),
            ),
            profileItem(
              icon: "assets/icons/time.png",
              label: "My Orders",
              onTap: () => Get.to(() => HistoryScreen()),
            ),
            profileItem(
              iconWidget:
                  const Icon(Icons.info_outline, size: 28, color: Colors.red),
              label: "About Us",
              onTap: () => Get.to(AboutUsScreen()),
            ),

            profileItem(
              icon: "assets/icons/Logout.png",
              label: "Exit",
              onTap: () => corController.logOut(),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileItem({
    String? icon,
    Widget? iconWidget,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
        child: Row(
          children: [
            iconWidget ??
                Image.asset(
                  icon ?? "",
                  height: 24,
                  width: 24,
                ),
            const SizedBox(width: 20),
            Text(label, style: CustomTextStyles.f13W500()),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_right, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
