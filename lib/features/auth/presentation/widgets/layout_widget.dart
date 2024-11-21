import 'package:flutter/material.dart';
import 'package:homei/core/utils/app_images.dart';

class Layout extends StatelessWidget {
  const Layout({super.key,required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(alignment: Alignment.topLeft,child: Image.asset(AppImages.top, width: MediaQuery.of(context).size.width / 1.3)),
                      const Spacer(),
                      Align(alignment: Alignment.bottomRight,child: Image.asset(AppImages.bottom, width: MediaQuery.of(context).size.width / 2)),
                    ],
                  ),
                ),
                widget
              ],
            ),
          ),
        ),
    );
  }
}
