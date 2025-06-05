import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ShowDialogContainer extends StatelessWidget {
  const ShowDialogContainer({
    super.key,
    required this.text,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            width: double.infinity,
            height: 52.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? Colors.green : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                if (isSelected)
                  SvgPicture.asset(
                    "assets/icons/red-true.svg",
                    width: 20.w,
                    height: 20.h,
                  ),
                if (isSelected) SizedBox(width: 10.w),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              image,
              width: 50.w,
              height: 50.h,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}