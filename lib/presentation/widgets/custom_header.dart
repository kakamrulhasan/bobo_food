import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomHeader extends StatelessWidget {
  final String? leadTitle;
  final String? middleTitle;
  final String? endTitle;
  final Color? endTitleColor;
  const CustomHeader({
    super.key,
    this.leadTitle,
    this.middleTitle,
    this.endTitle,
    this.endTitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // =========== Leading Section =============
        leadTitle != null
            ? Text(
                leadTitle!,
                style: getBoldStyle24(
                  color: ColorManager.typography400,
                  fontSize: 15.sp,
                ),
              )
            : InkWell(
                splashColor: ColorManager.transparentColor,
                highlightColor: ColorManager.transparentColor,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      IconManager.arrowBack,
                      width: 6.94.w,
                      height: 12.38.h,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Back',
                      style: getBoldStyle24(
                        color: ColorManager.typography500,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              ),

        // ================= Center Section ================
        middleTitle != null
            ? Text(
                middleTitle!,
                style: getBoldStyle24(
                  color: ColorManager.typography500,
                  fontSize: 17.sp,
                ),
              )
            : Center(
                child: SvgPicture.asset(
                  IconManager.boboIcon,
                  width: 66.26.w,
                  height: 22.47.h,
                ),
              ),
        // ============= End Section ================
        endTitle != null
            ? Text(
                endTitle!,
                style: getBoldStyle24(
                  color: endTitleColor != null
                      ? endTitleColor!
                      : ColorManager.primary600,
                  fontSize: 15.sp,
                ),
              )
            : Text('      '),
      ],
    );
  }
}
