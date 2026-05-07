import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constansts/icon_manager.dart';
import '../../../../core/constansts/style_manager.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, dynamic> foodData;
  const ProductDetails({super.key, required this.foodData});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final PageController controller = PageController();
  bool selectIndex = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =============== Header Section ==============
                Row(
                  children: [
                    InkWell(
                      splashColor: ColorManager.transparentColor,
                      highlightColor: ColorManager.transparentColor,
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
                    InkWell(
                      splashColor: ColorManager.transparentColor,
                      highlightColor: ColorManager.transparentColor,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Back',
                        style: getBoldStyle24(
                          color: ColorManager.typography500,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      IconManager.exit,
                      width: 18.w,
                      height: 18.h,
                    ),
                    SizedBox(width: 25.w),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          selectIndex = !selectIndex;
                        });
                      },
                      child: SvgPicture.asset(
                        selectIndex ? IconManager.love2 : IconManager.love,
                        width: 18.w,
                        height: 18.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                // ============== Cover Pic Section ============
                SizedBox(
                  height: 250.h,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Image.network(
                            widget.foodData['image'],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 15.h),
                // ============= Dotted Section ================
                Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 5,
                    effect: JumpingDotEffect(
                      dotHeight: 10.h,
                      dotWidth: 10.w,
                      activeDotColor: ColorManager.primary600,
                      dotColor: ColorManager.primary100,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                // ============== details table ================
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: ColorManager.grey200),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // rating section
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: SvgPicture.asset(
                                IconManager.rating,
                                width: 13.3.w,
                                height: 13.3.h,
                              ),
                            ),
                            TextSpan(
                              text: " ${widget.foodData['rating']}",
                              style: getRegularStyle16_400(
                                color: ColorManager.typography400,
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text('|', style: TextStyle(color: ColorManager.grey400)),
                      // calory section
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: SvgPicture.asset(
                                IconManager.fire,
                                width: 20.w,
                                height: 20.h,
                              ),
                            ),
                            TextSpan(
                              text: " 300kcal",
                              style: getRegularStyle16_400(
                                color: ColorManager.typography400,
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text('|', style: TextStyle(color: ColorManager.grey400)),

                      // time section
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: SvgPicture.asset(
                                IconManager.clock,
                                width: 20.w,
                                height: 20.h,
                              ),
                            ),
                            TextSpan(
                              text: " 20mins",
                              style: getRegularStyle16_400(
                                color: ColorManager.typography400,
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                // ========== Title & item Counter =============
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Flexible ONE
                    Flexible(
                      flex: 3,
                      child: CustomTitle(
                        title: widget.foodData['name'],
                        fontSizeTitle: 17.sp,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    // Flexible TWO
                    Flexible(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(5.w),
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          border: Border.all(
                            color: ColorManager.grey200,
                            width: 2.w,
                          ),
                          color: ColorManager.whiteColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.r),
                                border: Border.all(
                                  color: ColorManager.grey200,
                                  width: 2.w,
                                ),
                                color: ColorManager.grey200,
                              ),
                              child: Center(
                                child: Text(
                                  '-',
                                  style: getBoldStyle24(
                                    color: ColorManager.grey600,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                '1',
                                style: getBoldStyle24(
                                  fontSize: 17.sp,
                                  color: ColorManager.grey600,
                                ),
                              ),
                            ),
                            Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.r),
                                border: Border.all(
                                  color: ColorManager.grey200,
                                  width: 2.w,
                                ),
                                color: ColorManager.grey200,
                              ),
                              child: Center(
                                child: Text(
                                  '+',
                                  style: getBoldStyle24(
                                    color: ColorManager.grey600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                // =========== SubTitle & ReadMore =============
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This is your full long paragraph text goes here. You can show everything when expanded. You can show everything when expanded. You can show everything when expanded. You can show everything when expanded. You can show everything when expanded. You can show everything when expanded. You can show everything when expanded. You can show everything when expanded. You can show everything when expanded. You can show everything when expanded. You can show everything when expanded. biri',
                      style: getLightStyle12_400(
                        color: ColorManager.typography400,
                      ),
                      maxLines: isExpanded ? null : 2,
                      overflow: TextOverflow.fade,
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        isExpanded ? 'Read less' : 'Read more...',
                        style: getLightStyle12_400(
                          color: ColorManager.typography500,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                // ============= price $ Button ================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: CustomTitle(
                        title: '\$12.99',
                        fontSizeTitle: 24.sp,
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: CustomButton(
                        text: 'Add to card',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
