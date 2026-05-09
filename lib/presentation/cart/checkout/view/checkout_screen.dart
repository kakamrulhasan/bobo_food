import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:bobo_food/core/route/route_name.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              CustomHeader(middleTitle: 'Checkout'),
              SizedBox(height: 25.h),
              _buildSelectionCard(
                icon: IconManager.location,
                label: "Deliver to",
                value: "Home - 123 Main St, Apt 4B",
                onTap: () {
                  Navigator.pushNamed(context, RouteName.changeAddressScreen);
                },
              ),
              SizedBox(height: 16.h),
              // Payment Section
              _buildSelectionCard(
                icon: IconManager.creditCard,
                label: "Payment from",
                value: "Mastercard - Daniel Jones",
                onTap: () {
                  Navigator.pushNamed(context, RouteName.changeCardScreen);
                },
              ),
              SizedBox(height: 32.h),
              // Pricing Details
              _buildPriceRow("Subtotal", "56.27"),
              SizedBox(height: 12.h),
              _buildPriceRow("Coupon", "-17.4"),
              SizedBox(height: 12.h),
              _buildPriceRow("Delivery Charges", "+3.99"),
              Divider(thickness: 1, color: ColorManager.grey200),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: getRegularStyle16_400(
                      color: ColorManager.typography500,
                      fontSize: 17.sp,
                    ),
                  ),
                  Text(
                    '\$ 32.12',
                    style: getBoldStyle24(
                      color: ColorManager.typography500,
                      fontSize: 17.sp,
                    ),
                  ),
                ],
              ),
              Spacer(),
              // ============ Button Section =============
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      '\$ 32.12',
                      style: getSemiBoldStyle22(
                        color: ColorManager.typography500,
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: CustomButton(
                      text: 'Place order',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RouteName.orderPlacedScreen,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable widget for Address and Payment cards
  Widget _buildSelectionCard({
    required VoidCallback onTap,
    required String icon,
    required String label,
    required String value,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: ColorManager.grey50,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon, height: 24.h, width: 24.w),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: getLightStyle12_400(
                      color: ColorManager.typography400,
                    ),
                  ),
                  SizedBox(height: 4.w),
                  Text(
                    value,
                    style: getRegularStyle16_400(
                      color: ColorManager.typography500,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(IconManager.arrowRight, width: 14.w, height: 14.h),
          ],
        ),
      ),
    );
  }

  // Reusable widget for Price Breakdown rows
  Widget _buildPriceRow(String label, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: getRegularStyle16_400(
            color: ColorManager.typography400,
            fontSize: 15.sp,
          ),
        ),

        Text(
          amount,
          style: getSemiBoldStyle22(
            color: ColorManager.typography400,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }
}
