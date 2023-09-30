import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_route_test/core/page_name.dart';
import 'package:go_router/go_router.dart';

class TabRootPage extends StatefulWidget {
  const TabRootPage(
      {required this.navigationShell, required this.children, super.key});

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  @override
  State<StatefulWidget> createState() => _TabRootPageState();
}

class _TabRootPageState extends State<TabRootPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
      length: widget.children.length,
      vsync: this,
      initialIndex: widget.navigationShell.currentIndex);

  @override
  void didUpdateWidget(covariant TabRootPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tabController.index = widget.navigationShell.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    final List<Tab> tabs = widget.children
        .mapIndexed((int i, _) => Tab(text: TabPagesName.values[i].title))
        .toList();

    return Scaffold(
      appBar: AppBar(
          title: const Text('TabView'),
          bottom: TabBar(
            controller: _tabController,
            tabs: tabs,
            onTap: (int tappedIndex) => _onTabTap(context, tappedIndex),
          )),
      body: TabBarView(
        controller: _tabController,
        children: widget.children,
      ),
    );
  }

  void _onTabTap(BuildContext context, int index) {
    widget.navigationShell.goBranch(index);
  }
}
