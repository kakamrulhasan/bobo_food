import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constansts/color_manager.dart';
import '../../core/constansts/icon_manager.dart';
import '../../core/constansts/style_manager.dart';

class CustomToggle extends StatefulWidget {
  final bool showIcon;
  final String title;
  const CustomToggle({super.key, required this.showIcon, required this.title});

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: ColorManager.grey50,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          if (widget.showIcon) ...[SvgPicture.asset(IconManager.moon)],
          SizedBox(width: 16.w),

          Text(
            widget.title,
            style: getRegularStyle16_400(
              color: ColorManager.typography500,
              fontSize: 15.sp,
            ),
          ),
          const Spacer(),
          Switch(
            value: _isDarkMode,
            onChanged: (value) {
              setState(() {
                _isDarkMode = value;
              });
            },
            activeColor: ColorManager.grey100,
            activeTrackColor: ColorManager.primary600,
            inactiveThumbColor: ColorManager.grey400,
            inactiveTrackColor: ColorManager.grey100,
          ),
        ],
      ),
    );
  }
}
