import 'package:flutter/material.dart';
import 'package:go_route_test/core/page_name.dart';
import 'package:go_route_test/presentation/navigation/main_page.dart';
import 'package:go_route_test/presentation/navigation/tab_root_page.dart';
import 'package:go_route_test/presentation/ui/details_page.dart';
import 'package:go_route_test/presentation/ui/home_page.dart';
import 'package:go_route_test/presentation/ui/auth_page.dart';
import 'package:go_route_test/presentation/ui/profile_page.dart';
import 'package:go_route_test/presentation/ui/splash_page.dart';
import 'package:go_route_test/presentation/ui/tab/tab_view_1.dart';
import 'package:go_route_test/presentation/ui/tab/tab_view_2.dart';
import 'package:go_route_test/presentation/ui/tab/tab_view_3.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellProfile');
final _shellNavigatorSettingKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellSetting');
final _shellNavigatorTabPageKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellTab');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: PagesName.splashPage.path,
  routes: [
    GoRoute(
      path: PagesName.splashPage.path,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainPage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          initialLocation: PagesName.homePage.path,
          routes: [
            GoRoute(
              path: PagesName.homePage.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomePage(),
              ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const DetailsPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfileKey,
          routes: [
            // Shopping Cart
            GoRoute(
                path: PagesName.profilePage.path,
                pageBuilder: (context, state) => const NoTransitionPage(
                      child: ProfilePage(),
                    ),
                redirect: (context, state) {
                  if (3 == 2) {
                    return PagesName.authPage.path;
                  }
                  return PagesName.profilePage.path;
                }),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorTabPageKey,
          routes: [
            StatefulShellRoute(
              builder: (BuildContext context, GoRouterState state,
                  StatefulNavigationShell navigationShell) {
                return navigationShell;
              },
              navigatorContainerBuilder: (BuildContext context,
                  StatefulNavigationShell navigationShell,
                  List<Widget> children) {
                return TabRootPage(
                    navigationShell: navigationShell, children: children);
              },
              branches: [
                StatefulShellBranch(routes: [
                  GoRoute(
                    path: TabPagesName.tabPageView1.path,
                    builder: (BuildContext context, GoRouterState state) =>
                        const TabViewOnePage(),
                  ),
                ]),
                StatefulShellBranch(routes: [
                  GoRoute(
                    path: TabPagesName.tabPageView2.path,
                    builder: (BuildContext context, GoRouterState state) =>
                        const TabViewTwoPage(),
                  ),
                ]),
                StatefulShellBranch(routes: [
                  GoRoute(
                    path: TabPagesName.tabPageView3.path,
                    builder: (BuildContext context, GoRouterState state) =>
                        const TabViewThreePage(),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ],
    ),
    StatefulShellRoute(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        return navigationShell;
      },
      navigatorContainerBuilder: (BuildContext context,
          StatefulNavigationShell navigationShell, List<Widget> children) {
        return TabRootPage(
            navigationShell: navigationShell, children: children);
      },
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: TabPagesName.tabPageView1.path,
            builder: (BuildContext context, GoRouterState state) =>
                const TabViewOnePage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: TabPagesName.tabPageView2.path,
            builder: (BuildContext context, GoRouterState state) =>
                const TabViewTwoPage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: TabPagesName.tabPageView3.path,
            builder: (BuildContext context, GoRouterState state) =>
                const TabViewThreePage(),
          ),
        ]),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/details',
      builder: (context, state) => const DetailsPage(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: PagesName.authPage.path,
      builder: (BuildContext context, GoRouterState state) {
        return const AuthPage();
      },
    ),
  ],
);
