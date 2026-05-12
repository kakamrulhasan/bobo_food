import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:bobo_food/core/constansts/style_manager.dart';
import 'package:bobo_food/presentation/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  // Current selected language
  String _selectedLanguage = "English";

  // List of languages
  final List<String> _languages = [
    "English",
    "Hindi",
    "Sanskrit",
    "Urdu",
    "French",
    "Spanish",
    "Chinese",
    "Japanese",
    "Korean",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              // ============ CUSTOM HEADER =============
              CustomHeader(
                leadTitle: 'Cancel',
                middleTitle: 'Language',
                endTitle: 'Save',
              ),

              SizedBox(height: 20.h),

              // ============ LANGUAGE LIST ==============
              Expanded(
                child: ListView.builder(
                  itemCount: _languages.length,
                  itemBuilder: (context, index) {
                    final language = _languages[index];
                    final isSelected = _selectedLanguage == language;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedLanguage = language;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 18.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.grey50,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              language,
                              style: getRegularStyle16_400(
                                color: ColorManager.typography500,
                                fontSize: 15.sp,
                              ),
                            ),

                            // Custom Radio Button
                            Container(
                              width: 24.w,
                              height: 24.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? ColorManager.primary600
                                      : ColorManager.grey200,
                                  width: isSelected ? 2 : 1.5,
                                ),
                              ),
                              padding: EdgeInsets.all(3.w),
                              child: isSelected
                                  ? Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorManager.primary600,
                                      ),
                                    )
                                  : null,
                            ),
                          ],
                        ),
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
