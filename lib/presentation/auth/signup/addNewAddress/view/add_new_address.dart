import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/core/route/route_name.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_text_field.dart';
import 'package:bobo_food/presentation/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constansts/style_manager.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeader(),
                SizedBox(height: 24.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 12.w,
                  ),
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                    color: ColorManager.grey50,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: ColorManager.transparentColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Set as default",
                        style: getRegularStyle16_400(
                          color: ColorManager.typography500,
                          fontSize: 15.sp,
                        ),
                      ),
                      Switch(
                        value: isActive,
                        onChanged: (value) {
                          setState(() {
                            isActive = value;
                          });
                        },
                        activeColor: ColorManager.whiteColor,
                        activeTrackColor: ColorManager.primary600,
                        inactiveThumbColor: ColorManager.grey500,
                        inactiveTrackColor: ColorManager.grey200,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        trackOutlineColor: MaterialStateProperty.all(
                          ColorManager.transparentColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Divider(),
                SizedBox(height: 24.h),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "address label (e.g. home, work, other)",
                    hintStyle: getRegularStyle16_400(
                      color: ColorManager.typography200,
                      fontSize: 15.sp,
                    ),

                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),

                    filled: true,
                    fillColor: ColorManager.transparentColor,

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: ColorManager.grey200,
                        width: 1.w,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: ColorManager.grey200,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(height: 10.h),

                TextFormField(
                  maxLines: 2,
                  minLines: 2,
                  decoration: InputDecoration(
                    hintText:
                        "delivery instructions (optional for specific directions or requests)",
                    hintStyle: getRegularStyle16_400(
                      color: ColorManager.typography200,
                      fontSize: 15.sp,
                    ),

                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),

                    filled: true,
                    fillColor: ColorManager.transparentColor,

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: ColorManager.grey200,
                        width: 1.w,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: ColorManager.grey200,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24.h),
                Divider(),
                SizedBox(height: 24.h),
                CustomTextField(hintText: 'full name'),
                Row(
                  children: [
                    Flexible(flex: 2, child: CustomTextField(hintText: '+00')),
                    Flexible(
                      flex: 6,
                      child: CustomTextField(hintText: 'phone number'),
                    ),
                  ],
                ),

                CustomTextField(hintText: 'street address'),
                Row(
                  children: [
                    Expanded(child: CustomTextField(hintText: 'city')),
                    Expanded(
                      child: CustomTextField(hintText: 'state/ province'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CustomTextField(hintText: 'city')),
                    Expanded(
                      child: CustomTextField(hintText: 'state/ province'),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                CustomButton(
                  text: 'Continue',
                  onPressed: () {
                    subScriptionBottomSheet();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // =========== SubScription Bottom Sheet ==========
  void subScriptionBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: ColorManager.whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
              child: Padding(
                padding: EdgeInsets.all(24.0.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            IconManager.cancel,
                            width: 16.w,
                            height: 16.h,
                          ),
                        ),
                        Text(
                          'Subscription',
                          style: getSemiBoldStyle22(
                            color: ColorManager.typography500,
                            fontSize: 17.sp,
                          ),
                        ),
                        Text(''),
                      ],
                    ),
                    SizedBox(height: 60.h),
                    SvgPicture.asset(
                      IconManager.splashLogo,
                      width: 170.w,
                      height: 86.h,
                    ),
                    SizedBox(height: 40.h),
                    _buildText(
                      text: 'Special offers and discounts coupons every week',
                    ),
                    SizedBox(height: 10.h),
                    _buildText(text: 'No delivery charges at all!'),
                    SizedBox(height: 10.h),
                    _buildText(
                      text: 'Get a free little gift on every delivery.',
                    ),
                    SizedBox(height: 20.h),
                    _subScriptionCard(
                      title: 'Annual \$24.99',
                      subtitle: '7 days free trial . \$2.08/yo',
                    ),
                    SizedBox(height: 10.h),
                    _subScriptionCard(
                      isActive: true,
                      title: 'Monthly \$4.99',
                      subtitle: '\$2.08/mo',
                    ),
                    SizedBox(height: 40.h),
                    CustomButton(text: 'Purchase', onPressed: () {}),
                    CustomButton(
                      text: 'Restore purchase',
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteName.homeScreen,
                          (predicate) => false,
                        );
                      },
                      textColor: ColorManager.primary700,
                      backgroundColor: ColorManager.transparentColor,
                      borderColor: ColorManager.transparentColor,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _subScriptionCard({
    required String title,
    required String subtitle,
    bool? isActive = false,
  }) {
    return Container(
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: ColorManager.transparentColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          width: (isActive ?? false) ? 1.w : 3.w,
          color: (isActive ?? false)
              ? ColorManager.grey200
              : ColorManager.primary600,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: SvgPicture.asset(
              IconManager.correct,
              width: 24.w,
              height: 24.h,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: CustomTitle(
              title: title,
              fontSizeTitle: 17.sp,
              subtitle: subtitle,
              fontSizeSubTitle: 12.sp,
            ),
          ),
          (isActive ?? true)
              ? SizedBox()
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: ColorManager.grey100,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Text(
                    '20% OFF',
                    style: getLightStyle12_400(
                      color: ColorManager.typography400,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildText({required String text}) {
    return Row(
      children: [
        SvgPicture.asset(IconManager.correct, width: 16.w, height: 16.w),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            text,
            style: getRegularStyle16_400(
              color: ColorManager.typography400,
              fontSize: 15.sp,
            ),
          ),
        ),
      ],
    );
  }
}
