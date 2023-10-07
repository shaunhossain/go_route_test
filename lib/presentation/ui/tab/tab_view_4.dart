import 'package:flutter/material.dart';
import 'package:go_route_test/core/page_name.dart';
import 'package:go_router/go_router.dart';

class TabViewFourPage extends StatelessWidget {
  const TabViewFourPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: false,
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 40,
                itemBuilder: (context, index) {
                  return Text("data -> $index");
                }),
          ),
        ],
      ),
    );
  }
}
