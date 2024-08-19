import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:pos/const/cont_colors.dart';

import 'package:pos/view/app_views/welcome_view.dart';
import 'package:pos/view/windows_views/auth_views/wlogin_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    onRoute();
  }

  Future<void> onRoute() async {
    await Future.delayed(const Duration(seconds: 3));

    if (kIsWeb || MediaQuery.of(context).size.width > 800) {
      Get.to(() => const WloginView());
    } else {
      Get.to(() =>  const WelcomeView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOrange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/icon_logo1.png',
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
