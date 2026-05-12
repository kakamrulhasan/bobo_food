import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_text_field.dart';
import 'package:bobo_food/presentation/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountDeleteScreen extends StatefulWidget {
  const AccountDeleteScreen({super.key});

  @override
  State<AccountDeleteScreen> createState() => _AccountDeleteScreenState();
}

class _AccountDeleteScreenState extends State<AccountDeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              CustomHeader(middleTitle: 'Delete account'),
              SizedBox(height: 30.h),
              CustomTitle(
                title: 'You are going to delete your account.',
                subtitle:
                    "We are very sorry to see you leaving.\nDeleting your account will permanently delete all of the data plus any active subscriptions and this action can't be undone!\nIf you still want to delete your account, enter 'CONFIRM' to proceed.",
              ),
              SizedBox(height: 20.h),
              CustomTextField(hintText: 'enter "CONFIRM"'),
              Spacer(),
              CustomButton(
                text: 'Delete account',
                onPressed: () {},
                backgroundColor: ColorManager.redColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
