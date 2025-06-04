import 'package:ayol_uchun_exam/core/data/models/interview_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class Interviews extends StatelessWidget {
   const Interviews({super.key, required this.interviews});
  final List<InterviewModel> interviews ;
   String formatDuration(int totalMinutes) {
     final hours = totalMinutes ~/ 60;
     final minutes = totalMinutes % 60;

     return '${hours} soat, ${minutes} daqiqa';
   }


   @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "KATEGORIYALAR",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 20.w,
            children: List.generate(interviews.length, (index) {
              return Stack(
                children: [
                  Container(
                    width: 228.w,
                    height: 251,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.5),
                          spreadRadius: 0.1,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.network(
                        interviews[index].image,
                        width: 228.w,
                        height: 140.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12.w,
                    bottom: 16.h,
                    child: Column(
                      spacing: 7.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/clock.svg",
                              width: 12,
                              height: 12,
                            ),
                            SizedBox(width: 1.w),
                            Text(
                              formatDuration(interviews[index].duration),
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                          width: 200.w,
                          child: Text(
                            interviews[index].title,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/profile2.svg",
                              width: 12,
                              height: 12,
                            ),
                            SizedBox(width: 1.w),
                            Text(
                              interviews[index].user,
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
        GestureDetector(
          onTap: (){},
          child: SizedBox(
            width: 173.w,
            height: 21.h,
            child: Row(
              children: [
                Text(
                  "Barcha intervyular",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 7.h),
                SvgPicture.asset(
                  "assets/icons/arrow-right.svg",
                  width: 20.w,
                  height: 20.h,
                  colorFilter: ColorFilter.mode(
                    AppColors.textColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}