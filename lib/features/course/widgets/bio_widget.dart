import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class BioWidget extends StatelessWidget {
  const BioWidget({super.key, required this.title, required this.user, required this.price});
final String title, user, price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 5.h,
      ),
      child: Column(
        children: [
          SizedBox(
            width: 311.w,
            child: Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/profile2.svg",
                width: 18.w,
                height: 18.h,
              ),
              Text(
                user,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/cash.svg",
                width: 22.w,
                height: 22.h,
              ),
              Text(
                "${price} UZS",
                style: TextStyle(
                  color: AppColors.darkContainer,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 163.w),
              Container(
                width: 28.w,
                height: 28.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    14,
                  ),
                  color: AppColors.pinkSub,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/arrow-right.svg",
                    colorFilter: ColorFilter.mode(
                      AppColors.mainColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
