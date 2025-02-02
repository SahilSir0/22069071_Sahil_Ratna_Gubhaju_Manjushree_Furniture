// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:manjushree/views/dashboard/product_desc_screen.dart';

// import '../../utils/colors.dart';
// import '../../utils/custom_text_style.dart';
// import '../../widgets/custom/custom_textfield.dart';

// class TableScreen extends StatelessWidget {
//   const TableScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           toolbarHeight: 50,
//           backgroundColor: AppColors.extraWhite,
//           centerTitle: false,
//           leading: InkWell(
//               onTap: () {
//                 Get.back();
//               },
//               child: Icon(Icons.arrow_back)),
//           title: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [],
//             ),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               children: [
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         width: 320,
//                         child: CustomTextField(
//                           suffixIconPath: Icons.search,
//                           hint: "search",
//                           textInputAction: TextInputAction.next,
//                           textInputType: TextInputType.text,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 50,
//                         width: 50,
//                         child: Image(
//                           image: AssetImage("assets/icons/addtocart.png"),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10.0),
//                   child: SizedBox(
//                     height: 1850, // Ensure the GridView has a defined height
//                     child: GridView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: 14,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2, // Two items per row
//                               crossAxisSpacing: 10.0, // Spacing between columns
//                               mainAxisSpacing: 10.0, // Spacing between rows
//                               mainAxisExtent: 250),
//                       itemBuilder: (context, index) {
//                         return InkWell(
//                           onTap: () {
//                             Get.to(() => ProductDescScreen());
//                           },
//                           child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: AppColors.secondaryTextColor,
//                               ),
//                               height: 150, // Set the height here
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 15.0, right: 15, top: 15),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           color: const Color.fromARGB(
//                                               255, 255, 255, 255)),
//                                       height: 130,
//                                       width: Get.width / 1,
//                                       child: Image(
//                                         image: AssetImage(
//                                             "assets/common/table3.jpg"),
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 15.0, top: 5, right: 15),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text("Study Table",
//                                             style: CustomTextStyles.f12W600()),
//                                         Text(
//                                           "Comfortable and stylish table, perfect for enhancing any living space... ",
//                                           style: CustomTextStyles.f8W300(),
//                                         ),
//                                         Row(
//                                           children: [
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.only(top: 5),
//                                               child: Text(
//                                                 "NPR 35000",
//                                                 style:
//                                                     CustomTextStyles.f12W600(),
//                                               ),
//                                             ),
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
