import 'package:flutter/material.dart';
import 'package:go_route_test/core/page_name.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PagesName.authPage.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(PagesName.authPage.title),
            ElevatedButton(
                onPressed: () => context.go(PagesName.homePage.path),
                child: const Text("go to details"))
          ],
        ),
      ),
    );
  }
}