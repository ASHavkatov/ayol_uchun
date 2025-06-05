import 'package:ayol_uchun_exam/features/authentication/login/widgets/login_main_text.dart';
import 'package:ayol_uchun_exam/features/authentication/sign_up/blocs/signup_bloc.dart';
import 'package:ayol_uchun_exam/features/authentication/sign_up/blocs/signup_event.dart';
import 'package:ayol_uchun_exam/features/authentication/sign_up/blocs/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/colors.dart';
import '../../login/widgets/login_container.dart';
import '../../login/widgets/login_text_form_field.dart';

class SignPhoneView extends StatefulWidget {
  const SignPhoneView({super.key});


  @override
  State<SignPhoneView> createState() => _SignPhoneViewState();
}

class _SignPhoneViewState extends State<SignPhoneView> {


  bool? phoneValid;
  final phoneNumberController = TextEditingController();
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
      child: BlocBuilder<SignupBloc, SignupState>(
          builder: (context, state) {
            return switch(state.status){
              SignupStatus.loading => Center(child: CircularProgressIndicator(),),
              SignupStatus.idle => Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 150.h),
                    child: Column(
                      children: [
                        LoginMainText(
                          text:
                          "O‘quv platformasiga kirish uchun telefon raqamingizni kiriting",
                          title: "Telefon raqami",
                        ),
                        SizedBox(height: 20),
                        Form(
                          key: formKey,
                          child: LoginTextFormField(
                            hintText: "+998",
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            controller: phoneNumberController,
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
                        ),
                        SizedBox(height: 450.h),
                        LoginContainer(
                          color: AppColors.mainColor,
                          text: "Davom etish",
                          callback: () {
                            context.read<SignupBloc>().add(
                              SignupSecondPageSubmitted(
                                phoneNumber: phoneNumberController.text,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
              ),
              SignupStatus.success => throw UnimplementedError(),
              SignupStatus.error => Center(child: Text("xatolik bor"),),
            };
          },
      ),
      
    );
  }
}
