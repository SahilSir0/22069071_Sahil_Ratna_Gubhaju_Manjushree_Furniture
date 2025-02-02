import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjushree/controller/core_controller.dart';
import 'package:manjushree/utils/custom_text_style.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile_screen';
  ProfileScreen({super.key});

  final corController = Get.put(CoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Profile",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Image(
                          image: AssetImage(
                        "assets/icons/male.png",
                      )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0.0, left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sahil Ratna Gubhaju",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                  color: Colors.white),
                            ),
                            Text(
                              "sahilgubhaju392@gmail.com",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                height: 180,
                width: 380,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15, top: 50, bottom: 15),
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/icons/Customer.png")),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Profile Settings",
                        style: CustomTextStyles.f13W500(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 198.0),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Image(image: AssetImage("assets/icons/time.png")),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "My Orders",
                          style: CustomTextStyles.f13W500(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 232.0),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 28,
                      color: Colors.red,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "About Us",
                        style: CustomTextStyles.f13W500(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 243.6),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, top: 15, right: 15, bottom: 15),
                child: Row(
                  children: [
                    Image.asset("assets/icons/Vector.png"),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "To review",
                        style: CustomTextStyles.f13W500(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 242.1),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  corController.logOut();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 15, right: 15),
                  child: Row(
                    children: [
                      Image.asset("assets/icons/Logout.png"),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Exit",
                          style: CustomTextStyles.f13W500(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 283.5),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
