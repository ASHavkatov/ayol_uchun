import 'package:ayol_uchun_exam/core/routing/routes.dart';
import 'package:ayol_uchun_exam/core/utils/colors.dart';
import 'package:ayol_uchun_exam/features/authentication/login/widgets/login_container.dart';
import 'package:ayol_uchun_exam/features/authentication/login/widgets/login_main_text.dart';
import 'package:ayol_uchun_exam/features/authentication/login/widgets/login_text_form_field.dart';
import 'package:ayol_uchun_exam/features/authentication/sign_up/blocs/signup_bloc.dart';
import 'package:ayol_uchun_exam/features/authentication/sign_up/blocs/signup_event.dart';
import 'package:ayol_uchun_exam/features/authentication/sign_up/blocs/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignPasswordView extends StatefulWidget {
  SignPasswordView({super.key});

  @override
  State<SignPasswordView> createState() => _SignPasswordViewState();
}

class _SignPasswordViewState extends State<SignPasswordView> {

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


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
        listener: (context, state){
          if(state.status == SignupStatus.success){
            context.go(Routes.login);
          }
        },child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 150.h),
          child: Column(
            children: [
              LoginMainText(
                text:
                "O‘quv platformasiga kirish uchun quyida berilgan maydonlarni to‘ldirib ro‘yxatdan o‘ting",
                title: "Ro‘yxatdan o‘tish",
              ),
              SizedBox(height: 20.h),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    LoginTextFormField(
                      controller: passwordController,
                      hintText: "Parol",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Parolni kiriting";
                        } else if (value.length < 6) {
                          return "Parol kamida 6 ta belgidan iborat bo'lishi kerak";
                        }
                        return null;
                      },
                      isValid: true,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      size: 14,
                      prefixSvg: "assets/icons/lock.svg",
                      svg: "assets/icons/eye.svg",
                    ),
                    SizedBox(height: 8.h),
                    LoginTextFormField(
                      controller: confirmPasswordController,
                      hintText: "Parolni tasdiqlash",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Parolni qaytadan kiriting";
                        } else if (value != passwordController.text) {
                          return "Parollar mos emas";
                        }
                        return null;
                      },
                      isValid: true,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      size: 14,
                      prefixSvg: "assets/icons/lock.svg",
                      svg: "assets/icons/eye.svg",
                    ),
                    SizedBox(height: 300.h),
                    LoginContainer(
                      color: AppColors.mainColor,
                      text: "Kirish",
                      callback: () {
                        if (formKey.currentState!.validate()) {
                          context.read<SignupBloc>().add(
                            SignupThirdPageSubmitted(
                              password: confirmPasswordController.text,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Iltimos, formani to‘g‘ri to‘ldiring"),
                            ),
                          );
                        }
                      },

                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
