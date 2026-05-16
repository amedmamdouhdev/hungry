import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/auth/domain/auth_services.dart';
import 'package:hungry/features/auth/views/reset_pass_view.dart';
import 'package:hungry/features/auth/views/signup_view.dart';
import 'package:hungry/features/auth/widget/custom_button_auth.dart';
import 'package:hungry/root.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();

  String? authError;

  Future<void> login() async {
    if (_formkey.currentState!.validate()) {
      final error = await AuthServices().login(
        emailController.text,
        passwordController.text,
      );

      if (error != null) {
        setState(() {
          authError = error;
        });
      } else {
        // Navigate to the next screen or perform any desired action on successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Root()),
        );
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: _formkey,
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
                    SizedBox(height: 15.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) {
                                return ResetPassView();
                              },
                            ),
                          );
                        },
                        child: CustomText(
                          text: "Forgot password?",
                          color: Colors.white,
                          size: 16.sp,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),

                    SizedBox(height: 40.h),

                    //button => Login
                    GestureDetector(
                      onTap: () => login(),

                      child: CustomButtonAuth(
                        text: 'Login',
                        color: Colors.white,
                      ),
                    ),
                    authError == null
                        ? SizedBox()
                        : Align(
                            alignment: AlignmentGeometry.bottomLeft,
                            child: Column(
                              children: [
                                SizedBox(height: 20.h),
                                CustomText(
                                  text: authError!,
                                  color: Colors.red,
                                  size: 14.sp,
                                  weight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),

                    //divider
                    SizedBox(height: 40.h),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),

                    // sign in with Google
                    GestureDetector(
                      onTap: () async {
                        final error = await AuthServices().signinWithGoogle();

                        if (error != null) {
                          setState(() {
                            authError = error;
                          });
                        } else {
                          // Navigator.pushReplacementNamed(context, "/main");
                        }
                      },
                      child: Container(
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
                    ),
                    SizedBox(height: 20.h),
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
