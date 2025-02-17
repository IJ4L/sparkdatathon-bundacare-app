import 'package:bundacare/cubit/nutrition/nutrition_cubit.dart';
import 'package:bundacare/screens/widgets/bar_widget.dart';
import 'package:bundacare/screens/home/widgets/consuming_widget.dart';
import 'package:bundacare/screens/home/widgets/nav_detail_widget.dart';
import 'package:bundacare/screens/home/widgets/nutrition_widget.dart';
import 'package:bundacare/screens/widgets/picture_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:bundacare/utils/formatter/extension.dart';
import 'package:bundacare/utils/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            const SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  height: 76,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColor.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Container(
                  height: 76,
                  width: MediaQuery.of(context).size.width * 0.55,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Container(
                  height: 76,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Row(
                            children: [
                              const CustomSvgPicture(
                                assetName: AppIcon.calenderIcon,
                                color: AppColor.black,
                                height: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                DateTime.now().toCustomDateFormat(),
                                style: AppTypography.light.copyWith(
                                  color: AppColor.black,
                                  fontSize: AppTypographySize.body4,
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
              isOn: true,
            ),
            BlocBuilder<NutritionCubit, NutritionState>(
              builder: (context, state) {
                if (state is NutritionLoaded) {
                  return SizedBox(
                    height: 110,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.horizontal,
                      children: [
                        NutritionSquareWidget(
                          index: 0,
                          data: state.calory.toString(),
                          satuan: 'Kkal',
                        ),
                        const SizedBox(width: 10),
                        NutritionSquareWidget(
                            index: 1, data: state.protein.toString()),
                        const SizedBox(width: 10),
                        NutritionSquareWidget(
                            index: 2, data: state.fat.toString()),
                        const SizedBox(width: 10),
                        NutritionSquareWidget(
                            index: 3, data: state.carbohydrate.toString()),
                      ],
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            // SizedBox(
            //   height: 110,
            //   width: MediaQuery.of(context).size.width,
            //   child: ListView.separated(
            //     scrollDirection: Axis.horizontal,
            //     padding: const EdgeInsets.symmetric(horizontal: 20),
            //     itemBuilder: (context, index) {
            //       return NutritionSquareWidget(index: index);
            //     },
            //     separatorBuilder: (context, index) {
            //       return const SizedBox(width: 12);
            //     },
            //     itemCount: 4,
            //   ),
            // ),
            NavDetailWidget(
              title: AppID.consumingText,
              onPressed: () {
                context.pushNamed(
                  RouterPath.detailNutrition,
                );
              },
              isOn: false,
            ),
            BlocBuilder<NutritionCubit, NutritionState>(
              builder: (context, state) {
                if (state is NutritionLoaded) {
                  var data = state.nutritionModel;
                  return Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      itemBuilder: (context, index) {
                        return ConsumingWidget(
                          nutrition: data.nutritions[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 12);
                      },
                      itemCount: data.totalNutritions,
                    ),
                  );
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
