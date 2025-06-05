import 'package:ayol_uchun_exam/core/utils/colors.dart';
import 'package:ayol_uchun_exam/features/authentication/login/widgets/login_container.dart';
import 'package:ayol_uchun_exam/features/authentication/login/widgets/login_main_text.dart';
import 'package:ayol_uchun_exam/features/authentication/widgets/show_diolog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/routing/routes.dart';

class SignCodeView extends StatefulWidget {
  const SignCodeView({super.key});

  @override
  State<SignCodeView> createState() => _SignCodeViewState();
}

class _SignCodeViewState extends State<SignCodeView> {
  final pinTheme = PinTheme(
    width: 60,
    height: 60,
    textStyle: TextStyle(fontSize: 20, color: Colors.black),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey.shade400),
    ),
  );
  final String correctCode = "123456";
  final formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/background.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(top: 150.h, left: 20, right: 20),
          child: Column(
            children: [
              LoginMainText(
                text:
                    "O‘quv platformasiga kirish uchun quyida telefon raqamingizga yuborilgan tasdiqlash kodini kiriting",
                title: "Tasdiqlash kodi",
              ),
              SizedBox(height: 20),
              Form(
                key: formKey,
                child: Pinput(
                  controller: controller,
                  length: 6,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kodni kiriting';
                    }
                    if (!RegExp(r'^\d+$').hasMatch(value)) {
                      return 'Faqat raqam kiriting';
                    }
                    if (value != correctCode) {
                      return 'Kod noto‘g‘ri';
                    }
                    return null;
                  },
                  defaultPinTheme: pinTheme,
                  focusedPinTheme: pinTheme.copyWith(
                    decoration: pinTheme.decoration!.copyWith(
                      border: Border.all(color: Colors.blue),
                    ),
                  ),
                  submittedPinTheme: pinTheme.copyWith(
                    decoration: pinTheme.decoration!.copyWith(),
                  ),
                ),
              ),
              SizedBox(height: 400.h),
              LoginContainer(
                color: AppColors.mainColor,
                text: "Kirish",
                callback: () {
                  if (formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder:
                          (context) => Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ShowDiologContainer(
                              callback: () {
                                context.go(Routes.password);
                              },
                            ),
                          ),
                    );
                  } else {
                    SnackBar(
                      content: Text("Kod xato kiritildi"),
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 2),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
