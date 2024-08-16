import 'package:flutter/material.dart';
import 'package:get/get.dart';

final height = Get.height;
final width = Get.width;




extension PaddingHeight on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

