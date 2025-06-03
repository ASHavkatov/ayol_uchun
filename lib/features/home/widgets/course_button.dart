import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class CourseButton extends StatelessWidget {
  const CourseButton({super.key, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 20.w),
        width: 150.w,
        height: 34.h,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          textAlign: TextAlign.center,
          "Kurs sotib olish",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}