import 'package:flutter/material.dart';
import 'package:hungry/shared/custom_text.dart';

// ignore: camel_case_types
class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({super.key, required this.text, required this.color});
  final String text;

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: CustomText(
          text: "Login",
          weight: FontWeight.bold,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
