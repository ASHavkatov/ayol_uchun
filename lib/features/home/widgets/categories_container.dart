import 'package:ayol_uchun_exam/core/data/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/colors.dart';

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({super.key, required this.categories});

  final List<CategoriesModel> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h, left: 20.h, right: 20.h, bottom: 10.h),
      width: double.infinity,
      height: 407.h,
      color: AppColors.pinkSub.withValues(alpha: 0.3),
      child: Column(
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
          SizedBox(height: 16.h),
          SizedBox(
            height: 258.h,
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 15.w,
                childAspectRatio: 160 / 50,
              ),
              itemBuilder:
                  (context, index) => Container(
                    width: 160.w,
                    height: 50.h,
                    padding: EdgeInsets.only(left: 8.w, top: 5.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.mainColor.withValues(alpha: 0.5),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              categories[index].title,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "Jami ${categories[index].totalCourses}ta dars",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: 118,
                          child: Transform.rotate(
                            angle: -6.2,
                            child: Image.network(
                              categories[index].icon,
                              width: 50.w,
                              height: 50.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.only(left: 80.w, top: 4.h),
              width: 335.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: AppColors.pinkSub,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Text(
                    "KATEGORIYALAR",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 14.w),
                  SvgPicture.asset("assets/icons/arrow-right.svg"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
