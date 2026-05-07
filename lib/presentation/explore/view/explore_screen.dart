import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:bobo_food/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<Map<String, dynamic>> itemTypes = [
    {
      "image":
          'https://www.mygfguide.com/wp-content/uploads/2022/06/cover-web-3-735x530.jpg',
      "name": 'Beef',
    },
    {
      "image":
          'https://public.touch2success.com/static/4f9ec0ab1c4adc8d6a32a982a63eaad7/img/1725096601php6YtWIk.jpg',
      "name": 'Desert',
    },
    {
      "image":
          'https://thumbs.dreamstime.com/b/unhealthy-fast-food-delivery-menu-featuring-assorted-burgers-cheeseburgers-nuggets-french-fries-soda-high-calorie-low-356045884.jpg',
      "name": 'Fast food',
    },
    {
      "image":
          'https://thumbs.dreamstime.com/b/luxury-seafood-platter-ice-high-angle-shot-showcases-luxurious-arranged-bed-against-dark-background-includes-whole-412163466.jpg',
      "name": 'Sea food',
    },
    {
      "image":
          'https://c.ndtvimg.com/2021-04/umk8i7ko_pasta_625x300_01_April_21.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=675',
      "name": 'Italian',
    },
    {
      "image":
          'https://blog.inivie.com/wp-content/uploads/2025/05/traditional-food-of-india.jpg',
      "name": 'Indian',
    },
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
              // ================= Header Section ==============
              CustomTextField(
                hintText: 'search for food...',
                suffixIcon: IconManager.search,
              ),
              SizedBox(height: 10.h),
              // ============== List View Section ==============
              Expanded(
                child: ListView.builder(
                  itemCount: itemTypes.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      width: double.infinity,
                      height: 150.h,
                      child: Stack(
                        children: [
                          // Background image
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              image: DecorationImage(
                                image: NetworkImage(itemTypes[index]['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          // Gradient overlay
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  ColorManager.secondary.withValues(alpha: 0.1),
                                  ColorManager.secondary.withValues(alpha: 0.7),
                                ],
                              ),
                            ),
                          ),

                          // Text on top
                          Center(
                            child: Text(
                              itemTypes[index]['name'],
                              style: getBoldStyle24(
                                color: ColorManager.whiteColor,
                              ).copyWith(wordSpacing: -1),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
