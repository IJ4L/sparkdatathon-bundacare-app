import 'package:bundacare/screens/widgets/picture_widget.dart';
import 'package:bundacare/screens/widgets/textfield_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:bundacare/utils/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _nikController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nikController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    _nikController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                const CustomPicture(
                  assetName: AppImages.loginImg,
                  width: double.infinity,
                  height: double.infinity,
                ),
                SafeArea(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomSvgPicture(
                          assetName: AppIcon.appIcon,
                          height: 42,
                          color: AppColor.white,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          AppID.appName,
                          style: AppTypography.regular.copyWith(
                            color: AppColor.white,
                            fontSize: AppTypographySize.body4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextfield(
                    icon: Icons.person_2_outlined,
                    hintText: AppID.nikTextfield,
                    controller: _nikController,
                  ),
                  CustomTextfield(
                    icon: Icons.password_outlined,
                    hintText: AppID.passwordTextfield,
                    controller: _passwordController,
                  ),
                  Container(
                    width: double.infinity,
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: TextButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   // Do something
                        // }
                        context.goNamed(RouterPath.home);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        AppID.loginButton,
                        style: AppTypography.semiBold.copyWith(
                          color: AppColor.white,
                          fontSize: AppTypographySize.body3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
