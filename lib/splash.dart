import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/auth/views/login_view.dart';
import 'package:hungry/root.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    checkAuth();
  }

  Future<void> checkAuth() async {
    await Future.delayed(Duration(seconds: 2));

    User? user = FirebaseAuth.instance.currentUser;
    if (mounted) {
      if (user != null) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Root()));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginView()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primryColor,
      body: Column(
        children: [
          const SizedBox(height: 270),
          SvgPicture.asset("assets/logo/Hungry_.svg"),
          Spacer(),
          Image.asset('assets/burger/image 1.png'),
        ],
      ),
    );
  }
}
