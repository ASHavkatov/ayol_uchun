import 'package:ayol_uchun_exam/core/routing/routes.dart';
import 'package:ayol_uchun_exam/features/authentication/login/blocs/login_bloc.dart';
import 'package:ayol_uchun_exam/features/authentication/login/page/login_view.dart';
import 'package:ayol_uchun_exam/features/course/blocs/course_bloc.dart';
import 'package:ayol_uchun_exam/features/course/page/course_view.dart';
import 'package:ayol_uchun_exam/features/home/blocs/home_bloc.dart';
import 'package:ayol_uchun_exam/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/page/home_view.dart';

GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.home  ,
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
          create: (context) => CourseBloc(repo: context.read()),
          child: CourseView(),
        );
      },
    ),
  ],
);
