import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/route/route_name.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_text_field.dart';
import 'package:bobo_food/presentation/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForgetByEmail extends StatefulWidget {
  const SignUpForgetByEmail({super.key});

  @override
  State<SignUpForgetByEmail> createState() => _SignUpForgetByEmailState();
}

class _SignUpForgetByEmailState extends State<SignUpForgetByEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(),
              SizedBox(height: 25.h),
              CustomTitle(title: 'Verify your New account by Email'),
              SizedBox(height: 14.h),
              CustomTextField(hintText: 'email address'),
              Spacer(),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.signupForgetPassByOtp);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
