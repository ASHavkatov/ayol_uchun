import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/advertisement.dart';
import '../widgets/categories_container.dart';
import '../widgets/course_container.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/interviews.dart';
import '../widgets/social_network.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        name: 'Mohi',
        icon: 'assets/icons/notification.svg',
        callback: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 24.h,
                    horizontal: 20.w,
                  ),
                  child: CourseContainer(callback: () {}),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            CategoriesContainer(callback: () {}),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  SocialNetwork(),
                  SizedBox(height: 28.h),
                  Interviews(),
                  SizedBox(height: 28.h),
                  Advertisement(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}


