import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:bobo_food/presentation/onBoarding/viewmodel/onBoarding_riverpod.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    IconManager.chefCookingLight,
    IconManager.deliveryGuyLight,
    IconManager.birthdayGirlLight,
    IconManager.burgerLight,
  ];
  final List<String> headline = [
    'Welcome to the most tastiest app',
    'We use nitro on bicycles for delivery!',
    "We're the besties of birthday peoples",
    'Join to get the delicious quizines!',
  ];
  final List<String> subTitle = [
    'You know, this app is edible meaning you can eat it',
    "For very fast delivery we use nitro on bicycles, kidding, but we're very fast.",
    'We send cakes to our plus members, (only one cake per person)',
    '',
  ];

  void skip() {
    final lastIndex = images.length - 1;

    _controller.animateToPage(
      lastIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );

    ref.read(onBoardingProvider.notifier).setPage(lastIndex);
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
      body: Padding(
        padding: EdgeInsets.all(18.0.w),
        child: Stack(
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
                padding: EdgeInsets.only(top: 160.h),
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
                          SizedBox(height: 15.h),
                          Text(
                            headline[index],
                            textAlign: TextAlign.center,
                            style: getBoldStyle24(
                              fontWeight: FontWeight.w700,
                              fontSize: 32.sp,
                              color: ColorManager.darkOliveText,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            subTitle[index],
                            textAlign: TextAlign.center,
                            style: getRegularStyle16_400(
                              color: ColorManager.typography400,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            // ================= Indicator =================
            Positioned(
              bottom: 150,
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
              child: Row(
                children: [
                  CustomButton(
                    text: 'skip',
                    width: 100.w,
                    onPressed: skip,
                    backgroundColor: ColorManager.primary100,
                    textColor: ColorManager.primaryGreen,
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: ColorManager.primaryGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
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
                        currentIndex == images.length - 1
                            ? "Get Started"
                            : "Continue",
                        style: getBoldStyle24(
                          color: ColorManager.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // =============== Skip Button =============
            Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                onPressed: skip,
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
