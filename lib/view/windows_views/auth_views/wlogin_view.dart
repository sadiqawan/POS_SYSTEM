import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos/componants/custom_circular_button.dart';
import 'package:pos/const/cont_colors.dart';
import 'package:pos/const/exe.dart';
import 'package:pos/const/text_style.dart';
import 'package:pos/controller/auth_controller/auth_controller.dart';
import 'package:pos/view/windows_views/auth_views/wsignup_view.dart';

class WloginView extends StatelessWidget {
  const WloginView({super.key});

  @override
  Widget build(BuildContext context) {
    final userEmailController = TextEditingController();
    final passwordController = TextEditingController();
    AuthController controller = Get.put(AuthController());

    return Scaffold(
      backgroundColor: kOrange,
      body: Center(
        child: Container(
          height: height / 1.5,
          width: width / 2,
          decoration: BoxDecoration(
              color: kOrange.shade50, borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Back!',
                style: kSmallStyle1.copyWith(color: kOrange, fontSize: 5.sp),
              ),
              Image.asset(
                'assets/images/icon_logo2.png',
                height: height / 7,
              ),
              20.height,
              _textFeild(
                controller: userEmailController,
                hint: 'Email',
                preIcon: Icons.email_outlined,
              ),
              10.height,
              _textFeild(
                controller: passwordController,
                hint: 'Password',
                preIcon: Icons.lock,
              ),
              10.height,
              CustomCircularButton(
                  icon: Icons.arrow_forward_ios,
                  onTap: () {
                    controller.login(userEmailController.text.trim(),
                        passwordController.text.toString());
                  },
                  height: 50.h,
                  width: 40.w),
              Text(
                'Login',
                style: kBodyStyle2.copyWith(fontSize: 8.sp),
              ),
              8.height,
              Text(
                'DON\'T YOU HAVE AN ACCOUNT? ',
                style: kSmallStyle1.copyWith(fontSize: 5.sp),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const WSignupView());
                },
                child: Text(
                  'SIGN UP!',
                  style: kSmallStyle1.copyWith(color: kOrange, fontSize: 5.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _textFeild extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData preIcon;

  const _textFeild(
      {required this.controller, required this.hint, required this.preIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 16,
      width: width / 4,
      decoration: const BoxDecoration(color: kWhite),
      child: TextField(
        decoration: InputDecoration(
            hintText: hint,
            labelText: hint,
            border: OutlineInputBorder(),
            prefixIcon: Icon(preIcon)),
      ),
    );
  }
}
