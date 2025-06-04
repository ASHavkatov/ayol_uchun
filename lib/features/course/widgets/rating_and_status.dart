import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class RatingAndStatus extends StatelessWidget {
  const RatingAndStatus({super.key, required this.rating, required this.category, required this.status});
  final String rating, category, status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 129.w,
          height: 24.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
            BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/star.svg",
                width: 12.w,
                height: 12.h,
              ),
              Text(
                "${rating}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                category,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 99.w,
          height: 24,
          decoration: BoxDecoration(
            color:
            status == "Recommended"
                ? AppColors.statusColor
                : (status == null
                ? Colors.red
                : AppColors.bestSeller),
            borderRadius:
            BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              status
                  .toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
