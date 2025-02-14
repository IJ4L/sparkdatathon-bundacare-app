import 'package:bundacare/screens/widgets/picture_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:flutter/material.dart';

final List<String> _nutritionList = [
  AppID.caloryText,
  AppID.proteinText,
  AppID.fatText,
  AppID.carbohydrateText,
];

class NutritionSquareWidget extends StatelessWidget {
  const NutritionSquareWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColor.primary.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(6),
            ),
            child: CustomSvgPicture(
              assetName: nutritionIcon[index],
              color: AppColor.primary,
            ),
          ),
          const Spacer(),
          Text(
            _nutritionList[index],
            style: AppTypography.light.copyWith(
              color: AppColor.grey,
              fontSize: AppTypographySize.body4,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '5432',
                style: AppTypography.medium.copyWith(
                  color: AppColor.black,
                  fontSize: AppTypographySize.body3,
                  height: 1,
                ),
              ),
              const SizedBox(width: 2),
              Text(
                '/ 2000 Kkal',
                style: AppTypography.light.copyWith(
                  color: AppColor.black,
                  fontSize: AppTypographySize.caption2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NutritionDetailSquareWidget extends StatelessWidget {
  const NutritionDetailSquareWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _nutritionList[index],
                style: AppTypography.light.copyWith(
                  color: AppColor.black,
                  fontSize: AppTypographySize.body4,
                ),
              ),
              const SizedBox(width: 20),
              CustomSvgPicture(
                assetName: nutritionIcon[index],
                color: AppColor.primary,
                height: 32,
              ),
            ],
          ),
          const Spacer(),
          Text(
            '5432',
            style: AppTypography.medium.copyWith(
              color: AppColor.black,
              fontSize: AppTypographySize.body1,
              height: 1,
            ),
          ),
          Text(
            'Kkal',
            style: AppTypography.light.copyWith(
              color: AppColor.black,
              fontSize: AppTypographySize.caption,
            ),
          ),
        ],
      ),
    );
  }
}

class NutritionBlocWidget extends StatelessWidget {
  const NutritionBlocWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColor.primary.withValues(),
              borderRadius: BorderRadius.circular(6),
            ),
            child: CustomSvgPicture(
              assetName: nutritionIcon[index],
              color: AppColor.primary,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _nutritionList[index],
                style: AppTypography.light.copyWith(
                  color: AppColor.grey,
                  fontSize: AppTypographySize.body4,
                  height: 1,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '5432',
                    style: AppTypography.medium.copyWith(
                      color: AppColor.black,
                      fontSize: AppTypographySize.body3,
                      height: 1,
                    ),
                  ),
                  const SizedBox(width: 2),
                  Text(
                    '/ 2000 Kkal',
                    style: AppTypography.light.copyWith(
                      color: AppColor.black,
                      fontSize: AppTypographySize.caption2,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          CircularProgressIndicator(
            value: 0.7,
            backgroundColor: AppColor.grey.withValues(alpha: 0.3),
            valueColor: const AlwaysStoppedAnimation<Color>(AppColor.primary),
            semanticsLabel: 'Linear progress indicator',
          ),
        ],
      ),
    );
  }
}
