import 'package:flutter/material.dart';

// ignore: camel_case_types
class customIconAuth extends StatelessWidget {
  const customIconAuth({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(100),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon),
    );
  }
}
