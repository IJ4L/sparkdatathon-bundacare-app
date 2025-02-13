import 'package:bundacare/screens/widgets/navigation_widget.dart';
import 'package:bundacare/screens/widgets/picture_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final int selected = navigationShell.currentIndex;
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        elevation: 12,
        height: 62,
        selectedIndex: navigationShell.currentIndex,
        backgroundColor: AppColor.white,
        indicatorColor: AppColor.transparent,
        surfaceTintColor: AppColor.transparent,
        shadowColor: AppColor.grey,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: [
          NavigationDestinantionCostume(
            selected: selected,
            onPressed: () => _goBranch(0),
            title: AppID.homeButton,
            icon: AppIcon.homeIcon,
            index: 0,
          ),
          NavigationDestinantionCostume(
            selected: selected,
            onPressed: () => _goBranch(1),
            title: AppID.chatButton,
            icon: AppIcon.chatIcon,
            index: 1,
          ),
          const SizedBox(),
          NavigationDestinantionCostume(
            selected: selected,
            onPressed: () => _goBranch(3),
            title: AppID.bookButton,
            icon: AppIcon.bookIcon,
            index: 3,
          ),
          NavigationDestinantionCostume(
            selected: selected,
            onPressed: () => _goBranch(4),
            title: AppID.profileButton,
            icon: AppIcon.profileIcon,
            index: 4,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 30),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 44,
                width: 44,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: IconButton(
                  icon: const CustomSvgPicture(
                    assetName: AppIcon.scanIcon,
                    width: 20,
                    height: 20,
                    color: AppColor.white,
                  ),
                  onPressed: () => {_goBranch(2)},
                ),
              ),
              Text(
                AppID.scanButton,
                style: AppTypography.regular.copyWith(
                  color: selected == 2 ? AppColor.primary : AppColor.grey,
                ),
              ),
              const SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }
}
