import 'package:bundacare/screens/app_layout.dart';
import 'package:bundacare/screens/chat_page.dart';
import 'package:bundacare/screens/detail_consuming_page.dart';
import 'package:bundacare/screens/detail_nutrition_page.dart';
import 'package:bundacare/screens/education_page.dart';
import 'package:bundacare/screens/home_page.dart';
import 'package:bundacare/screens/login_page.dart';
import 'package:bundacare/screens/profile_page.dart';
import 'package:bundacare/screens/scan_page.dart';
import 'package:bundacare/screens/splash_page.dart';
import 'package:bundacare/utils/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellE');
final _shellNavigatorEKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');

final GoRouter router = GoRouter(
  initialLocation: RouterPath.splash,
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: RouterPath.splash,
      name: RouterPath.splash,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: RouterPath.login,
      name: RouterPath.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppLayout(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            GoRoute(
              path: RouterPath.home,
              name: RouterPath.home,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: HomePage());
              },
              routes: [
                GoRoute(
                  path: RouterPath.detailNutrition,
                  name: RouterPath.detailNutrition,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(
                      child: DetailNutritionPage(),
                    );
                  },
                ),
                GoRoute(
                  path: RouterPath.detailConsuming,
                  name: RouterPath.detailConsuming,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(
                      child: DetailConsumingPage(),
                    );
                  },
                ),
              ],
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            GoRoute(
              path: RouterPath.chat,
              name: RouterPath.chat,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ChatPage());
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCKey,
          routes: [
            GoRoute(
              path: RouterPath.scan,
              name: RouterPath.scan,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ScanPage());
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDKey,
          routes: [
            GoRoute(
              path: RouterPath.education,
              name: RouterPath.education,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: EducationPage());
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorEKey,
          routes: [
            GoRoute(
              path: RouterPath.profile,
              name: RouterPath.profile,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ProfilePage());
              },
            ),
          ],
        )
      ],
    ),
  ],
);
