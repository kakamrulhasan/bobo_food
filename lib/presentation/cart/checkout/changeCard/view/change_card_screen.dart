import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeCardScreen extends StatefulWidget {
  const ChangeCardScreen({super.key});

  @override
  State<ChangeCardScreen> createState() => _ChangeCardScreenState();
}

class _ChangeCardScreenState extends State<ChangeCardScreen> {
  // Current selected address index
  int _selectedIndex = 0;

  final List<String> _addresses = [
    "Mastercard - Daniel Jones",
    "Mastercard - Emily Jones",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              CustomHeader(
                middleTitle: 'Change card',
                leadTitle: 'Cancel',
                endTitle: 'Save',
                endTitleColor: ColorManager.primary600,
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.separated(
                  itemCount: _addresses.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final isSelected = _selectedIndex == index;
                    return InkWell(
                      splashColor: ColorManager.transparentColor,
                      highlightColor: ColorManager.transparentColor,
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 18.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.grey50,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _addresses[index],
                              style: getRegularStyle16_400(
                                color: ColorManager.typography500,
                                fontSize: 15.sp,
                              ),
                            ),
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

  // Helper to build the custom green radio indicator
  Widget _buildCustomRadioButton(bool isSelected) {
    return Container(
      width: 24.w,
      height: 24.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? ColorManager.primary600 : ColorManager.grey200,
          width: 2.w,
        ),
        color: ColorManager.transparentColor,
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 12.w,
                height: 12.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.primary600,
                ),
              ),
            )
          : null,
    );
  }
}
