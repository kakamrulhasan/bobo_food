import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constansts/color_manager.dart';
import '../../core/constansts/icon_manager.dart';
import '../../core/constansts/style_manager.dart';

class CustomItem extends StatelessWidget {
  final String? icon;
  final String title;
  const CustomItem({super.key, this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorManager.grey50,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            SvgPicture.asset(
              icon!,
              width: 24.w,
              height: 24.h,
              color: ColorManager.grey600,
            ),
          ],

          SizedBox(width: 16.w),
          Text(
            title,
            style: getRegularStyle16_400(
              color: ColorManager.typography500,
              fontSize: 15.sp,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(IconManager.arrowRight),
        ],
      ),
    );
  }
}
