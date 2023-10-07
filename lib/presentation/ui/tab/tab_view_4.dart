import 'package:flutter/material.dart';
import 'package:go_route_test/core/page_name.dart';
import 'package:go_router/go_router.dart';

class TabViewFourPage extends StatelessWidget {
  const TabViewFourPage({super.key,});

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
         children: [
           ListView.builder(
             controller: controller,
               shrinkWrap: true,
               physics: const ScrollPhysics(),
               itemCount: 41,
               itemBuilder: (context, index) {
               if(index == 40){
                 return Container(
                   width: double.maxFinite,
                   height: 400,
                   color: Colors.blueAccent,
                 );
               }
                 return Text("data -> $index");
               }),
         ]
        ),
      ),
    );
  }
}
