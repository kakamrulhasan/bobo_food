import 'dart:developer';

import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:bobo_food/core/route/route_name.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_text_field.dart';
import 'package:bobo_food/presentation/widgets/custom_title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeader(),
                SizedBox(height: 25.h),
                CustomTitle(title: 'Create a new account'),
                SizedBox(height: 14.h),
                CustomTextField(hintText: 'email address'),
                SizedBox(height: 5.h),
                CustomTextField(hintText: 'password', isPassword: true),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      activeColor: ColorManager.primaryGreen,

                      checkColor: ColorManager.primary,
                      side: BorderSide(color: ColorManager.greyColor, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),

                    Expanded(
                      child: Text(
                        'I agree to terms & conditions',
                        style: getRegularStyle16_400(
                          color: ColorManager.typography400,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 220.h),
                CustomButton(text: 'Create account', onPressed: () {}),
                SizedBox(height: 25.h),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: getRegularStyle16_400(
                            color: ColorManager.typography400,
                            fontSize: 15.sp,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign In',
                          style:
                              getSemiBoldStyle22(
                                fontWeight: FontWeight.w600,

                                color: ColorManager.typography500,
                                fontSize: 15.sp,
                              ).copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: ColorManager.blueColor,
                                decorationThickness: 3.5,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              log('signup clicked');
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                RouteName.loginScreen,
                                (route) => false,
                              );
                            },
                        ),
                      ],
                    ),
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
