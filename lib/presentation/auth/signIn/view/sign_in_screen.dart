import 'dart:developer';

import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:bobo_food/core/route/route_name.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_text_field.dart';
import 'package:bobo_food/presentation/widgets/custom_title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constansts/icon_manager.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                Center(
                  child: SvgPicture.asset(
                    IconManager.boboIcon,
                    width: 66.26.w,
                    height: 22.47.h,
                  ),
                ),
                SizedBox(height: 25.h),
                CustomTitle(title: 'Log in to your account'),
                SizedBox(height: 14.h),
                CustomTextField(hintText: 'email address'),
                SizedBox(height: 5.h),
                CustomTextField(hintText: 'password', isPassword: true),
                SizedBox(height: 10.h),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.forgetByEmailScr);
                    },
                    child: Text(
                      'forgot password',
                      style: getBoldStyle24(
                        color: ColorManager.primary700,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 65.h),
                CustomButton(
                  text: 'Log in',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteName.bottomNavScreen,
                      (route) => false,
                    );
                  },
                ),
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
                          text: 'Sign up',
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
                              Navigator.pushNamed(
                                context,
                                RouteName.signupScreen,
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
