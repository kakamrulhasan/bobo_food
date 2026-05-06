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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ============== Title Section =============
        Text(
          title,
          style: getBoldStyle24(
            color: color ?? ColorManager.typography500,
            fontSize: fontSize ?? 32.sp,

            fontWeight: fontWeight ?? FontWeight.w700,
          ),
        ),

        // ============ SubTitle Section ============
        if (subtitle != null) ...[
          SizedBox(height: 5.h),
          Text(
            subtitle!,
            style: getRegularStyle16_400(
              color: ColorManager.typography400,
              fontSize: 15.sp,
            ),
          ),
        ],
      ],
    );
  }
}
