import 'package:bundacare/screens/widgets/bar_widget.dart';
import 'package:bundacare/screens/widgets/consuming_widget.dart';
import 'package:bundacare/screens/widgets/nav_detail_widget.dart';
import 'package:bundacare/screens/widgets/nutrition_widget.dart';
import 'package:bundacare/screens/widgets/picture_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:bundacare/utils/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomeBar(),
            Stack(
              children: [
                Container(
                  height: 68,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColor.primary.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Container(
                  height: 68,
                  width: MediaQuery.of(context).size.width * 0.55,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Container(
                  height: 68,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Trimester 1',
                            style: AppTypography.medium.copyWith(
                              color: AppColor.white,
                              fontSize: AppTypographySize.body2,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const CustomSvgPicture(
                                assetName: AppIcon.calenderIcon,
                                color: AppColor.black,
                                height: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '12 Jan 25',
                                style: AppTypography.light.copyWith(
                                  color: AppColor.black,
                                  fontSize: AppTypographySize.body3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'Week 1',
                        style: AppTypography.light.copyWith(
                          color: AppColor.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            NavDetailWidget(
              title: AppID.nutritionText,
              onPressed: () {
                context.pushNamed(RouterPath.detailNutrition);
              },
            ),
            SizedBox(
              height: 110,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  return NutritionSquareWidget(index: index);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 16);
                },
                itemCount: 4,
              ),
            ),
            NavDetailWidget(
              title: AppID.consumingText,
              onPressed: () {},
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 20.0),
                itemBuilder: (context, index) {
                  return ConsumingWidget(index: index);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
