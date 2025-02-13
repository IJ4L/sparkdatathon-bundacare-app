import 'package:bundacare/screens/widgets/picture_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:flutter/material.dart';

class NavigationDestinantionCostume extends StatelessWidget {
  const NavigationDestinantionCostume({
    super.key,
    required this.selected,
    required this.onPressed,
    required this.icon,
    required this.index,
    required this.title,
  });

  final int selected, index;
  final String icon, title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 62,
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgPicture(
              assetName: icon,
              width: 24,
              height: 24,
              color: selected == index ? AppColor.primary : AppColor.grey,
            ),
            const SizedBox(height: 2),
            Text(
              title,
              style: AppTypography.regular.copyWith(
                color: selected == index ? AppColor.primary : AppColor.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
