import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialNetwork extends StatelessWidget {
  const SocialNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: double.infinity,
      height: 115.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 0.1,
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ijtimoiy tarmoqlarimiz:",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/icons/instagram.svg", width: 32.w, height: 32.h),
              SvgPicture.asset("assets/icons/tik_tok.svg", width: 32.w, height: 32.h),
              SvgPicture.asset("assets/icons/youtube.svg", width: 32.w, height: 32.h),
              SvgPicture.asset("assets/icons/telegram.svg", width: 32.w, height: 32.h),
              SvgPicture.asset("assets/icons/fakebook.svg", width: 32.w, height: 32.h),
            ],
          ),
        ],
      ),
    );
  }
}
