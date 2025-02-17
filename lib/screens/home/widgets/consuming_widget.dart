import 'package:bundacare/data/models/nutrition_model.dart';
import 'package:bundacare/screens/widgets/picture_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:bundacare/utils/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConsumingWidget extends StatelessWidget {
  const ConsumingWidget({
    super.key,
    required this.nutrition,
  });

  final Nutrition nutrition;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: IconButton(
        onPressed: () {
          context.pushNamed(RouterPath.detailConsuming, extra: {
            'nutrition': nutrition,
          });
        },
        style: IconButton.styleFrom(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        icon: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(nutrition.urlGambar),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.62,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 180,
                          child: Text(
                            nutrition.namaMakanan,
                            style: AppTypography.medium.copyWith(
                              color: AppColor.black,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const CustomSvgPicture(
                              assetName: AppIcon.clockIcon,
                              height: 16,
                              color: AppColor.grey,
                            ),
                            Text(
                              nutrition.id.toString(),
                              style: AppTypography.medium.copyWith(
                                color: AppColor.grey,
                                fontSize: AppTypographySize.caption,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      icon(
                        AppIcon.caloryIcon,
                        nutrition.kalori.toString(),
                      ),
                      const SizedBox(width: 4),
                      icon(
                        AppIcon.proteinIcon,
                        nutrition.protein.toString(),
                      ),
                      const SizedBox(width: 4),
                      icon(
                        AppIcon.fatIcon,
                        nutrition.lemak.toString(),
                      ),
                      const SizedBox(width: 4),
                      icon(
                        AppIcon.carbohydrateIcon,
                        nutrition.karbo.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row icon(String assetName, String value) {
    return Row(
      children: [
        CustomSvgPicture(
          assetName: assetName,
          width: 20,
        ),
        const SizedBox(width: 2),
        Text(
          '$value kg',
          style: AppTypography.light.copyWith(
            color: AppColor.black,
            fontSize: AppTypographySize.caption,
          ),
        ),
      ],
    );
  }
}
