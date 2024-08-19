import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircularButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  const CustomCircularButton({super.key, required this.icon, required this.onTap, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: (height ?? 80.h),
        width: (width ?? 60.w),
        decoration: BoxDecoration(
          color: Colors.orange.shade800,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
