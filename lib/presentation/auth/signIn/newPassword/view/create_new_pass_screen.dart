import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/route/route_name.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_text_field.dart';
import 'package:bobo_food/presentation/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPassScreen extends StatefulWidget {
  const CreateNewPassScreen({super.key});

  @override
  State<CreateNewPassScreen> createState() => _CreateNewPassScreenState();
}

class _CreateNewPassScreenState extends State<CreateNewPassScreen> {
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
              CustomTitle(
                title: 'Create a new password',
                subtitle: 'Enter a new password and try not to forget it.',
              ),
              SizedBox(height: 14.h),
              CustomTextField(hintText: 'new password', isPassword: true),
              SizedBox(height: 5.h),
              CustomTextField(
                hintText: 're-enter the new password',
                isPassword: true,
              ),
              Spacer(),
              CustomButton(
                text: 'Log in',
                onPressed: () {
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
    );
  }
}
