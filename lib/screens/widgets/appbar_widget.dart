import 'package:bundacare/screens/widgets/picture_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar appbarWidget(BuildContext context, String title) {
  return AppBar(
    backgroundColor: AppColor.background,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        context.pop();
      },
      icon: const CustomSvgPicture(
        assetName: AppIcon.backIcon,
        height: 24,
        color: AppColor.black,
      ),
    ),
    title: Text(
      title,
      style: AppTypography.medium.copyWith(
        color: AppColor.black,
        fontSize: AppTypographySize.body3,
      ),
    ),
    centerTitle: true,
  );
}
