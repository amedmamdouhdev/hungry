import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/auth/views/signup_view.dart';
import 'package:hungry/features/auth/widget/custom_button_auth.dart';
import 'package:hungry/features/home/view/home_view.dart';
import 'package:hungry/root.dart';
import 'package:hungry/shared/custom_icon_auth.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_textfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> glopalKey = GlobalKey();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: glopalKey,
        child: Scaffold(
          backgroundColor: AppColor.primryColor,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 120.h),

                    //image
                    SvgPicture.asset("assets/logo/Hungry_.svg"),

                    SizedBox(height: 8.h),

                    //text=> welcom to come back,please login'
                    CustomText(
                      text: 'Welcome back , try fast food again',
                      color: Colors.white.withAlpha(200),
                      size: 14.sp,
                      weight: FontWeight.w600,
                    ),

                    SizedBox(height: 80.h),

                    // text=> email
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: CustomText(
                        text: "Email",
                        color: Colors.white,
                        size: 14.sp,
                        weight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),

                    //first textField => Email
                    CustomTextField(
                      hint: 'Email address',
                      isPasswrd: false,
                      controller: emailController,
                    ),
                    SizedBox(height: 10.h),

                    // text=> password
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: CustomText(
                        text: "Password",
                        color: Colors.white,
                        size: 14.sp,
                        weight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    // secand textField => paswword
                    CustomTextField(
                      hint: 'Password',
                      isPasswrd: true,
                      controller: passwordController,
                    ),

                    SizedBox(height: 40.h),

                    //button => Login
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return Root();
                            },
                          ),
                        );
                      },

                      child: CustomButtonAuth(
                        text: 'Login',
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 20.h),

                    //text =>Have  account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'Don’t have an account? ',
                          color: Colors.white,
                          weight: FontWeight.w400,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) {
                                  return SignupView();
                                },
                              ),
                            );
                          },
                          child: CustomText(
                            text: 'Signup',
                            color: Colors.white,
                            size: 16.sp,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),

                    //divider
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Divider(thickness: 0.7),
                    ),

                    //or
                    CustomText(
                      text: "OR",
                      color: Colors.white,
                      size: 20.sp,
                      weight: FontWeight.bold,
                    ),
                    Gap(20.h),

                    // sign in with Google
                    Container(
                      height: 55.h,
                      width: 350.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/logo/search.png",
                            width: 35.w,
                            height: 35.h,
                          ),
                          Gap(10.w),
                          CustomText(
                            text: "Google",
                            color: Colors.black,
                            size: 18,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
