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
          'https://videocdn.cdnpk.net/videos/a1b92608-06f3-54ab-98eb-1b53729e6750/horizontal/thumbnails/large.jpg',
      "name": 'Fast food',
    },
    {
      "image":
          'https://d1w7312wesee68.cloudfront.net/CLqVbJSaHKPCnF644k8-X_-bBdKcO9uGS_n2Kw7Km54/resize:fit:720:720/plain/s3://toasttab/restaurants/restaurant-84843000000000000/menu/images/item-a393e8fe-b7f1-49c9-b023-c840b10a31e8.jpg',
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
