import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'course_button.dart';

class CourseContainer extends StatelessWidget {
  const CourseContainer({super.key, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
      width: 335.w,
      height: 210.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          SvgPicture.asset("assets/icons/ayol.svg", width: 48.w, height: 57.h),
          SizedBox(height: 16.h),
          Text(
            "Sizda hali boshlangan kurs mavjud emas. Ko‘plab foydali kurslarimiz orasidan bittasini tanlang.",
            softWrap: true,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 14.h),
          CourseButton(callback: callback),
        ],
      ),
    );
  }
}