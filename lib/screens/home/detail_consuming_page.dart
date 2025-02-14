import 'package:bundacare/screens/widgets/appbar_widget.dart';
import 'package:bundacare/screens/home/widgets/nutrition_widget.dart';
import 'package:bundacare/screens/widgets/picture_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:flutter/material.dart';

class DetailConsumingPage extends StatelessWidget {
  const DetailConsumingPage({super.key});

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
            decoration: const BoxDecoration(
              color: AppColor.primary,
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
                  'Nasi Goreng',
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
          SizedBox(
            height: 110,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                return NutritionDetailSquareWidget(index: index);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 16);
              },
              itemCount: 4,
            ),
          ),
        ],
      ),
    );
  }
}
