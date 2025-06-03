import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_navigation_bar_widget.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:12.h ),
      width: double.infinity,
      height: 90.h,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomNavigationBarWidget(svg: "assets/icons/home.svg", title: "Asosiy", callback: (){}),
            CustomNavigationBarWidget(svg: "assets/icons/course.svg", title: "Kurslar", callback: (){}),
            CustomNavigationBarWidget(svg: "assets/icons/blog.svg", title: "Blog", callback: (){}),
            CustomNavigationBarWidget(svg: "assets/icons/profile.svg", title: "Kabinet", callback: (){}),
          ]),
    );
  }
}
