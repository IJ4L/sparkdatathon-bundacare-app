import 'package:bundacare/cubit/sign_In/sign_in_cubit.dart';
import 'package:bundacare/screens/profile/widgets/button_widget.dart';
import 'package:bundacare/screens/widgets/bar_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:bundacare/utils/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
                        AppID.callText,
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
                            AppID.nikText,
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
                      title: AppID.sickHistoryText,
                      icon: Icons.file_present_outlined,
                      onPressed: () {},
                    ),
                    IconButtonCostume(
                      title: AppID.faqsText,
                      icon: Icons.help_outline,
                      onPressed: () {},
                    ),
                    IconButtonCostume(
                      title: AppID.aboutText,
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
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        height: 170,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 3,
                              width: 40,
                              decoration: BoxDecoration(
                                color: AppColor.grey.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              AppID.logoutTitle,
                              style: AppTypography.regular.copyWith(
                                color: AppColor.black,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ButtonWidget(
                                    title: AppID.cancelText,
                                    isOutline: false,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  const SizedBox(width: 16),
                                  ButtonWidget(
                                    title: AppID.exitText,
                                    isOutline: false,
                                    onPressed: () {
                                      context.read<SignInCubit>().signOut();
                                      context.goNamed(RouterPath.login);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
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

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isOutline;

  const ButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isOutline,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        backgroundColor: isOutline ? AppColor.white : AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: isOutline ? AppColor.primary : AppColor.white,
            width: 1,
          ),
        ),
      ),
      child: Text(
        title,
        style: AppTypography.regular.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
