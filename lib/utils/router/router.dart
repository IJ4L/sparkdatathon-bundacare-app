import 'package:bundacare/screens/app_layout.dart';
import 'package:bundacare/screens/scan/camera_preview.dart';
import 'package:bundacare/screens/chat/chat_page.dart';
import 'package:bundacare/screens/home/detail_consuming_page.dart';
import 'package:bundacare/screens/education/detail_education.dart';
import 'package:bundacare/screens/home/detail_nutrition_page.dart';
import 'package:bundacare/screens/education/education_page.dart';
import 'package:bundacare/screens/home/home_page.dart';
import 'package:bundacare/screens/signin/login_page.dart';
import 'package:bundacare/screens/profile/profile_page.dart';
import 'package:bundacare/screens/scan/scan_page.dart';
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
                var args = state.extra as Map<String, dynamic>;
                return NoTransitionPage(
                  child: ScanPage(image: args['image']),
                );
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
              routes: [
                GoRoute(
                  path: RouterPath.detailEducation,
                  name: RouterPath.detailEducation,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: DetailEducation());
                  },
                ),
              ],
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
    GoRoute(
      path: RouterPath.cameraPreview,
      name: RouterPath.cameraPreview,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: CameraPreviewPage());
      },
    ),
  ],
);
