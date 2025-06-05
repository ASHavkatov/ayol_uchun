import 'package:ayol_uchun_exam/core/data/repositories/auth_repository.dart';
import 'package:ayol_uchun_exam/core/data/repositories/categories_repository.dart';
import 'package:ayol_uchun_exam/core/data/repositories/courses_repository.dart';
import 'package:ayol_uchun_exam/core/data/repositories/interview_repository.dart';
import 'package:ayol_uchun_exam/core/data/repositories/social_account_repository.dart';
import 'package:ayol_uchun_exam/features/authentication/login/blocs/login_bloc.dart';
import 'package:ayol_uchun_exam/features/authentication/sign_up/blocs/signup_bloc.dart';
import 'package:ayol_uchun_exam/features/course/blocs/course_bloc.dart';
import 'package:ayol_uchun_exam/features/home/blocs/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'client.dart';

List<SingleChildWidget> providers = [
  Provider(create: (context) => ApiClient()),
  Provider(
    create: (context) => SocialAccountRepository(client: context.read()),
  ),
  Provider(create: (context) => InterviewRepository(client: context.read())),
  Provider(create: (context) => AuthRepository(client: context.read())),
  Provider(create: (context) => CoursesRepository(client: context.read())),
  Provider(create: (context) => CategoriesRepository(client: context.read())),
  BlocProvider(create: (context) => LoginBloc(repo: context.read())),
  BlocProvider(
    create:
        (context) => HomeBloc(
          userRepo: context.read(),
          categoryRepo: context.read(),
          coursesRepo: context.read(),
          interviewRepo: context.read(),
          accountRepo: context.read(),
        ),
  ),
  BlocProvider(create: (context) => CourseBloc(repo: context.read(), social: context.read()),),
  BlocProvider(create: (context) => SignupBloc(repo: context.read()),),
];
