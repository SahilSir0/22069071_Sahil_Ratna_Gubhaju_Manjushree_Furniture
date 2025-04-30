import 'package:flutter/material.dart';
import 'package:manjushree/utils/image_path.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(
                  image: const AssetImage(ImagePath.logo),
                  height: 150,
                )),

            // Title
            const Text(
              "Manjushree Furniture",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Description
            const Text(
              "Established with a passion for excellence, Manjushree Furniture is your trusted destination for elegant, modern, and durable furniture. "
              "We combine traditional craftsmanship with modern design to create furniture that turns houses into homes.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Mission
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Our Mission",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "To provide affordable, stylish, and high-quality furniture that enhances the comfort and beauty of every home in Nepal.",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 20),

            // Vision
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Our Vision",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "To become Nepal’s most loved furniture brand by focusing on innovation, sustainability, and customer satisfaction.",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 20),

            // Contact Information
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Contact Us",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "📍 Address: Kathmandu, Nepal\n"
              "📞 Phone: +977-9876543210\n"
              "📧 Email: support@manjushreefurniture.com",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
