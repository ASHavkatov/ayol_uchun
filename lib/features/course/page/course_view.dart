import 'package:ayol_uchun_exam/core/utils/colors.dart';
import 'package:ayol_uchun_exam/features/authentication/login/widgets/login_container.dart';
import 'package:ayol_uchun_exam/features/course/blocs/course_bloc.dart';
import 'package:ayol_uchun_exam/features/course/blocs/course_state.dart';
import 'package:ayol_uchun_exam/features/course/widgets/detail_widget.dart';
import 'package:ayol_uchun_exam/features/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../home/widgets/custom_app_bar.dart';
import '../widgets/show_dialog_container.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        name: "Kurslar 📚",
        icon: 'assets/icons/filter.svg',
        callback: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            isScrollControlled: true,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  int selectedIndex = -1;

                  final items = [
                    {"text": "Barchasi", "image": "assets/images/bulut1.png"},
                    {
                      "text": "Psixologiya",
                      "image": "assets/images/bulut2.png",
                    },
                    {
                      "text": "Qandolatchilik",
                      "image": "assets/images/bulut3.png",
                    },
                    {
                      "text": "Dizayn asoslari",
                      "image": "assets/images/bulut4.png",
                    },
                    {
                      "text": "SMM va marketing",
                      "image": "assets/images/bulut5.png",
                    },
                  ];

                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: 16,
                      top: 16.h,
                      left: 16.w,
                      right: 16.w,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(items.length, (index) {
                            final item = items[index];
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: ShowDialogContainer(
                                text: item["text"]!,
                                image: item["image"]!,
                                isSelected: selectedIndex == index,
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                              ),
                            );
                          }),
                          SizedBox(height: 16.h),
                          LoginContainer(
                            color: AppColors.mainColor,
                            text: "Qo'llash",
                            callback: () {
                              // Tanlangan indexni qaytarish yoki ishlatish mumkin:
                              Navigator.pop(context, selectedIndex);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          return switch (state.status) {
            CourseStatus.error => Center(child: Text("Xatolik bor")),
            CourseStatus.loading => Center(child: CircularProgressIndicator()),
            CourseStatus.idle => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailWidget(course: state.course!, social: state.social!),
                  ],
                ),
              ),
            ),
          };
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
