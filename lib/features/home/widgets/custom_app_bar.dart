import 'package:ayol_uchun_exam/features/home/widgets/soft_curve.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String name;
  final String icon;
  final VoidCallback callback;

  CustomAppBar({Key? key, required this.name, required this.icon, required this.callback})
      : preferredSize = Size.fromHeight(100),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SoftCurveClipper(),
      child: Container(
        color: AppColors.mainColor,
        height: preferredSize.height,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 16,
          right: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${name}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(onTap: callback,child: SvgPicture.asset(icon, width: 28,height: 28,)),
          ],
        ),
      ),
    );
  }
}