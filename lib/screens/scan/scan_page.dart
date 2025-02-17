import 'dart:io';
import 'dart:async';

import 'package:bundacare/cubit/predict/predict_cubit.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:bundacare/utils/router/router_path.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key, required this.image});

  final XFile image;

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  double _progress = 0.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    var file = File(widget.image.path);
    context.read<PredictCubit>().predict(file);

    _startLoading();
  }

  void _startLoading() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        if (_progress < 1.0) {
          _progress += 0.05;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppID.waitText,
              style: AppTypography.light.copyWith(
                color: AppColor.black,
                fontSize: AppTypographySize.body4,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              AppID.processText,
              style: AppTypography.semiBold.copyWith(
                color: AppColor.black,
                fontSize: AppTypographySize.body2,
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.file(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.45,
                fit: BoxFit.cover,
                File(widget.image.path),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColor.primary.withValues(alpha: 0.3),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            AppID.progressIDText,
                            style: AppTypography.light.copyWith(
                              color: AppColor.black,
                              fontSize: AppTypographySize.caption,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            AppID.progressText,
                            style: AppTypography.light.copyWith(
                              color: AppColor.black,
                              fontSize: AppTypographySize.caption,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'Mengkalkulasi',
                            style: AppTypography.semiBold.copyWith(
                              color: AppColor.black,
                              fontSize: AppTypographySize.body4,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${(_progress * 100).toStringAsFixed(0)}%',
                            style: AppTypography.semiBold.copyWith(
                              color: AppColor.black,
                              fontSize: AppTypographySize.body4,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                BlocConsumer<PredictCubit, PredictState>(
                  listener: (context, state) {
                    if (state is PredictSuccess) {
                      context.goNamed(
                        RouterPath.resultPredict,
                        extra: {
                          'predict': state.predictModel,
                        },
                      );
                    }
                  },
                  builder: (context, state) {
                    return LinearProgressIndicator(
                      value: _progress,
                      backgroundColor: AppColor.grey.withValues(alpha: 0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColor.primary,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
