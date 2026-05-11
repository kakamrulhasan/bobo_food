import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/route/route_name.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_item.dart';
import 'package:bobo_food/presentation/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
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
              CustomHeader(
                middleTitle: 'My Account',
                endTitle: 'Edit',
                onTapEndTitle: () {
                  Navigator.pushNamed(context, RouteName.myAccountEditScreen);
                },
              ),
              SizedBox(height: 20.h),
              CircleAvatar(
                radius: 60.r,
                backgroundImage: NetworkImage(
                  'https://wallpapers.com/images/featured/cool-profile-picture-87h46gcobjl5e4xu.jpg',
                ), // Placeholder image
              ),
              SizedBox(height: 10.h),
              CustomTitle(
                title: 'Daniel Jones',
                subtitle: 'daniel.jones@example.com',
                fontSizeTitle: 24.sp,
                fontSizeSubTitle: 12.sp,
              ),
              CustomTitle(title: '+405 555-0123', fontSizeTitle: 15.sp),
              SizedBox(height: 20.h),
              CustomItem(title: 'Addresses'),
              CustomItem(title: 'Payment'),
              CustomItem(title: 'My Orders'),
              CustomItem(title: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}
