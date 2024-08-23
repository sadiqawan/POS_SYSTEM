import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos/componants/custom_circular_button.dart';
import 'package:pos/componants/custtom_text_feild.dart';
import 'package:pos/const/exe.dart';
import 'package:pos/controller/auth_controller/auth_controller.dart';
import 'package:pos/view/app_views/registration_view/registration_view.dart';
import '../../../const/text_style.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final userEmailController = TextEditingController();
  final passwordController = TextEditingController();
  AuthController controller = Get.put(AuthController());
  @override
  void dispose() {
    userEmailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          // Added SingleChildScrollView here
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.height,
              Text(
                'Welcome Back!',
                style: kHeading1B,
              ),
              Text(
                'Start working now',
                style: kTitle2.copyWith(),
              ),
              Image.asset(
                'assets/images/icon_logo2.png',
                height: 270.h,
              ),
              CustomTextFeild(
                hint: 'Email',
                controller: userEmailController,
                icon: Icons.email_sharp,
              ),
              10.height,
              CustomTextFeild(
                hint: 'Password',
                controller: passwordController,
                icon: Icons.lock,
              ),
              20.height,
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password',
                  style: kTitle2.copyWith(fontSize: 12.sp),
                ),
              ),
              30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Sign In',
                    style: kTitle2.copyWith(),
                  ),
                  SizedBox(width: 10.w),
                  CustomCircularButton(
                    icon: Icons.arrow_forward,
                    onTap: () {
                      controller.login(
                        userEmailController.text.trim(),
                        passwordController.text.trim(),
                      );

                      print('hi');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'DON\'T YOU HAVE AN ACCOUNT? ',
                    style: kBodyStyle2.copyWith(),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const RegistrationView());
                      // Get.to(()=> const SignupView());
                    },
                    child: Text(
                      'SIGN UP!',
                      style: kBodyStyle1B.copyWith(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
