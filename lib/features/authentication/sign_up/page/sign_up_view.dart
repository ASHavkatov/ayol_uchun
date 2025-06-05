import 'package:ayol_uchun_exam/core/routing/routes.dart';
import 'package:ayol_uchun_exam/features/authentication/login/widgets/login_main_text.dart';
import 'package:ayol_uchun_exam/features/authentication/login/widgets/login_text_form_field.dart';
import 'package:ayol_uchun_exam/features/authentication/sign_up/blocs/signup_bloc.dart';
import 'package:ayol_uchun_exam/features/authentication/sign_up/blocs/signup_event.dart';
import 'package:ayol_uchun_exam/features/authentication/sign_up/blocs/signup_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors.dart';
import '../../login/widgets/login_container.dart';
import '../../login/widgets/network_link.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool? ismValid, familyaValid, emailValid;
  final formKey = GlobalKey<FormState>();
  final ismController =TextEditingController();
  final familiyaController =TextEditingController();
  final emailController =TextEditingController();

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
      child: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
         if (state.status == SignupStatus.success) {
           context.go(Routes.signUpPhone);
         }
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 150.h),
            child: Column(
              children: [
                LoginMainText(
                  text:
                  "O‘quv platformasiga kirish uchun quyida berilgan maydonlarni to‘ldirib ro‘yxatdan o‘ting",
                  title: "Ro'yxatdan o'tish",
                ),
                SizedBox(height: 20.h),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      LoginTextFormField(
                        controller: ismController,
                        hintText: "Ism",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            ismValid = false;
                            setState(() {});
                            return "Iltimos, ismingizni kiriting";
                          }

                          final nameRegex = RegExp(
                            r"^[A-Za-zА-Яа-яЎўҚқҒғҲҳ\s'-]{2,}$",
                          );

                          if (!nameRegex.hasMatch(value.trim())) {
                            ismValid = false;
                            setState(() {});
                            return "Faqat harflardan iborat ism kiriting";
                          }

                          ismValid = true;
                          setState(() {});
                          return null;
                        },
                        isValid: ismValid,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        size: 16,
                        prefixSvg: "assets/icons/profile3.svg",
                      ),
                      SizedBox(height: 8.h),
                      LoginTextFormField(
                        controller: familiyaController,
                        hintText: "Familiya",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            ismValid = false;
                            setState(() {});
                            return "Iltimos, Familya kiriting";
                          }

                          final nameRegex = RegExp(
                            r"^[A-Za-zА-Яа-яЎўҚқҒғҲҳ\s'-]{2,}$",
                          );

                          if (!nameRegex.hasMatch(value.trim())) {
                            familyaValid = false;
                            setState(() {});
                            return "Faqat harflardan iborat familya kiriting";
                          }

                          familyaValid = true;
                          setState(() {});
                          return null;
                        },
                        isValid: familyaValid,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        size: 16,
                        prefixSvg: "assets/icons/profile3.svg",
                      ),
                      SizedBox(height: 8.h),
                      LoginTextFormField(
                        controller: emailController,
                        hintText: "Elektron pochta",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            emailValid = false;
                            setState(() {});
                            return "Iltimos, emailingizni kiriting";
                          }

                          final emailRegex = RegExp(
                            r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$",
                          );

                          if (!emailRegex.hasMatch(value.trim())) {
                            emailValid = false;
                            setState(() {});
                            return "Email formati noto‘g‘ri";
                          }

                          emailValid = true;
                          setState(() {});
                          return null;
                        },
                        isValid: emailValid,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        size: 16,
                        prefixSvg: "assets/icons/pochta.svg",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 129.h),
                Divider(color: AppColors.textColor.withValues(alpha: 0.5)),
                SizedBox(height: 10.h),
                Text(
                  textAlign: TextAlign.start,
                  "Quyidagilar orqali kirish",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NetworkLink(
                      svg: 'assets/icons/google.svg',
                      text: "Google",
                      callback: () {},
                    ),
                    NetworkLink(
                      svg: "assets/icons/apple.svg",
                      text: "Apple",
                      callback: () {},
                    ),
                  ],
                ),
                SizedBox(height: 90.h),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: AppColors.textColor, fontSize: 14),
                    children: [
                      TextSpan(text: "Tizimga kirish orqali siz "),
                      TextSpan(
                        text: "foydalanish shartlari",
                        style: TextStyle(color: AppColors.gredient),
                        recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            // open terms of use
                          },
                      ),
                      TextSpan(text: " va "),
                      TextSpan(
                        text: "maxfiylik siyosati",
                        style: TextStyle(color: AppColors.gredient),
                        recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            // open privacy policy
                          },
                      ),
                      TextSpan(text: "ga roziligingizni tasdiqlaysiz"),
                    ],
                  ),
                ),

                LoginContainer(
                  color: AppColors.mainColor,
                  text: "Davom etish",
                  callback: () {
                    if (formKey.currentState?.validate() ?? false) {
                      context.read<SignupBloc>().add(
                        SignupFirstPageSubmitted(
                          firstName: ismController.text,
                          lastName: familiyaController.text,
                          email: emailController.text,
                        ),
                      );
                    }
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
