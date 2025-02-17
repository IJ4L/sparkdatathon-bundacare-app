import 'package:bundacare/screens/widgets/picture_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:flutter/material.dart';

class NavDetailWidget extends StatelessWidget {
  const NavDetailWidget({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isOn,
  });

  final String title;
  final Function()? onPressed;
  final bool isOn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 14,
        right: 20,
        left: 20,
        bottom: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTypography.medium.copyWith(
                  color: AppColor.black,
                  fontSize: AppTypographySize.body3,
                ),
              ),
              const SizedBox(width: 4),
              SizedBox(
                height: 30,
                child: TextButton(
                  onPressed: onPressed,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    foregroundColor: AppColor.primary.withValues(alpha: 0.8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        AppID.seeDetailText,
                        style: AppTypography.light.copyWith(
                          color: isOn ? AppColor.white : AppColor.black,
                        ),
                      ),
                      const SizedBox(width: 4),
                      CustomSvgPicture(
                        assetName: AppIcon.arrowIcon,
                        color: isOn ? AppColor.white : AppColor.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
