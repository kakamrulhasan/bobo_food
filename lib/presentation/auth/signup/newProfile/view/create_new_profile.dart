import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/core/route/route_name.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../widgets/custom_title.dart';

class CreateNewProfile extends StatefulWidget {
  const CreateNewProfile({super.key});

  @override
  State<CreateNewProfile> createState() => _CreateNewProfileState();
}

class _CreateNewProfileState extends State<CreateNewProfile> {
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
                CustomTitle(title: 'Create your new profile'),
                SizedBox(height: 14.h),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 120.w,
                        height: 120.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.grey500,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            IconManager.person,
                            width: 42.w,
                            height: 42.h,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -6.h,
                        right: -6.w,

                        child: Container(
                          width: 48.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorManager.grey100,
                            border: Border.all(
                              color: ColorManager.whiteColor,
                              width: 6.w,
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset(IconManager.camera),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
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
                CustomTextField(hintText: 'date of birth'),
                Stack(
                  children: [
                    CustomTextField(hintText: 'Address'),
                    Positioned(
                      right: 30.w,
                      bottom: 30.h,
                      child: SvgPicture.asset(IconManager.arrowRight),
                    ),
                  ],
                ),
                SizedBox(height: 100.h),
                CustomButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.addNewAddress);
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
