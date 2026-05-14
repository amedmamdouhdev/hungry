import 'package:flutter/material.dart';

// ignore: camel_case_types
class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.weight,
  });
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, fontWeight: weight, color: color),
    );
  }
}
