import 'package:flutter/material.dart';
import 'package:go_route_test/core/page_name.dart';
import 'package:go_router/go_router.dart';

class TabViewOnePage extends StatelessWidget {
  const TabViewOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TabPagesName.tabPageView1.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(TabPagesName.tabPageView1.title),
            ElevatedButton(
                onPressed: () => context.push("/${PagesName.detailsPage.path}"),
                child: const Text("go to details")),
          ],
        ),
      ),
    );
  }
}