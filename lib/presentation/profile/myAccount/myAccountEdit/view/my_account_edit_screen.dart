import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constansts/color_manager.dart';
import '../../../../widgets/custom_header.dart';

class MyAccountEditScreen extends StatefulWidget {
  const MyAccountEditScreen({super.key});

  @override
  State<MyAccountEditScreen> createState() => _MyAccountEditScreenState();
}

class _MyAccountEditScreenState extends State<MyAccountEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomHeader(middleTitle: 'My Account', endTitle: 'Save'),
              SizedBox(height: 20.h),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60.r,
                    backgroundImage: NetworkImage(
                      'https://wallpapers.com/images/featured/cool-profile-picture-87h46gcobjl5e4xu.jpg',
                    ), // Placeholder image
                  ),
                  Positioned(
                    bottom: -5,
                    right: -5,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ColorManager.whiteColor, // your border color
                          width: 6.w,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: ColorManager.grey100,
                        child: SvgPicture.asset(IconManager.camera),
                      ),
                    ),
                  ),
                ],
              ),
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
              CustomTextField(hintText: '12-10-1996'),
              CustomTextField(
                hintText: 'Address - Home',
                suffixIcon: IconManager.arrowRight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
