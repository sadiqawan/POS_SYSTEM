import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos/componants/custom_circular_button.dart';
import 'package:pos/const/exe.dart';
import 'package:pos/const/text_style.dart';
import 'package:pos/view/app_views/auth_views/login_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 20.h),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hello Tom!',
                      style: kHeading1B,
                    ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Stat working now ',
                      style: kTitle2.copyWith(fontSize: 12.sp),
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.h),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 300.h,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  width: width,
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(300, 150),
                          topRight: Radius.elliptical(300, 150))),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 40.h,
            left: 140.w,
            child: Column(
              children: [
                CustomCircularButton(onTap: () {
                  Get.to(()=> LoginView());
                }, icon: Icons.arrow_upward),
                Text('SWIPE UP', style: kTitle2),
              ],
            ),
          )
        ],
      )),
    );
  }
}
