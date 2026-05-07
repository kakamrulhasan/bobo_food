import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constansts/color_manager.dart';
import '../../core/constansts/style_manager.dart';

class CustomIconTextHeader extends StatelessWidget {
  final String? icon;
  final String? text;
  const CustomIconTextHeader({super.key, this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: Transform.rotate(
              angle: -15 * 3.1416 / 180,
              child: SvgPicture.asset(
                icon!,
                width: 16.w,
                height: 16.h,
                color: ColorManager.typographyHeading,
              ),
            ),
          ),

          TextSpan(
            text: '  ${text!}',
            style: getBoldStyle24(
              color: ColorManager.typographyHeading,
              fontSize: 17.sp,
            ),
          ),
        ],
      ),
    );
  }
}
