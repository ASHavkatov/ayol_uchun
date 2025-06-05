import 'package:ayol_uchun_exam/core/routing/routes.dart';
import 'package:ayol_uchun_exam/features/authentication/login/blocs/login_bloc.dart';
import 'package:ayol_uchun_exam/features/authentication/login/page/login_view.dart';
import 'package:ayol_uchun_exam/features/authentication/sign_up/blocs/signup_bloc.dart';
import 'package:ayol_uchun_exam/features/authentication/sign_up/page/sign_code_view.dart';
import 'package:ayol_uchun_exam/features/authentication/sign_up/page/sign_password_view.dart';
import 'package:ayol_uchun_exam/features/authentication/sign_up/page/sign_phone.dart';
import 'package:ayol_uchun_exam/features/authentication/sign_up/page/sign_up_view.dart';
import 'package:ayol_uchun_exam/features/course/blocs/course_bloc.dart';
import 'package:ayol_uchun_exam/features/course/page/course_view.dart';
import 'package:ayol_uchun_exam/features/home/blocs/home_bloc.dart';
import 'package:ayol_uchun_exam/features/splash_screen/splash_screen.dart';
import 'package:ayol_uchun_exam/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/page/home_view.dart';

GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder:
          (context, state) => BlocProvider(
            create:
                (context) => HomeBloc(
                  categoryRepo: context.read(),
                  coursesRepo: context.read(),
                  interviewRepo: context.read(),
                  accountRepo: context.read(),
                  userRepo: context.read(),
                ),
            child: HomeView(),
          ),
    ),
    GoRoute(
      path: Routes.login,
      builder:
          (context, state) => BlocProvider(
            create: (context) => LoginBloc(repo: context.read()),
            child: LoginView(),
          ),
    ),
    GoRoute(
      path: Routes.course,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => CourseBloc(repo: context.read(),social: context.read()),
          child: CourseView(),
        );
      },
    ),
    GoRoute(
      path: Routes.signUp,

      builder: (context, state) {
        final signupBloc = SignupBloc(repo: context.read());
        return BlocProvider.value(
          value: context.read<SignupBloc>(),
          child: SignUpView(),
        );
      },
    ),
    GoRoute(
      path: Routes.signUpPhone,
      builder: (context, state) {
        return BlocProvider.value(
          value: context.read<SignupBloc>(),
          child: SignPhoneView(),
        );
      },
    ),
    GoRoute(
      path: Routes.code,
      builder:
          (context, state) => BlocProvider(
            create: (context) => SignupBloc(repo: context.read()),
            child: SignCodeView(),
          ),
    ),
    GoRoute(
      path: Routes.password,
      builder:
          (context, state) => BlocProvider.value(
            value: context.read<SignupBloc>(),
            child: SignPasswordView(),
          ),
    ),
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) => SplashScreen(),
    ),
  ],
);
