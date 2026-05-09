import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Assuming these imports based on your provided code
import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:bobo_food/core/route/route_name.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_title.dart';
import 'package:flutter_svg/svg.dart';

class NoCouponAddedScreen extends StatefulWidget {
  const NoCouponAddedScreen({super.key});

  @override
  State<NoCouponAddedScreen> createState() => _NoCouponAddedScreenState();
}

class _NoCouponAddedScreenState extends State<NoCouponAddedScreen> {
  bool showAll = false;

  // Mock data to match the image
  final List<Map<String, dynamic>> items = [
    {"name": "Pepperoni Cheese Pizza", "price": "12.99", "qty": 2},
    {"name": "Classic Burger", "price": "12.75", "qty": 1},
    {"name": "Donut Box", "price": "13.45", "qty": 1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              // ================= HEADER =================
              const CustomHeader(middleTitle: 'Place order'),
              SizedBox(height: 20.h),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // ================= ITEMS LIST =================
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: showAll ? 5 : items.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 12.h),
                        itemBuilder: (context, index) {
                          // Using data if available, else fallback
                          final item = index < items.length
                              ? items[index]
                              : items[0];
                          return _buildFoodItemCard(item);
                        },
                      ),

                      // ================= SHOW MORE =================
                      GestureDetector(
                        onTap: () => setState(() => showAll = !showAll),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Text(
                            showAll ? '- Show less' : '+1 more',
                            style: getBoldStyle24(
                              color: ColorManager.primary700,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),

                      // ================= ADD COUPON =================
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.grey50,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.addCouponScreen,
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                IconManager.coupon,
                                width: 24.w,
                                height: 24.h,
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                "Add a coupon",
                                style: getRegularStyle16_400(
                                  color: ColorManager.typography400,
                                  fontSize: 16.sp,
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset(IconManager.arrowRight),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // ================= PRICE BREAKDOWN =================
                      _buildPriceRow("Subtotal", "56.27"),
                      SizedBox(height: 12.h),
                      _buildPriceRow("Delivery Charges", "+3.99"),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Divider(
                          color: ColorManager.grey200,
                          thickness: 1,
                        ),
                      ),
                      _buildPriceRow("Total", "60.26", isTotal: true),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: CustomTitle(
                              title: '\$ 60.26',
                              fontSizeTitle: 24.sp,
                            ),
                          ),

                          Flexible(
                            flex: 3,
                            child: Expanded(
                              child: CustomButton(
                                text: 'Continue',
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteName.checkoutScreen,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= HELPER WIDGETS =================

  Widget _buildFoodItemCard(Map<String, dynamic> item) {
    return Container(
      height: 95.h,
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.grey200, width: 1.w),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              bottomLeft: Radius.circular(12.r),
            ),
            child: Image.network(
              'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=1000&auto=format&fit=crop',
              width: 100.w,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item['name'],
                    style: getRegularStyle16_400(
                      color: ColorManager.typography400,
                      fontSize: 15.sp,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${item['price']}',
                        style: getSemiBoldStyle22(
                          color: ColorManager.typography500,
                          fontSize: 16.sp,
                        ),
                      ),
                      _counter(item['qty']),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? getRegularStyle16_400(
                  color: ColorManager.typography500,
                  fontSize: 18.sp,
                )
              : getRegularStyle16_400(
                  color: ColorManager.typography400,
                  fontSize: 16.sp,
                ),
        ),
        Text(
          isTotal ? value : value,
          style: isTotal
              ? getBoldStyle24(
                  color: ColorManager.typography500,
                  fontSize: 18.sp,
                )
              : getSemiBoldStyle22(
                  color: ColorManager.typography400,
                  fontSize: 16.sp,
                ),
        ),
      ],
    );
  }

  Widget _counter(int count) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.grey100.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Row(
        children: [
          _counterButton(count > 1 ? Icons.remove : Icons.delete_outline),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 14.sp,
                color: ColorManager.typography500,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _counterButton(Icons.add),
        ],
      ),
    );
  }

  Widget _counterButton(IconData icon) {
    return Container(
      width: 28.w,
      height: 28.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorManager.whiteColor,
      ),
      child: Icon(icon, size: 16.sp, color: ColorManager.typography400),
    );
  }
}
