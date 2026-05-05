import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/presentation/onBoarding/viewmodel/onBoarding_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/route/route_name.dart';

class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  ConsumerState<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen> {
  final PageController _controller = PageController();

  final List<String> images = [
    IconManager.birthdayGirlLight,
    IconManager.burgerLight,
    IconManager.chefCookingLight,
    IconManager.deliveryGuyLight,
  ];

  void skip() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteName.homeScreen,
      (route) => false,
    );
  }

  void finish() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteName.homeScreen,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(onBoardingProvider);

    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Stack(
        children: [
          // ============== App Logo / Background ===============
          Positioned(
            top: 80,
            left: 20,
            right: 20,
            child: SvgPicture.asset(IconManager.boboIcon, height: 40),
          ),

          // =============== PageView ================
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 160), // 👈 move UP/DOWN here
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (index) {
                    ref.read(onBoardingProvider.notifier).setPage(index);
                  },
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          images[index],
                          fit: BoxFit.contain,
                          width: 300,
                        ),
                        SizedBox(height: 50),
                        Text('Welcome to the most tastiest app'),
                        SizedBox(height: 20),
                        Text(
                          'You know, this app is edible meaning you can eat it',
                        ),
                        SizedBox(height: 70),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          // ================= Indicator =================
          Positioned(
            bottom: 180,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: images.length,
                effect: JumpingDotEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: ColorManager.primaryGreen,
                  dotColor: ColorManager.lightGreenBg,
                ),
              ),
            ),
          ),

          // =============== Bottom Button =============
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                final notifier = ref.read(onBoardingProvider.notifier);

                if (currentIndex < images.length - 1) {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                  notifier.setPage(currentIndex + 1);
                } else {
                  finish();
                }
              },
              child: Text(
                currentIndex == images.length - 1 ? "Get Started" : "Continue",
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),

          // =============== Skip Button =============
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: skip,
              child: const Text("Skip", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
