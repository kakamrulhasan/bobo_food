import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Widget? icon;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.icon,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity.w,
      height: height ?? 50.h,
      child: Material(
        color: backgroundColor ?? ColorManager.greenColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
              border: Border.all(
                color: borderColor ?? ColorManager.transparentColor,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[icon!, SizedBox(width: 8.w)],
                Text(
                  text,
                  style: getBoldStyle24(
                    fontSize: 15.sp,
                    color: textColor ?? ColorManager.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
