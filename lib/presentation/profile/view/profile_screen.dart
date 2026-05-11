import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:bobo_food/core/route/route_name.dart';
import 'package:bobo_food/presentation/widgets/custom_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= TOP BAR =================
              Row(
                children: [
                  InkWell(
                    splashColor: ColorManager.transparentColor,
                    highlightColor: ColorManager.transparentColor,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(IconManager.cancel),
                  ),
                  SizedBox(width: 30.w),
                  SvgPicture.asset(IconManager.boboIcon),
                ],
              ),
              SizedBox(height: 30.h),

              // ================= PROFILE HEADER =================
              Row(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                      'https://wallpapers.com/images/featured/cool-profile-picture-87h46gcobjl5e4xu.jpg',
                    ), // Placeholder image
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Daniel Jones",
                        style: getBoldStyle24(
                          color: ColorManager.typography500,
                          fontSize: 17.sp,
                        ),
                      ),
                      Text(
                        "daniel.jones@example.com",
                        style: getLightStyle14_400(
                          fontSize: 12.sp,
                          color: ColorManager.typography300,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      // Premium Badge
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: ColorManager.grey200),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(IconManager.rating),
                            SizedBox(width: 4.w),
                            Text(
                              "Premium",
                              style: getLightStyle14_400(
                                fontSize: 12.sp,
                                color: ColorManager.typography300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40.h),

              // ================= GENERAL SECTION =================
              Text(
                "General",
                style: getLightStyle14_400(
                  fontSize: 12.sp,
                  color: ColorManager.typography300,
                ),
              ),
              SizedBox(height: 16.h),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.myAccountScreen);
                },
                child: CustomItem(
                  icon: IconManager.profile,
                  title: "My Account",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.myOrderScreen);
                },
                child: CustomItem(icon: IconManager.list, title: "My Orders"),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.paymentScreen);
                },
                child: CustomItem(
                  icon: IconManager.creditCard,
                  title: "Payment",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.addressScreen);
                },
                child: CustomItem(
                  icon: IconManager.location,
                  title: "Addresses",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.subScriptionScreen);
                },
                child: CustomItem(
                  icon: IconManager.subscription,
                  title: "Subscription",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.settingsScreen);
                },
                child: CustomItem(
                  icon: IconManager.settings,
                  title: "Settings",
                ),
              ),

              SizedBox(height: 30.h),

              // ================= THEME SECTION =================
              Text(
                "Theme",
                style: getLightStyle14_400(
                  fontSize: 12.sp,
                  color: ColorManager.typography300,
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: ColorManager.grey50,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(IconManager.moon),
                    SizedBox(width: 16.w),
                    Text(
                      "Dark mode",
                      style: getRegularStyle16_400(
                        color: ColorManager.typography500,
                        fontSize: 15.sp,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: _isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          _isDarkMode = value;
                        });
                      },
                      activeColor: ColorManager.grey100,
                      activeTrackColor: ColorManager.primary600,
                      inactiveThumbColor: ColorManager.grey400,
                      inactiveTrackColor: ColorManager.grey100,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
