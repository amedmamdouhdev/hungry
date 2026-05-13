import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/auth/views/signup_view.dart';
import 'package:hungry/features/auth/widget/custom_bouton_auth.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_textfield.dart';
import 'package:hungry/shared/custon_icon_auth.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> glopelKye = GlobalKey();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: glopelKye,
        child: Scaffold(
          backgroundColor: AppColor.primryColor,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(height: 120),

                    //image
                    SvgPicture.asset("assets/logo/Hungry_.svg"),

                    SizedBox(height: 8),

                    //text=> welcom to come back,please login'
                    custom_text(
                      text: 'welcom back,try fast food',
                      color: Colors.white.withAlpha(200),
                      size: 14,
                      weight: FontWeight.w600,
                    ),

                    SizedBox(height: 80),

                    // text=> email
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: custom_text(
                        text: "Email",
                        color: Colors.white,
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),

                    //first textField => Email
                    CustomTextField(
                      hint: 'Email addres',
                      isPasswrd: false,
                      controller: emailController,
                    ),
                    SizedBox(height: 10),

                    // text=> password
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: custom_text(
                        text: "Password",
                        color: Colors.white,
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 4),

                    // secand textField => paswword
                    CustomTextField(
                      hint: 'Password',
                      isPasswrd: true,
                      controller: passwordController,
                    ),

                    SizedBox(height: 40),

                    //button => Login
                    GestureDetector(
                      onTap: () {
                        
                      },

                      child: customButtonAuth(
                        text: 'Login',
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: 20),

                    //text =>Have  account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        custom_text(
                          text: 'Don’t have an account? ',
                          color: Colors.white,
                          weight: FontWeight.w400,
                        ),
                        GestureDetector(
                          onTap: (){
                           
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) {
                                return SignupView();
                              },
                            ),
                          );
                        }                          ,
                          child: custom_text(
                            text: 'Signup',
                            color: Colors.white,
                            size: 16,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    //divider
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Divider(thickness: 0.7),
                    ),

                    //or
                    custom_text(
                      text: "OR",
                      color: Colors.white,
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                    Gap(20),

                    // sign Googel ANd face
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customIconAuth(icon: Icons.facebook),
                        Gap(16),
                        customIconAuth(icon: Icons.apple),
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
