import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> food = ['Offers', 'Burger', 'Pizza', 'Donate', 'Hot Dog'];
  List<Map<String, dynamic>> foodList = [
    {
      "name": "Burger",
      "price": 12.75,
      "image":
          "https://assets.bonappetit.com/photos/5b919cb83d923e31d08fed17/1:1/w_2560%2Cc_limit/basically-burger-1.jpg",
    },
    {
      "name": "Cola",
      "price": 8.25,
      "image":
          "https://c8.alamy.com/comp/2AC0854/poznan-pol-sep-5-2019-cans-of-coca-cola-a-carbonated-soft-drink-manufactured-by-the-coca-cola-company-headquartered-in-atlanta-georgia-usa-2AC0854.jpg",
    },
    {
      "name": "Pizza",
      "price": 15.45,
      "image":
          "https://www.hunts.com/sites/g/files/qyyrlu211/files/uploadedImages/img_6934_48664.jpg",
    },
    {
      "name": "Hot Dog",
      "price": 7,
      "image":
          "https://www.belbrandsfoodservice.com/wp-content/uploads/2018/05/recipe-desktop-merkts-cheesy-hot-dawg.jpg",
    },
    {
      "name": "Fried Chicken",
      "price": 15.75,
      "image": "https://media.timeout.com/images/106296957/image.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ================= Header Section ===============
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi Daniel \nWhat are you carving?',
                      style: getRegularStyle16_400(
                        color: ColorManager.typography500,
                        fontSize: 17.sp,
                      ).copyWith(letterSpacing: -1),
                    ),
                    ClipOval(
                      child: Image.network(
                        'https://wallpapers.com/images/featured/cool-profile-picture-87h46gcobjl5e4xu.jpg',
                        width: 40.w,
                        height: 40.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                // =================== Search Bar =================
                CustomTextField(
                  hintText: 'search...',
                  suffixIcon: IconManager.search,
                ),
                SizedBox(height: 10.h),
                // ================== Adds Carts ==================
                Container(
                  height: 140.h,
                  width: 335.w,
                  decoration: BoxDecoration(
                    color: ColorManager.primary100,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0.w,

                        child: SvgPicture.asset(
                          IconManager.burgerBg,
                          width: 144.47.w,
                          height: 149.23.h,
                        ),
                      ),
                      Positioned(
                        top: 40.h,
                        left: 40.w,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '35% OFF on\nBurgers!',
                              style: getBoldStyle24(
                                color: ColorManager.typography500,
                              ).copyWith(letterSpacing: -1),
                            ),
                            SizedBox(height: 5.h),
                            CustomButton(
                              text: 'Buy now',
                              onPressed: () {},
                              height: 28.h,
                              width: 85.w,
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        right: 40.w,
                        top: 5.h,
                        child: SvgPicture.asset(
                          IconManager.burger,
                          width: 106.76.w,
                          height: 126.89.h,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                // ========= Horizontal Scrolling List ============
                SizedBox(
                  height: 60.h,
                  child: ListView.builder(
                    itemCount: food.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final isSelected = index == selectedIndex;
                      return InkWell(
                        splashColor: ColorManager.transparentColor,
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          width: 110.w,
                          margin: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 7.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? ColorManager.primary100
                                : ColorManager.transparentColor,
                            border: Border.all(
                              color: isSelected
                                  ? ColorManager.transparentColor
                                  : ColorManager.grey200,
                              width: isSelected ? 0 : 1.w,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Text(
                              food[index],
                              style: isSelected
                                  ? getSemiBoldStyle22(
                                      color: ColorManager.typography500,
                                      fontSize: 15.sp,
                                    )
                                  : getRegularStyle16_400(
                                      color: ColorManager.typography300,
                                      fontSize: 15.sp,
                                    ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                // ============== Grid View Section ===============
                GridView.builder(
                  itemCount: foodList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 0.78,
                  ),

                  itemBuilder: (context, index) {
                    final items = foodList[index];
                    return Card(
                      color: ColorManager.transparentColor,
                      elevation: 5,
                      shadowColor: ColorManager.transparentColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: ColorManager.grey200,
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),

                      child: Padding(
                        padding: EdgeInsets.all(4.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.r),
                                    topRight: Radius.circular(12.r),
                                    bottomLeft: Radius.circular(4.r),
                                    bottomRight: Radius.circular(4.r),
                                  ),
                                  child: Image.network(
                                    items['image'],
                                    width: 151.5.w,
                                    height: 132.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 5.h,
                                  left: 5.w,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    margin: EdgeInsets.symmetric(horizontal: 2),
                                    decoration: BoxDecoration(
                                      color: ColorManager.whiteColor,
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: SvgPicture.asset(
                                              IconManager.rating,
                                            ),
                                          ),
                                          const TextSpan(text: " 4.5"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '${items['name']}\n',
                                        style: getRegularStyle16_400(
                                          color: ColorManager.typography500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '\$${items["price"]}',
                                        style: getSemiBoldStyle22(
                                          color: ColorManager.typography500,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(''),
                                Text(''),
                                Text(''),
                                Text(''),
                                InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    padding: EdgeInsets.all(8.w),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorManager.primary100,
                                    ),
                                    child: SvgPicture.asset(
                                      IconManager.add,
                                      width: 13.3.w,
                                      height: 13.3.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
