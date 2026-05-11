import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_text_field.dart';
import 'package:bobo_food/presentation/widgets/custom_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
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
              CustomTextField(hintText: 'Cardholder name'),
              CustomTextField(hintText: 'Card number'),
              CustomTextField(hintText: 'Expiration date'),
              CustomTextField(hintText: 'CVV'),
              Spacer(),
              CustomButton(
                text: 'Save',
                onPressed: () {},
                backgroundColor: ColorManager.grey200,
                textColor: ColorManager.grey400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
