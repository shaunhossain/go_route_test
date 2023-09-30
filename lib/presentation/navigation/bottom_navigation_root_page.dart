import 'package:flutter/material.dart';
import 'package:go_route_test/presentation/ui/main_page.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationRootPage extends StatelessWidget {
  const BottomNavigationRootPage({
    Key? key,
    required this.navigationShell,
  }) : super(
      key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainPage(
      body: navigationShell,
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: _goBranch,
    );
  }
}