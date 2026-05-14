import 'package:flutter/material.dart';

// ignore: camel_case_types
class CustomIconAuth extends StatelessWidget {
  const CustomIconAuth({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(100),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon),
    );
  }
}
