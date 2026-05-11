import 'package:bobo_food/core/constansts/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvg extends StatelessWidget {
  final String? icon;
  final double? width;
  final double? height;
  final BorderRadius? radius;

  const CustomSvg({super.key, this.icon, this.width, this.height, this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: radius),
      width: width,
      height: height,
      child: icon != null
          ? SvgPicture.asset(icon!, color: ColorManager.grey600)
          : const SizedBox(),
    );
  }
}
