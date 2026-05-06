import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constansts/color_manager.dart';
import '../../core/constansts/style_manager.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const CustomTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: getBoldStyle24(
        color: color ?? ColorManager.typography500,
        fontSize: fontSize ?? 32.sp,

        fontWeight: fontWeight ?? FontWeight.w700,
      ),
    );
  }
}
