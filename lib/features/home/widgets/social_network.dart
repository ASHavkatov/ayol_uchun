import 'package:ayol_uchun_exam/core/data/models/social_accounts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialNetwork extends StatelessWidget {
  const SocialNetwork({super.key, required this.social});

  final List<SocialAccountsModel> social;
  //
  // void _launchURL(String url) async {
  //   final uri = Uri.parse(url);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri, mode: LaunchMode.externalApplication); // Tashqi browserda ochadi
  //   } else {
  //     debugPrint('Could not launch $url');
  //   }
  // }

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
            color: Colors.grey.withValues(alpha:0.2),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: social.map(
                  (item) => GestureDetector(
                onTap: () {},
                child: SvgPicture.network(
                  item.icon,
                  width: 32.w,
                  height: 32.h,
                ),
              ),
            ).toList(),
          ),
        ],
      ),
    );
  }
}
