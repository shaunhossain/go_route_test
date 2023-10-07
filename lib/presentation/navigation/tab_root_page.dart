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
    final List<MaterialButton> tab1 = widget.children
        .mapIndexed((int i, _) => MaterialButton(
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () {
                _onTabTap(context, i);
              },
              child: Text(TabPagesName.values[i].title),
            ))
        .toList();

    // final list2 = list1Copy.sublist(0, list1Copy.length ~/ 2);
    // final list3 = list1Copy.sublist(list1Copy.length ~/ 2);

    final List<MaterialButton> tab2 = widget.children
        .sublist(widget.children.length ~/ 2)
        .mapIndexed((int i, _) => MaterialButton(
              height: 10,
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () {
                _onTabTap(context, i + 2);
              },
              child: FittedBox(child: Text(TabPagesName.values[i].title,style: const TextStyle(fontSize: 8),)),
            ))
        .toList();

    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(
                  child:    Container(
                    width: double.maxFinite,
                    height: 400,
                    color: Colors.pink,
                  ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  width: double.maxFinite,
                  height: 120,
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    childAspectRatio: 3.5,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    padding: const EdgeInsets.all(8.0), // padding around the grid
                    children: tab1.map((item) {
                      return item;
                    }).toList(),
                  ),
                ),
              ),
            ];
          },
          body: CustomScrollView(
            slivers:  [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 600,
                    child: TabBarView(
                      physics: const ScrollPhysics(),
                      controller: _tabController,
                      children: widget.children,
                    ),
                  ),
                ),
              SliverToBoxAdapter(
                  child: Container(
                    width: double.maxFinite,
                    height: 400,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  void _onTabTap(BuildContext context, int index) {
    widget.navigationShell.goBranch(index);
  }
}
