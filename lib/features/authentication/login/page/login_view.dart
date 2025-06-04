import 'package:ayol_uchun_exam/core/utils/colors.dart';
import 'package:ayol_uchun_exam/features/authentication/login/blocs/login_bloc.dart';
import 'package:ayol_uchun_exam/features/authentication/login/blocs/login_state.dart';
import 'package:ayol_uchun_exam/features/authentication/login/widgets/login_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../blocs/login_event.dart';
import '../widgets/login_container.dart';
import '../widgets/login_main_text.dart';
import '../widgets/network_link.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool? phoneValid, passwordValid;
  final formKey = GlobalKey<FormState>();

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
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) async {
            if (state.status == LoginStatus.success) {
              context.push(Routes.home);
            }
          },
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 150.h),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginMainText(
                    text:
                        "O‘quv platformasiga kirish uchun quyida elektron pochtangiz va parolingizni kiriting",
                    title: "Kirish",
                  ),
                  SizedBox(height: 20.h),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        LoginTextFormField(
                          hintText: "+998",
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          controller: context.read<LoginBloc>().loginController,
                          size: 16,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              phoneValid = false;
                              setState(() {});
                              return "Iltimos raqamni kiritng";
                            }
                            final phoneRegex = RegExp(r'^\+998\d{9}$');

                            if (!phoneRegex.hasMatch(value)) {
                              phoneValid = false;
                              setState(() {});
                              return "Raqamda hatolik bor";
                            }
                            phoneValid = true;
                            setState(() {});
                            return null;
                          },
                          isValid: null,
                          prefixSvg: "assets/icons/phone.svg",
                        ),
                        SizedBox(height: 8.h),
                        LoginTextFormField(
                          svg: "assets/icons/eye.svg",
                          hintText: "Parol",
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          controller: context.read<LoginBloc>().passwordController,
                          size: 16,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              passwordValid = false;
                              setState(() {});
                              return "Iltimons parol kiriting";
                            }
                            final passwordRegex = RegExp(r'^(?=.*\d).{6,}$');
                            if (!passwordRegex.hasMatch(value)) {
                              passwordValid = false;
                              setState(() {});
                              return "Parol xato kiritildi";
                            }
                            passwordValid = true;
                            setState(() {});
                            return null;
                          },
                          isValid: null,
                          prefixSvg: 'assets/icons/lock.svg',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        "Parolni unutdingizmi",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
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

                  SizedBox(height: 32.h),
                  LoginContainer(
                    color: AppColors.mainColor,
                    text: "Kirish",
                    callback: () {
                      final formState = formKey.currentState;
                      if (formState != null && formState.validate()) {
                        context.read<LoginBloc>().add(LoginLoad());
                        context.go(Routes.home);
                      }
                    },
                  ),
                  SizedBox(height: 8.h),
                  LoginContainer(
                    color: AppColors.darkContainer,
                    text: "Ro'yxatdan o'tish",
                    callback: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
