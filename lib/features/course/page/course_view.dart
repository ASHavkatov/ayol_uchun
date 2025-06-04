import 'package:ayol_uchun_exam/core/utils/colors.dart';
import 'package:ayol_uchun_exam/features/course/blocs/course_bloc.dart';
import 'package:ayol_uchun_exam/features/course/blocs/course_state.dart';
import 'package:ayol_uchun_exam/features/course/widgets/detail_widget.dart';
import 'package:ayol_uchun_exam/features/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../home/widgets/custom_app_bar.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        name: "Kurslar 📚",
        icon: 'assets/icons/filter.svg',
        callback: () {},
      ),
      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          return switch (state.status) {
            CourseStatus.error => Center(child: Text("Xatolik bor")),
            CourseStatus.loading => Center(child: CircularProgressIndicator()),
            CourseStatus.idle => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: DetailWidget(course: state.course!),
            ),
          };
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
