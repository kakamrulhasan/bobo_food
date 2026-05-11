import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/custom_header.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: ColorManager.whiteColor,
        body: SafeArea(
          child: Column(
            children: [
              // HEADER
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: CustomHeader(
                  middleTitle: 'My Orders',

                  endIcon: SvgPicture.asset(IconManager.dot),
                ),
              ),

              SizedBox(height: 10.h),

              // CUSTOM TAB BAR (Segmented Style)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  height: 50.h,
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F5F7), // Light grey background
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black54,
                    labelStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: const [
                      Tab(text: 'Current'),
                      Tab(text: 'Previous'),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10.h),

              // TAB VIEW
              Expanded(
                child: TabBarView(
                  children: [
                    _buildCurrentOrdersList(),
                    _buildPreviousOrdersList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreviousOrdersList() {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        _orderItem(
          imageUrl:
              'https://images.unsplash.com/photo-1592981749207-bdbb9b981cb5?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHVkZGluZ3xlbnwwfHwwfHx8MA%3D%3D',
          title: 'Order delivered',
          date: '26 October',
          summary: 'Pudding x1',
          price: '\$16.98',
        ),
        _orderItem(
          imageUrl:
              'https://cdn.shopify.com/s/files/1/1053/4132/files/untitled-design---2024-06-26t120533.378.png?v=1719418020',
          title: 'Order delivered',
          date: '20 October',
          summary: 'Honey Bee Pineapple P...',
          price: '\$26.99',
        ),
        _orderItem(
          imageUrl:
              'https://leitesculinaria.com/wp-content/uploads/2020/02/classic-cheeseburger-1200.jpg',
          title: 'Order delivered',
          date: '16 October',
          summary: 'Classic Beef Burger x1',
          price: '\$18.97',
          hasExtraItems: true,
        ),
        _orderItem(
          imageUrl:
              'https://kitchen335co.com/wp-content/uploads/2023/06/glazed-chocolate-donuts-thumbnail.jpg',
          title: 'Order delivered',
          date: '17 October',
          summary: 'Chocolate Donut x5',
          price: '\$26.95',
        ),
      ],
    );
  }

  Widget _buildCurrentOrdersList() {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        _orderItem(
          imageUrl:
              'https://www.schwartz.co.uk/-/media/project/oneweb/schwartz/recipes/recipe_image_update/march_18_2025/easy_pizza_recipe_800x800.webp?rev=217b39d7488a4aa7947174d6e475219f&vd=20250325T174436Z&extension=webp&hash=36F310B7BA2EA4491AADEC213844DF8B',
          title: 'Order delivered',
          date: '30 mins',
          summary: 'Pudding x1',
          price: '\$12.98',
          isActive: true,
        ),
      ],
    );
  }

  Widget _orderItem({
    required String imageUrl,
    required String title,
    required String date,
    required String summary,
    required String price,
    bool hasExtraItems = false,
    bool isActive = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      imageUrl,
                      width: 70.w,
                      height: 120.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (hasExtraItems) ...[
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.network(
                            imageUrl,
                            width: 40.w,
                            height: 40.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F5F7),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Center(
                            child: Text(
                              '+1',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
              SizedBox(width: 16.w),
              // Order Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    _detailRow('Delivered on', date),
                    SizedBox(height: 4.h),
                    _detailRow('Order summary', summary, isBold: true),
                    SizedBox(height: 4.h),
                    _detailRow('Total price paid', price, isBold: true),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFE0E0E0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  child: Text(
                    isActive ? 'Track order' : 'Reorder',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFE0E0E0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 12.w,
                  ),
                ),
                child: const Icon(Icons.more_vert, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _detailRow(String label, String value, {bool isBold = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
        ),

        SizedBox(width: 10.w),

        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14.sp,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
