import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:bobo_food/core/route/route_name.dart';
import 'package:bobo_food/presentation/widgets/custom_button.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:bobo_food/presentation/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class SignUpForgetOtpScreen extends StatefulWidget {
  const SignUpForgetOtpScreen({super.key});

  @override
  State<SignUpForgetOtpScreen> createState() => _SignUpForgetOtpScreenState();
}

class _SignUpForgetOtpScreenState extends State<SignUpForgetOtpScreen> {
  late final TextEditingController pinController;
  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 77.75.w,
      height: 48.h,

      textStyle: getSemiBoldStyle22(
        fontSize: 15.sp,
        color: ColorManager.typography500,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorManager.grey200),
      ),
    );
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(),
              SizedBox(height: 25.h),
              CustomTitle(
                title: 'Verify your new account',
                subtitle:
                    'Enter the verification code sent to your email sample@example.com',
              ),

              SizedBox(height: 20.h),
              Pinput(
                defaultPinTheme: defaultPinTheme,
                controller: pinController,
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 9.h),
                      width: 22.w,
                      height: 3.h,
                      color: ColorManager.darkOliveText,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: ColorManager.primary600),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: ColorManager.transparentColor,
                    borderRadius: BorderRadius.circular(19.r),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: ColorManager.redColor),
                ),
              ),
              SizedBox(height: 25.h),

              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Didn't received the code? 00:20 ",
                        style: getRegularStyle16_400(
                          color: ColorManager.typography400,
                          fontSize: 15.sp,
                        ),
                      ),
                      TextSpan(
                        text: 'Resend',
                        style:
                            getSemiBoldStyle22(
                              fontWeight: FontWeight.w600,

                              color: ColorManager.typography100,
                              fontSize: 15.sp,
                            ).copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: ColorManager.typography100,
                              decorationThickness: 3.5,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.createNewProfile);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
