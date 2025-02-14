
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:flutter/material.dart';

class IconButtonCostume extends StatelessWidget {
  const IconButtonCostume({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
    this.iconColor,
  });

  final String title;
  final IconData icon;
  final Function()? onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      icon: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColor.primary.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              icon,
              size: 20,
              color: AppColor.primary,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: AppTypography.regular.copyWith(color: iconColor),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 14,
          ),
        ],
      ),
    );
  }
}
