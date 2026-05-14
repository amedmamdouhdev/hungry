import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/auth/views/login_view.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => LoginView()),
      );
    });
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
