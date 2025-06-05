import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class ShowDiologContainer extends StatelessWidget {
  const ShowDiologContainer({super.key, required this.callback});
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 265.h,
      padding: EdgeInsets.only(
        top: 24.h,
        left: 20.w,
        right: 20.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/verification.svg",
            width: 60.w,
            height: 60.h,
          ),
          SizedBox(height: 20.h),
          Text(
            "Muvaffaqiyatli tasdiqlandi",
            style: TextStyle(
              color: Colors.black.withValues(alpha:0.7),
              fontSize: 20.sp,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "Telefon raqamingiz muvaffaqiyatli tasdiqlandi",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              decoration: TextDecoration.none,

              color: Colors.black.withValues(alpha:0.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 24.h),
          GestureDetector(
            onTap: callback,
            child: Container(
              width: 295.w,
              height: 44.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.containerColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                "Tushunarli",
                style: TextStyle(
                  decoration: TextDecoration.none,

                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
