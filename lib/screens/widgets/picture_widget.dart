import 'package:bundacare/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgPicture extends StatelessWidget {
  final String assetName;
  final double width;
  final double height;
  final Color color;

  const CustomSvgPicture({
    required this.assetName,
    this.width = 24,
    this.height = 24,
    super.key,
    this.color = AppColor.primary,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}

class CustomPicture extends StatelessWidget {
  final String assetName;
  final double width;
  final double height;

  const CustomPicture({
    required this.assetName,
    this.width = 24,
    this.height = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
