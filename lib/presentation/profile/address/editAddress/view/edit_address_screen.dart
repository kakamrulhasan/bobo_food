import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_text_field.dart';
import 'package:bobo_food/presentation/widgets/custom_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                CustomHeader(middleTitle: 'Edit address'),
                SizedBox(height: 30.h),
                CustomToggle(showIcon: false, title: 'Set as default'),
                SizedBox(height: 30.h),
                Divider(),
                SizedBox(height: 20.h),
                CustomTextField(hintText: 'Home'),
                CustomTextField(hintText: 'Buzz apartment 4B'),
                SizedBox(height: 30.h),
                Divider(),
                SizedBox(height: 20.h),
                CustomTextField(hintText: 'Daniel Jones'),
                Row(
                  children: [
                    Flexible(flex: 1, child: CustomTextField(hintText: '405')),
                    SizedBox(width: 10.w),
                    Flexible(
                      flex: 3,
                      child: CustomTextField(hintText: '555-0128'),
                    ),
                  ],
                ),
                CustomTextField(hintText: '123 Main St, Apt 4B'),
                Row(
                  children: [
                    Expanded(child: CustomTextField(hintText: 'New York')),
                    SizedBox(width: 10.w),
                    Expanded(child: CustomTextField(hintText: 'California')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CustomTextField(hintText: '100123')),
                    SizedBox(width: 10.w),
                    Expanded(child: CustomTextField(hintText: 'United States')),
                  ],
                ),

                SizedBox(height: 40.h),
                CustomButton(text: 'Save', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
