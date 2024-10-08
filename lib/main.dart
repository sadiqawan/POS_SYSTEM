import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/const/cont_colors.dart';
import 'package:pos/view/splash_view/splash_view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Set the design size for scaling
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'POS',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: kOrange),
            textTheme: GoogleFonts.poppinsTextTheme().apply(
              bodyColor: Colors.black54, // Text color
              displayColor: Colors.black38, // Headline color
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black54),
            useMaterial3: true,
          ),
          home: SplashView(), // Your starting view
        );
      },
    );
  }
}
