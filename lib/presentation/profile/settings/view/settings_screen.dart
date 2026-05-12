import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:bobo_food/core/route/route_name.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_item.dart';
import 'package:bobo_food/presentation/widgets/custom_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(middleTitle: 'Settings'),
              SizedBox(height: 30.h),
              Text(
                'General',
                style: getLightStyle12_400(
                  color: ColorManager.typography300,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5.h),
              CustomItem(title: 'Switch Account', icon: IconManager.twoArrow),
              InkWell(
                splashColor: ColorManager.transparentColor,
                highlightColor: ColorManager.transparentColor,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.languageScreen);
                },
                child: CustomItem(
                  title: 'Language',
                  icon: IconManager.language,
                  endTitle: 'English',
                ),
              ),
              CustomToggle(showIcon: true, title: 'Dark mode'),
              SizedBox(height: 15.h),
              Text(
                'Others',
                style: getLightStyle12_400(
                  color: ColorManager.typography300,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15.h),
              CustomItem(title: 'Privacy Policy', icon: IconManager.privacy),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.customerSupportScreen);
                },
                child: CustomItem(
                  title: 'Customer Support',
                  icon: IconManager.message,
                ),
              ),
              CustomItem(title: 'Terms & Conditions', icon: IconManager.terms),
              SizedBox(height: 5.h),
              Text(
                'Danger Actions',
                style: getLightStyle12_400(
                  color: ColorManager.typography300,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15.h),
              CustomItem(title: 'Delete Account', icon: IconManager.delete),
              CustomItem(title: 'Log out', icon: IconManager.logout),
            ],
          ),
        ),
      ),
    );
  }
}
