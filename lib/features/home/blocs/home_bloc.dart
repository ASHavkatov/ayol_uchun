import 'package:ayol_uchun_exam/core/data/repositories/categories_repository.dart';
import 'package:ayol_uchun_exam/core/data/repositories/courses_repository.dart';
import 'package:ayol_uchun_exam/core/data/repositories/interview_repository.dart';
import 'package:ayol_uchun_exam/core/data/repositories/social_account_repository.dart';
import 'package:ayol_uchun_exam/features/home/blocs/home_event.dart';
import 'package:ayol_uchun_exam/features/home/blocs/home_state.dart';
import 'package:bloc/bloc.dart';

import '../../../core/data/repositories/auth_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoriesRepository _categoryRepo;
  final CoursesRepository _coursesRepo;
  final InterviewRepository _interviewRepo;
  final SocialAccountRepository _accountRepo;
  final AuthRepository _userRepo;

  HomeBloc({
    required CategoriesRepository categoryRepo,
    required CoursesRepository coursesRepo,
    required InterviewRepository interviewRepo,
    required SocialAccountRepository accountRepo,
    required AuthRepository userRepo,
  }) : _categoryRepo = categoryRepo,
       _coursesRepo = coursesRepo,
       _accountRepo = accountRepo,
       _interviewRepo = interviewRepo,
       _userRepo = userRepo,

       super(HomeState.initial()) {
    on<HomeLoad>(_onLoad);
    add(HomeLoad());
  }

  Future<void> _onLoad(HomeLoad event, Emitter<HomeState> emit) async {
    final category = await _categoryRepo.fetchCategories();
    emit(state.copyWith(status: HomeStatus.idle, category: category));
    final courses = await _coursesRepo.fetchCourses();
    emit(state.copyWith(status: HomeStatus.idle, courses: courses));
    final interview = await _interviewRepo.fetchInterview();
    emit(state.copyWith(status: HomeStatus.idle, interview: interview));
    final social = await _accountRepo.fetchSocialAccount();
    emit(state.copyWith(status: HomeStatus.idle, social: social));
    final user = await _userRepo.fetchUser();
    emit(state.copyWith(status: HomeStatus.idle, user: user));
  }
}
