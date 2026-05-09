import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCouponScreen extends StatefulWidget {
  const AddCouponScreen({super.key});

  @override
  State<AddCouponScreen> createState() => _AddCouponScreenState();
}

class _AddCouponScreenState extends State<AddCouponScreen> {
  int _selectedIndex = 1;
  final List<Map<String, String>> _coupons = [
    {"code": "PIZZA10", "desc": "Get 10% off on any pizza order."},
    {"code": "WELCOME50", "desc": "50% off your first order!"},
    {"code": "WEEKEND5", "desc": "Save \$5 on orders over \$25 this\nweekend."},
    {"code": "EXTRA20", "desc": "20% off on orders above \$30."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= HEADER =================
              CustomHeader(
                leadTitle: 'Cancel',
                middleTitle: 'Add Coupon',
                endTitle: 'Save',
              ),
              SizedBox(height: 20.h),

              // ================= TEXT FIELD & ADD BUTTON =================
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: CustomTextField(hintText: 'type coupon name'),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 50.h,
                      child: CustomButton(
                        text: 'Add',
                        onPressed: () {},
                        backgroundColor: ColorManager.grey100,
                        textColor: ColorManager.typography300,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Divider(thickness: 1),
              SizedBox(height: 15.h),

              Text(
                'Select from these',
                style: getSemiBoldStyle22(
                  color: ColorManager.typography400,
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 15.h),

              // ================= COUPON LIST =================
              Expanded(
                child: ListView.separated(
                  itemCount: _coupons.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final isSelected = _selectedIndex == index;
                    final coupon = _coupons[index];

                    return GestureDetector(
                      onTap: () => setState(() => _selectedIndex = index),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.grey50,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            // COUPON TEXT DATA
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    coupon['code']!,
                                    style: getRegularStyle16_400(
                                      color: ColorManager.typography300,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    coupon['desc']!,
                                    style: getSemiBoldStyle22(
                                      color: ColorManager.typography500,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // CUSTOM RADIO
                            _buildCustomRadioButton(isSelected),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= RADIO BUTTON =================
  Widget _buildCustomRadioButton(bool isSelected) {
    return Container(
      width: 26.w,
      height: 26.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? ColorManager.primary700 : ColorManager.grey200,
          width: 2.w,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 14.w,
                height: 14.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.primary700,
                ),
              ),
            )
          : null,
    );
  }
}
