import 'package:bundacare/screens/widgets/picture_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:bundacare/utils/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      context.goNamed(RouterPath.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 65),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomSvgPicture(
                      assetName: AppIcon.appIcon,
                      height: 152,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      AppID.appName,
                      style: AppTypography.regular.copyWith(
                        color: AppColor.primary,
                        fontSize: AppTypographySize.body1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              AppID.from,
              style: AppTypography.light.copyWith(
                color: AppColor.grey,
                fontSize: AppTypographySize.body4,
              ),
            ),
            Text(
              AppID.teamName,
              style: AppTypography.regular.copyWith(
                color: AppColor.primary,
                fontSize: AppTypographySize.body4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
