import 'package:bundacare/cubit/other_cubit.dart';
import 'package:bundacare/screens/widgets/appbar_widget.dart';
import 'package:bundacare/screens/home/widgets/consuming_widget.dart';
import 'package:bundacare/screens/home/widgets/date_widget.dart';
import 'package:bundacare/screens/home/widgets/nutrition_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:bundacare/utils/formatter/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailNutritionPage extends StatefulWidget {
  const DetailNutritionPage({super.key});

  @override
  State<DetailNutritionPage> createState() => _DetailNutritionPageState();
}

class _DetailNutritionPageState extends State<DetailNutritionPage> {
  late ScrollController _scrollController;
  bool _isFirstBuild = true;

  @override
  void initState() {
    super.initState();
    context.read<DateCubit>().changeDate(DateTime.now().day);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var date = getAllDate();

    return Scaffold(
      appBar: appbarWidget(context, 'Riwayat', () {
        Navigator.pop(context);
      }),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: BlocBuilder<DateCubit, int>(
                  builder: (context, state) {
                    if (_isFirstBuild && state >= 0) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _scrollController.animateTo(
                          state * 65.0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                        );
                      });
                      _isFirstBuild = false;
                    }
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        return DateWidget(
                          date: date,
                          index: index,
                          state: state,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 12);
                      },
                      itemCount: date.length,
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppID.nutritionText,
                      style: AppTypography.medium.copyWith(
                        color: AppColor.black,
                        fontSize: AppTypographySize.body3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: NutritionBlocWidget(index: index),
                  );
                },
                childCount: 4,
              ),
            ),
            // SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: MediaQuery.of(context).size.height * 0.32,
            //     child: ListView.separated(
            //       physics: const NeverScrollableScrollPhysics(),
            //       itemBuilder: (context, index) {

            //       },
            //       separatorBuilder: (context, index) {
            //         return const SizedBox(height: 8);
            //       },
            //       itemCount: nutritionIcon.length,
            //     ),
            //   ),
            // ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: ConsumingWidget(index: index),
                  );
                },
                childCount: 10,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            )
          ],
        ),
      ),
    );
  }
}
