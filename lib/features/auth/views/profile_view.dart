import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Gap(120),
            Image.asset('assets/burger/image 1.png',height: 100,),
            
          ],
        ),
      ),
    );
  }
}