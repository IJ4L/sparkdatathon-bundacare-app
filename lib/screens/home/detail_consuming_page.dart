import 'package:bundacare/data/models/nutrition_model.dart';
import 'package:bundacare/screens/widgets/appbar_widget.dart';
import 'package:bundacare/screens/home/widgets/nutrition_widget.dart';
import 'package:bundacare/screens/widgets/picture_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:flutter/material.dart';

class DetailConsumingPage extends StatelessWidget {
  const DetailConsumingPage({super.key, required this.nutrition});

  final Nutrition nutrition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(context, 'Konsumsi', () {
        Navigator.pop(context);
      }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(nutrition.urlGambar),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Wrap(
              children: [
                Text(
                  nutrition.namaMakanan,
                  style: AppTypography.medium.copyWith(
                    color: AppColor.black,
                    fontSize: AppTypographySize.body1,
                  ),
                ),
                Row(
                  children: [
                    const CustomSvgPicture(
                      assetName: AppIcon.clockIcon,
                      height: 24,
                      color: AppColor.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '16 Min',
                      style: AppTypography.medium.copyWith(
                        color: AppColor.grey,
                        fontSize: AppTypographySize.body4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              AppID.consumingText,
              style: AppTypography.medium.copyWith(
                color: AppColor.black,
                fontSize: AppTypographySize.body3,
              ),
            ),
          ),
          Container(
            height: 110,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                NutritionDetailSquareWidget(
                  index: 0,
                  data: nutrition.kalori.toString(),
                ),
                const SizedBox(width: 10.0),
                NutritionDetailSquareWidget(
                  index: 1,
                  data: nutrition.protein.toString(),
                ),
                const SizedBox(width: 10.0),
                NutritionDetailSquareWidget(
                  index: 2,
                  data: nutrition.karbo.toString(),
                ),
                const SizedBox(width: 10.0),
                NutritionDetailSquareWidget(
                  index: 3,
                  data: nutrition.lemak.toString(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
