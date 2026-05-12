import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? prefixIcon;
  final String? suffixIcon;

  final bool isPassword;

  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isPassword;
  }

  void toggleVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.w),
      child: TextFormField(
        cursorWidth: 3,
        cursorHeight: 35,
        cursorRadius: Radius.circular(2),
        cursorColor: ColorManager.greenColor,
        cursorErrorColor: ColorManager.redColor,
        controller: widget.controller,
        obscureText: isObscure,

        style: getRegularStyle16_400(
          color: ColorManager.typography500,
          fontSize: 15.sp,
        ),

        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: getRegularStyle16_400(
            color: ColorManager.typography200,
            fontSize: 15.sp,
          ),
          prefixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: toggleVisibility,
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: SvgPicture.asset(
                      isObscure ? IconManager.eyeClose : IconManager.eyeOpen,
                      width: 20.w,
                      height: 14.h,
                    ),
                  ),
                )
              : widget.prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.all(12.w),
                  child: SvgPicture.asset(
                    widget.prefixIcon!,
                    width: 20.w,
                    height: 14.h,
                  ),
                )
              : null,

          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: toggleVisibility,
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: SvgPicture.asset(
                      isObscure ? IconManager.eyeClose : IconManager.eyeOpen,
                      width: 20.w,
                      height: 14.h,
                    ),
                  ),
                )
              : widget.suffixIcon != null
              ? Padding(
                  padding: EdgeInsets.all(12.w),
                  child: SvgPicture.asset(
                    widget.suffixIcon!,
                    width: 20.w,
                    height: 14.h,
                  ),
                )
              : null,

          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 14.h,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: ColorManager.grey200, width: 2.w),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: ColorManager.greenColor, width: 2.w),
          ),
        ),
      ),
    );
  }
}
