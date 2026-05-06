import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                IconManager.arrowBack,
                width: 6.94.w,
                height: 12.38.h,
              ),
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

        Center(
          child: SvgPicture.asset(
            IconManager.boboIcon,
            width: 66.26.w,
            height: 22.47.h,
          ),
        ),
        Text('      '),
      ],
    );
  }
}
