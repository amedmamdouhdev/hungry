import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/auth/views/login_view.dart';
import 'package:hungry/features/auth/views/profile_view.dart';
// import 'package:hungry/features/auth/views/login_view.dart';
import 'package:hungry/features/auth/views/signup_view.dart';
import 'package:hungry/root.dart';
import 'package:hungry/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hungry App',

        home: Splash(),
      ),
    );
  }
}
