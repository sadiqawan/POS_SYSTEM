import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos/const/cont_colors.dart';


class CustomTextFeild extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType? keyBordType;
  final bool? obscureText;
  final ValueChanged<String>? onSubmit;
  final double? height ;

  const CustomTextFeild({
    required this.hint,
    required this.controller,
    required this.icon,
    super.key,
    this.keyBordType,
    this.obscureText, this.onSubmit, this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 55.h ?? height,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const[
        BoxShadow(
            color: Colors.black12, // Adjust shadow color as needed
            offset: Offset(0, 4), // Moves shadow 4 pixels downwards
            blurRadius: 6, // Defines the blur radius
            spreadRadius: 2, // Defines how much the shadow spreads
          ),
        ],
      ),
      child: TextField(
        onSubmitted: onSubmit,
        obscureText: obscureText ?? false,
        keyboardType: keyBordType,
        controller: controller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
          hintStyle: GoogleFonts.poppins(
            fontSize: 15.sp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
