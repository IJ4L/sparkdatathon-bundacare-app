import 'package:bundacare/screens/profile/widgets/button_widget.dart';
import 'package:bundacare/screens/widgets/bar_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomeBar(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
                top: 10,
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mr/Ms, ",
                        style: AppTypography.light.copyWith(
                          fontSize: AppTypographySize.caption,
                          color: AppColor.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Huznasaumal",
                        style: AppTypography.semiBold.copyWith(
                          fontSize: AppTypographySize.body2,
                          color: AppColor.black,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            "Nik ",
                            style: AppTypography.light.copyWith(
                              fontSize: AppTypographySize.body4,
                              color: AppColor.primary,
                            ),
                          ),
                          Text(
                            "83218376213236167",
                            style: AppTypography.light.copyWith(
                              fontSize: AppTypographySize.body4,
                              color: AppColor.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Wrap(
                  children: [
                    IconButtonCostume(
                      title: 'Riwayat penyakit',
                      icon: Icons.file_present_outlined,
                      onPressed: () {},
                    ),
                    IconButtonCostume(
                      title: 'FAQs',
                      icon: Icons.help_outline,
                      onPressed: () {},
                    ),
                    IconButtonCostume(
                      title: 'Tentang Kami',
                      icon: Icons.info_outline,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Logout",
                  style: AppTypography.regular.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
