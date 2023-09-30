import 'package:flutter/material.dart';
import 'package:go_route_test/core/page_name.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      context.go(PagesName.homePage.path);
      //context.go(TabPagesName.tabPageView1.path);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PagesName.splashPage.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(PagesName.splashPage.title),
          ],
        ),
      ),
    );
  }
}
