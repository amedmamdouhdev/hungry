import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/auth/domain/auth_services.dart';
import 'package:hungry/features/auth/views/login_view.dart';
import 'package:hungry/features/auth/widget/custom_button_auth.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_textfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmePasswordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();

  String? authError;
  Future<void> signup() async {
    if (_formkey.currentState!.validate()) {
      final error = await AuthServices().signup(
        emailController.text,
        passwordController.text,
      );

      if (error != null) {
        setState(() {
          authError = error;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Please verify your email before logging in."),
          ),
        );

        Future.delayed(Duration(seconds: 3), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => LoginView()),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        backgroundColor: AppColor.primryColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),

                  //image
                  SvgPicture.asset("assets/logo/Hungry_.svg"),
                  Gap(70.h),
                  CustomTextField(
                    hint: 'Name',
                    isPasswrd: false,
                    controller: nameController,
                  ),
                  Gap(16.h),

                  CustomTextField(
                    hint: 'Email Addres',
                    isPasswrd: false,
                    controller: emailController,
                  ),
                  Gap(16.h),

                  CustomTextField(
                    hint: ' password',
                    isPasswrd: true,
                    controller: passwordController,
                  ),
                  Gap(16.h),

                  CustomTextField(
                    hint: 'Confirme Password',
                    isPasswrd: true,
                    controller: confirmePasswordController,
                  ),
                  Gap(32.h),

                  GestureDetector(
                    onTap: () {
                      signup();
                    },

                    child: CustomButtonAuth(
                      text: 'Sign Up',
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
                  Gap(40.h),
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
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Have an Account? ',
                        color: Colors.white,
                        weight: FontWeight.w400,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: CustomText(
                          text: 'Login',
                          color: Colors.white,
                          size: 16,
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
    );
  }
}
