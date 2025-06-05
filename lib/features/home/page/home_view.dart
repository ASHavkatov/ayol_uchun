import 'package:ayol_uchun_exam/core/data/models/courses_model.dart';
import 'package:ayol_uchun_exam/core/routing/routes.dart';
import 'package:ayol_uchun_exam/core/utils/colors.dart';
import 'package:ayol_uchun_exam/features/home/blocs/home_bloc.dart';
import 'package:ayol_uchun_exam/features/home/blocs/home_state.dart';
import 'package:ayol_uchun_exam/features/home/widgets/categories_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../widgets/advertisement.dart';
import '../widgets/course_container.dart';
import '../widgets/course_empty_container.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/interviews.dart';
import '../widgets/social_network.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return switch (state.status) {
          HomeStatus.error => Center(child: Text("Xatolik bor")),
          HomeStatus.loading => Center(child: CircularProgressIndicator()),
          HomeStatus.idle => Scaffold(
            appBar: CustomAppBar(
              name: state.user?.firstName ?? "Foydalanuvchi",
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
                        child:
                            (state.courses == null || state.courses!.isEmpty)
                                ? CourseContainer(
                                  callback: () {
                                    context.go(Routes.course);
                                  },
                                )
                                : CoursesEmptyContainer(model: state.courses!),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),
                  CategoriesContainer(categories: state.category!),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      children: [
                        SocialNetwork(social: state.social!),
                        SizedBox(height: 28.h),
                        Interviews(interviews: state.interview!),
                        SizedBox(height: 28.h),
                        Advertisement(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(),
          ),
        };
      },
    );
  }
}


