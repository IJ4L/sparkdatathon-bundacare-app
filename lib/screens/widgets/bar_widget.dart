import 'package:bundacare/screens/widgets/picture_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:flutter/material.dart';

class CustomeBar extends StatelessWidget {
  const CustomeBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, left: 20, right: 20, bottom: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomSvgPicture(
                assetName: AppIcon.appIcon,
                height: 30,
              ),
              const SizedBox(width: 2.0),
              Text(
                'undaCare',
                style: AppTypography.medium.copyWith(
                  color: AppColor.primary,
                  fontSize: AppTypographySize.body2,
                  height: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
