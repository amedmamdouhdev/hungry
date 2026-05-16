import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/auth/domain/auth_services.dart';
import 'package:hungry/shared/custom_textfield.dart';

class ResetPassView extends StatefulWidget {
  const ResetPassView({super.key});

  @override
  State<ResetPassView> createState() => _ResetPassViewState();
}

class _ResetPassViewState extends State<ResetPassView> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primryColor,
      appBar: AppBar(
        backgroundColor: AppColor.primryColor,
        leadingWidth: 90.w,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 26.sp),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "No problem. Just let us know your email address and we will email you a password reset link that will allow you to choose a new one.",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: const Color.fromARGB(255, 190, 190, 190),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15.h),
                CustomTextField(
                  hint: "your email",
                  isPasswrd: false,
                  controller: emailController,
                ),
                SizedBox(height: 380.h),
                GestureDetector(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      AuthServices().resetPassword(emailController.text);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Center(
                      child: Text(
                        "Send Reset Link",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
