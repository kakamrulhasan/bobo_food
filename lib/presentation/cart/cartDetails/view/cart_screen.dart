import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:bobo_food/core/route/route_name.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_icon_text_header.dart';
import 'package:bobo_food/presentation/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),

          child: Column(
            children: [
              // ================= HEADER =================
              Center(
                child: CustomIconTextHeader(
                  icon: IconManager.cart,
                  text: 'Cart',
                ),
              ),

              SizedBox(height: 10.h),

              // ================= LIST =================
              Expanded(
                child: ListView.separated(
                  itemCount: 5,

                  separatorBuilder: (context, index) {
                    return SizedBox(height: 12.h);
                  },

                  itemBuilder: (context, index) {
                    return Container(
                      height: 80.h,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorManager.grey100,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(6.r),
                      ),

                      child: Row(
                        children: [
                          // IMAGE
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6.r),
                              topRight: Radius.circular(2.r),
                              bottomLeft: Radius.circular(6.r),
                              bottomRight: Radius.circular(2.r),
                            ),

                            child: Image.network(
                              'https://wallpapers.com/images/featured/cool-profile-picture-87h46gcobjl5e4xu.jpg',
                              width: 90.w,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),

                          SizedBox(width: 8.w),

                          // DETAILS
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,

                                children: [
                                  Text(
                                    'Burger Item',
                                    style: getRegularStyle16_400(
                                      color: ColorManager.typography400,
                                      fontSize: 15.sp,
                                    ),
                                  ),

                                  Row(
                                    children: [
                                      Text(
                                        '\$12.34',
                                        style: getSemiBoldStyle22(
                                          color: ColorManager.typography500,
                                          fontSize: 15.sp,
                                        ),
                                      ),

                                      const Spacer(),

                                      _counter(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 10.h),

              // ================= BOTTOM BAR =================
              Row(
                children: [
                  CustomTitle(title: '\$ 56.27', fontSizeTitle: 24.sp),

                  const Spacer(),

                  SizedBox(
                    width: 180.w,
                    child: CustomButton(
                      text: 'Proceed to pay',
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.noCouponAdded);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= COUNTER WIDGET =================
  Widget _counter() {
    return Row(
      children: [
        _counterButton('-'),
        SizedBox(width: 6.w),
        Text(
          '1',
          style: TextStyle(
            fontSize: 14.sp,
            color: ColorManager.grey600,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 6.w),
        _counterButton('+'),
      ],
    );
  }

  Widget _counterButton(String text) {
    return Container(
      width: 22.w,
      height: 22.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorManager.grey200,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            color: ColorManager.grey600,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
