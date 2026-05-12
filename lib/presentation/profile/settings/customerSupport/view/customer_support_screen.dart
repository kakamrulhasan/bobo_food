import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/icon_manager.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomerSupportScreen extends StatefulWidget {
  const CustomerSupportScreen({super.key});

  @override
  State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              // ========== CUSTOM HEADER =======
              CustomHeader(middleTitle: 'Customer Support'),

              SizedBox(height: 16.h),

              // ========== CHAT AREA ===========
              Expanded(
                child: ListView(
                  children: [
                    // 1. User Message (Top)
                    _buildChatBubble(
                      text:
                          "cheese pizza but I have received a different. There must have been a mistake somewhere. Please replace it.",
                      isUser: true,
                    ),

                    SizedBox(height: 16.h),

                    // 2. Support Message
                    _buildChatBubble(
                      text:
                          "We are very sorry to hear that. We will immediately resend the delivery guy for replacement. But first, please send a picture of the pizza for confirmation.",
                      isUser: false,
                    ),

                    SizedBox(height: 16.h),

                    // 3. User Image + Message
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Pizza Image
                          Container(
                            width: 180.w,
                            height: 140.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=1000&auto=format&fit=crop',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          SizedBox(height: 8.h),

                          _buildChatBubble(
                            text:
                                "Here’s a picture for confirmation. Now’s please replace it. Thank you.",
                            isUser: true,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // 4. Typing Indicator
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 18.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.whiteColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.r),
                            topRight: Radius.circular(16.r),
                            bottomRight: Radius.circular(16.r),
                          ),
                          border: Border.all(
                            color: ColorManager.grey200,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildDot(ColorManager.grey600),
                            SizedBox(width: 4.w),
                            _buildDot(ColorManager.grey400),
                            SizedBox(width: 4.w),
                            _buildDot(ColorManager.grey200),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              _buildInputArea(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatBubble({required String text, required bool isUser}) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: isUser ? ColorManager.grey100 : ColorManager.whiteColor,
          border: isUser ? null : Border.all(color: ColorManager.grey200),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(isUser ? 16.r : 4.r),
            bottomRight: Radius.circular(isUser ? 4.r : 16.r),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: ColorManager.typography400,
            fontSize: 15.sp,
            height: 1.4,
          ),
        ),
      ),
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 6.w,
      height: 6.h,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(color: ColorManager.whiteColor),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              hintText: 'Type here...',
              prefixIcon: IconManager.add,
            ),
          ),

          SizedBox(width: 12.w),

          Container(
            height: 50.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: ColorManager.primary600,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: SvgPicture.asset(
              IconManager.send,
              width: 32.w,
              height: 32.h,
            ),
          ),
        ],
      ),
    );
  }
}
