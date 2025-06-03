import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class CustomNavigationBarWidget extends StatelessWidget {
  const CustomNavigationBarWidget({
    super.key,
    required this.svg,
    required this.title,
    required this.callback,
  });

  final String svg, title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: callback,
          child: SvgPicture.asset(svg, width: 24, height: 24),
        ),
        Text(
          title,
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
