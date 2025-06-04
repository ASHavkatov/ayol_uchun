import 'package:ayol_uchun_exam/core/data/models/courses_model.dart';
import 'package:ayol_uchun_exam/features/course/widgets/bio_widget.dart';
import 'package:ayol_uchun_exam/features/course/widgets/rating_and_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({super.key, required this.course});

  final List<CoursesModel> course;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Kurslar ",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Text(
              " (${course.first.category})",
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        ),

        SizedBox(height: 16.h),
        Expanded(
          child: GridView.builder(
            itemCount: course.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 12.h,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 294.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Stack(
                        children: [
                          Image.network(
                            course[index].image,
                            width: double.infinity,
                            height: 164.h,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 8,
                            left: 8,
                            right: 8,
                            child: RatingAndStatus(
                              rating: course[index].rating.toString(),
                              category: course[index].category,
                              status: course[index].status.toString(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    BioWidget(
                      title: course[index].title,
                      user: course[index].user,
                      price: course[index].price.toString(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
