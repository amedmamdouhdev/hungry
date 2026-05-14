import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/auth/widget/custom_button_auth.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_textfield.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmePasswordController = TextEditingController();

    GlobalKey<FormState> glopelKye = GlobalKey();
    return Form(
      key: glopelKye,
      child: Scaffold(
        backgroundColor: AppColor.primryColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              reverse: false,
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 30),

                  //image
                  SvgPicture.asset("assets/logo/Hungry_.svg"),
                  Gap(70),
                  CustomTextField(
                    hint: 'Name',
                    isPasswrd: false,
                    controller: nameController,
                  ),
                  Gap(16),

                  CustomTextField(
                    hint: 'Email Addres',
                    isPasswrd: false,
                    controller: emailController,
                  ),
                  Gap(16),

                  CustomTextField(
                    hint: ' password',
                    isPasswrd: true,
                    controller: passwordController,
                  ),
                  Gap(16),

                  CustomTextField(
                    hint: 'Confirme Password',
                    isPasswrd: true,
                    controller: confirmePasswordController,
                  ),
                  Gap(32),

                  GestureDetector(
                    onTap: () {
                      if (glopelKye.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },

                    child: CustomButtonAuth(
                      text: 'Signup',
                      color: Colors.black,
                    ),
                  ),
                  Gap(20),
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
