import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class Advertisement extends StatelessWidget {
  const Advertisement({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          fit: BoxFit.cover,
          "assets/icons/background-image.png",
          width: double.infinity,
          height: 267.h,
        ),
        Positioned(
          top: 16.h,
          left: 26.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.h,
                width: 253.h,
                child: Text(
                  "👋🏻 Hey, Siz ham ayollar uchun foydali videolar tayyorlay olasizmi?Unda jamoamizga qo‘shiling!",
                  softWrap: true,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                width: 110.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "Qo'shilish",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 10,
            right: 18,
            child: Image.asset("assets/icons/xola2.png", fit: BoxFit.cover,))
      ],
    );
  }
}