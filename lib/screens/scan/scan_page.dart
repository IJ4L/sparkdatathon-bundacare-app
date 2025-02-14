import 'dart:io';

import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key, required this.image});

  final XFile image;

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
                File(image.path),
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
                            'Mengkalkulasi Protein',
                            style: AppTypography.semiBold.copyWith(
                              color: AppColor.black,
                              fontSize: AppTypographySize.body4,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '87%',
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
                LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: AppColor.grey.withValues(alpha: 0.3),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColor.primary,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
