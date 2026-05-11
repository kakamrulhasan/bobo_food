import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:bobo_food/core/route/route_name.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_item.dart';
import 'package:bobo_food/presentation/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(
                middleTitle: 'Payment Methods',
                endIcon: CustomSvg(
                  icon: IconManager.add,
                  width: 20.w,
                  height: 20.h,
                ),
                endIconOnTap: () {
                  Navigator.pushNamed(context, RouteName.addCardScreen);
                },
              ),
              SizedBox(height: 20.h),
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
                  Navigator.pushNamed(context, RouteName.editCardScreen);
                },
                child: CustomItem(title: 'Mastercard - Daniel Jones'),
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
              CustomItem(title: 'Mastercard - Emily Jones'),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
