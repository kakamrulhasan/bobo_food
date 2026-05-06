import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constansts/style_manager.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeader(),
                SizedBox(height: 24.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 12.w,
                  ),
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                    color: ColorManager.grey50,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: ColorManager.transparentColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Set as default",
                        style: getRegularStyle16_400(
                          color: ColorManager.typography500,
                          fontSize: 15.sp,
                        ),
                      ),
                      Switch(
                        value: isActive,
                        onChanged: (value) {
                          setState(() {
                            isActive = value;
                          });
                        },
                        activeColor: ColorManager.whiteColor,
                        activeTrackColor: ColorManager.primary600,
                        inactiveThumbColor: ColorManager.grey500,
                        inactiveTrackColor: ColorManager.grey200,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        trackOutlineColor: MaterialStateProperty.all(
                          ColorManager.transparentColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Divider(),
                SizedBox(height: 24.h),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "address label (e.g. home, work, other)",
                    hintStyle: getRegularStyle16_400(
                      color: ColorManager.typography200,
                      fontSize: 15.sp,
                    ),

                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),

                    filled: true,
                    fillColor: ColorManager.transparentColor,

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: ColorManager.grey200,
                        width: 1.w,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: ColorManager.grey200,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(height: 10.h),

                TextFormField(
                  maxLines: 2,
                  minLines: 2,
                  decoration: InputDecoration(
                    hintText:
                        "delivery instructions (optional for specific directions or requests)",
                    hintStyle: getRegularStyle16_400(
                      color: ColorManager.typography200,
                      fontSize: 15.sp,
                    ),

                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),

                    filled: true,
                    fillColor: ColorManager.transparentColor,

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: ColorManager.grey200,
                        width: 1.w,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: ColorManager.grey200,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24.h),
                Divider(),
                SizedBox(height: 24.h),
                CustomTextField(hintText: 'full name'),
                Row(
                  children: [
                    Flexible(flex: 2, child: CustomTextField(hintText: '+00')),
                    Flexible(
                      flex: 6,
                      child: CustomTextField(hintText: 'phone number'),
                    ),
                  ],
                ),

                CustomTextField(hintText: 'street address'),
                Row(
                  children: [
                    Expanded(child: CustomTextField(hintText: 'city')),
                    Expanded(
                      child: CustomTextField(hintText: 'state/ province'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CustomTextField(hintText: 'city')),
                    Expanded(
                      child: CustomTextField(hintText: 'state/ province'),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                CustomButton(
                  text: 'Continue',
                  onPressed: () {
                    // openBottomSheet();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
