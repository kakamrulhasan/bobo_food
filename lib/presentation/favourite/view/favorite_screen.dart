import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_icon_text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
              Text(
                'Nothing found here!',
                style: getBoldStyle24(
                  color: ColorManager.typography500,
                  fontSize: 32.sp,
                ).copyWith(wordSpacing: -2),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0.w,
                  vertical: 10.h,
                ),
                child: Text(
                  'Explore and add items to the favorites to show here...',
                  textAlign: TextAlign.center,
                  style: getRegularStyle16_400(
                    color: ColorManager.typography400,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              // ============ Button Section ============
              SizedBox(
                width: 120.w,
                height: 40.h,
                child: CustomButton(text: 'Explore', onPressed: () {}),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
