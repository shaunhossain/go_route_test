import 'package:flutter/material.dart';
import 'package:go_route_test/core/page_name.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PagesName.homePage.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(PagesName.homePage.title),
            ElevatedButton(
                onPressed: () => context.go("${PagesName.homePage.path}/${PagesName.detailsPage.path}"),
                child: const Text("go to details")),
          ],
        ),
      ),
    );
  }
}
