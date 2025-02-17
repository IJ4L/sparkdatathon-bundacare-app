import 'package:bundacare/cubit/nutrition/nutrition_cubit.dart';
import 'package:bundacare/cubit/store_food/storefood_cubit.dart';
import 'package:bundacare/data/models/predict_model.dart';
import 'package:bundacare/screens/home/widgets/nutrition_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:bundacare/utils/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResultPredictPage extends StatefulWidget {
  const ResultPredictPage({
    super.key,
    required this.predict,
  });

  final PredictModel predict;

  @override
  State<ResultPredictPage> createState() => _ResultPredictPageState();
}

class _ResultPredictPageState extends State<ResultPredictPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.predict.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan Nama Makanan',
                  labelStyle: AppTypography.regular.copyWith(
                    color: AppColor.primary,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.primary,
                    ),
                  ),
                ),
                onChanged: (value) {},
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  NutritionDetailSquareWidget(
                    index: 0,
                    data: widget.predict.data.kalori.toString(),
                  ),
                  const SizedBox(width: 10.0),
                  NutritionDetailSquareWidget(
                    index: 1,
                    data: widget.predict.data.protein.toString(),
                  ),
                  const SizedBox(width: 10.0),
                  NutritionDetailSquareWidget(
                    index: 2,
                    data: widget.predict.data.karbo.toString(),
                  ),
                  const SizedBox(width: 10.0),
                  NutritionDetailSquareWidget(
                    index: 3,
                    data: widget.predict.data.lemak.toString(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            BlocListener<StorefoodCubit, StorefoodState>(
              listener: (context, state) {
                if (state is StorefoodLoaded) {
                  context.goNamed(RouterPath.home);
                }
                if (state is StorefoodError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(
                  onPressed: () {
                    context
                        .read<StorefoodCubit>()
                        .storeFood(_controller.text, widget.predict);

                    context.read<NutritionCubit>().getNutrition();
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Simpan',
                    style: AppTypography.regular.copyWith(
                      fontSize: AppTypographySize.body4,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                onPressed: () {
                  context.goNamed(RouterPath.home);
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: AppColor.primary,
                    ),
                  ),
                ),
                child: Text(
                  'Batal',
                  style: AppTypography.regular.copyWith(
                    fontSize: AppTypographySize.body4,
                    color: AppColor.primary,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
