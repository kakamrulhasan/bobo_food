import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrderPlacedScreen extends StatefulWidget {
  const OrderPlacedScreen({super.key});

  @override
  State<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  // Same green color from the checkout screen
  final Color primaryGreen = const Color(0xFF53A124);

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
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  IconManager.cancel,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              SizedBox(height: 100.h),
              Center(
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: ColorManager.whiteColor,
                    size: 40.sp,
                  ),
                ),
              ),
              SizedBox(height: 15.w),
              // Main Heading
              Center(
                child: Text(
                  "Yay! Your order\nhas been placed.",
                  textAlign: TextAlign.center,
                  style: getBoldStyle24(
                    color: ColorManager.typography500,
                    fontSize: 32.sp,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              // Sub-heading
              Text(
                "Your order would be delivered in the\n30 mins all most",
                textAlign: TextAlign.center,
                style: getRegularStyle16_400(
                  color: ColorManager.typography400,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 40.h),
              // Order Detail List
              _buildOrderInfoRow(IconManager.clock, "Estimated time", "30mins"),
              SizedBox(height: 20.h),
              _buildOrderInfoRow(IconManager.location, "Deliver to", "Home"),
              SizedBox(height: 20.h),
              _buildOrderInfoRow(
                IconManager.creditCard,
                "Amount Paid",
                "\$32.12",
              ),
              Spacer(),

              CustomButton(text: 'Track my order', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable helper for the detail rows
  Widget _buildOrderInfoRow(String icon, String label, String value) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: 24.w,
          height: 24.h,
          color: ColorManager.grey600,
        ),
        SizedBox(width: 12.w),
        Text(
          label,
          style: getRegularStyle16_400(
            color: ColorManager.typography400,
            fontSize: 15.sp,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: getRegularStyle16_400(
            color: ColorManager.typography500,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }
}
