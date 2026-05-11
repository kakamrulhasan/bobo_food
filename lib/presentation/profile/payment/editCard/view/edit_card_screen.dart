import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_text_field.dart';
import 'package:bobo_food/presentation/widgets/custom_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditCardScreen extends StatefulWidget {
  const EditCardScreen({super.key});

  @override
  State<EditCardScreen> createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              CustomHeader(middleTitle: 'Add a card'),
              SizedBox(height: 30.h),
              CustomToggle(showIcon: false, title: 'Set as default'),
              SizedBox(height: 30.h),
              Divider(),
              SizedBox(height: 20.h),
              CustomTextField(hintText: 'Daniel Jones'),
              CustomTextField(hintText: '134 5343 23423 23'),
              CustomTextField(hintText: '07 / 25'),
              CustomTextField(hintText: '123'),
              Spacer(),
              CustomButton(text: 'Save', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
