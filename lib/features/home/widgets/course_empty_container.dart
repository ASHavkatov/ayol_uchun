import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/data/models/courses_model.dart';
import '../../../core/utils/colors.dart';

class CoursesEmptyContainer extends StatelessWidget {
  const CoursesEmptyContainer({super.key, required this.model});

  final List<CoursesModel> model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 20.w,
        children: List.generate(model.length, (index) {
          return Stack(
            children: [
              Container(
                width: 277.w,
                height: 281.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      model[index].image,
                      width: 277.w,
                      height: 174.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/star.svg",
                              width: 15.w,
                              height: 15.h,
                            ),
                            Text(
                              model[index].rating.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        SizedBox(
                          width: 261.w,
                          height: 44.h,
                          child: Text(
                            model[index].title,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/profile2.svg",
                              width: 18.w,
                              height: 18.h,
                            ),
                            Text(
                              model[index].user,
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 74.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color:
                        model[index].status == "Recommended"
                            ? AppColors.statusColor
                            : (model[index].status == null
                                ? Colors.red
                                : AppColors.bestSeller),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      model[index].status.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
