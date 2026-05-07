import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constansts/color_manager.dart';
import '../../../core/constansts/icon_manager.dart';
import '../../../core/constansts/style_manager.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_text_header.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ============ Header Section ============
              CustomIconTextHeader(icon: IconManager.love, text: 'Favorites'),
              Spacer(),
              // ========== Empty Box Section ===========
              SvgPicture.asset(
                IconManager.emptyBox,
                width: 200.w,
                height: 200.h,
              ),
              SizedBox(height: 20.h),
              // =========== Title & SubTitle ===========
              Padding(
                padding: EdgeInsets.all(16.0.w),
                child: Text(
                  'Nothing found here!',
                  textAlign: TextAlign.center,
                  style: getBoldStyle24(
                    color: ColorManager.typography500,
                    fontSize: 32.sp,
                  ).copyWith(wordSpacing: -2),
                ),
              ),

              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
