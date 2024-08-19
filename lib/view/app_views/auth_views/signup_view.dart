import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos/componants/custom_circular_button.dart';
import 'package:pos/componants/custtom_text_feild.dart';
import 'package:pos/const/text_style.dart';
import 'package:pos/controller/auth_controller/auth_controller.dart';
import '../../../const/exe.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final usernameController = TextEditingController();
  final userEmailController = TextEditingController();
  final passwordController = TextEditingController();

  AuthController controller = Get.put(AuthController());
  @override
  void dispose() {
  userEmailController.dispose();
  usernameController.dispose();
  passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView( // Added SingleChildScrollView here
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.height,
              Text(
                'Welcome To POS!',
                style: kHeading1B,
              ),

              Image.asset('assets/images/icon_logo2.png',height: 270.h,),
              CustomTextFeild(
                hint: 'Name',
                controller: usernameController,
                icon: Icons.person_outline,
              ),
              10.height,
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

              30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Sign Up',
                    style: kTitle2.copyWith(),
                  ),
                  10.width,
                  CustomCircularButton(
                    icon: Icons.arrow_forward,
                    onTap: () {
                      controller.register(usernameController.text.trim(),userEmailController.text.trim() , passwordController.text.trim(),context);

                    },
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ALREADY HAVE A ACCOUNT? ',
                    style: kBodyStyle2.copyWith(),
                  ),
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Text(
                      'SIGN IN!',
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
