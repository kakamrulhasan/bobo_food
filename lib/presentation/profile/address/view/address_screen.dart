import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/core/route/route_name.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_item.dart';
import 'package:bobo_food/presentation/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constansts/style_manager.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
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
              CustomHeader(
                middleTitle: 'Address',
                endIcon: CustomSvg(
                  icon: IconManager.add,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                'Default',
                style: getSemiBoldStyle22(
                  color: ColorManager.typography300,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 20.h),
              InkWell(
                splashColor: ColorManager.transparentColor,
                highlightColor: ColorManager.transparentColor,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.editAddressScreen);
                },
                child: CustomItem(title: 'Home'),
              ),
              SizedBox(height: 10.h),
              Divider(),
              SizedBox(height: 20.h),
              Text(
                'Others',
                style: getSemiBoldStyle22(
                  color: ColorManager.typography300,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 20.h),
              CustomItem(title: "Grandma's house"),
              CustomItem(title: "Mama's house"),
              CustomItem(title: 'Office'),
            ],
          ),
        ),
      ),
    );
  }
}
