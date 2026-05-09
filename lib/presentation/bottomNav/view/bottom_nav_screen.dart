import 'dart:math' as math;

import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/presentation/cart/view/cart_empty_screen.dart';
import 'package:bobo_food/presentation/explore/view/explore_screen.dart';
import 'package:bobo_food/presentation/home/view/home_screen.dart';
import 'package:bobo_food/presentation/notification/view/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../favourite/view/favorite_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;

  final pages = [
    const HomeScreen(),
    const ExploreScreen(),
    const CartEmptyScreen(),
    const FavoriteScreen(),
    const NotificationScreen(),
  ];

  Widget navIcon(String icon, int index) {
    final isSelected = index == selectedIndex;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.rotate(
          angle: isSelected ? -15 * math.pi / 180 : 0,
          child: SvgPicture.asset(
            icon,
            width: isSelected ? 24.w : 20.w,
            height: isSelected ? 24.h : 20.h,
            colorFilter: ColorFilter.mode(
              isSelected ? ColorManager.primary600 : ColorManager.grey400,
              BlendMode.srcIn,
            ),
          ),
        ),

        SizedBox(height: 4.h),

        isSelected
            ? Container(
                width: 5.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: ColorManager.primary700,
                  shape: BoxShape.circle,
                ),
              )
            : SizedBox(height: 5.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: pages),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        backgroundColor: Colors.white,

        elevation: 10,

        selectedFontSize: 0,
        unselectedFontSize: 0,

        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: [
          BottomNavigationBarItem(
            icon: navIcon(IconManager.home, 0),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: navIcon(IconManager.explore, 1),
            label: 'Explore',
          ),

          BottomNavigationBarItem(
            icon: navIcon(IconManager.cart, 2),
            label: 'Cart',
          ),

          BottomNavigationBarItem(
            icon: navIcon(IconManager.love, 3),
            label: 'Favourite',
          ),

          BottomNavigationBarItem(
            icon: navIcon(IconManager.notification, 4),
            label: 'Notification',
          ),
        ],
      ),
    );
  }
}
