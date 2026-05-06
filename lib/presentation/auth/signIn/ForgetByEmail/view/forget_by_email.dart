import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/route/route_name.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_text_field.dart';
import 'package:bobo_food/presentation/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetByEmail extends StatefulWidget {
  const ForgetByEmail({super.key});

  @override
  State<ForgetByEmail> createState() => _ForgetByEmailState();
}

class _ForgetByEmailState extends State<ForgetByEmail> {
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
              CustomTitle(title: 'Forget Your password'),
              SizedBox(height: 14.h),
              CustomTextField(hintText: 'email address'),
              Spacer(),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.forgetPassByOtp);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
