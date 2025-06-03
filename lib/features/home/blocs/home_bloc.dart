import 'package:ayol_uchun_exam/core/data/repositories/categories_repository.dart';
import 'package:ayol_uchun_exam/core/data/repositories/courses_repository.dart';
import 'package:ayol_uchun_exam/core/data/repositories/interview_repository.dart';
import 'package:ayol_uchun_exam/core/data/repositories/social_account_repository.dart';
import 'package:ayol_uchun_exam/features/home/blocs/home_event.dart';
import 'package:ayol_uchun_exam/features/home/blocs/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoriesRepository _categoryRepo;
  final CoursesRepository _coursesRepo;
  final InterviewRepository _interviewRepo;
  final SocialAccountRepository _accountRepo;

  HomeBloc({
    required CategoriesRepository categoryRepo,
    required CoursesRepository coursesRepo,
    required InterviewRepository interviewRepo,
    required SocialAccountRepository accountRepo,
  }) : _categoryRepo = categoryRepo,
       _coursesRepo = coursesRepo,
       _accountRepo = accountRepo,
       _interviewRepo = interviewRepo,

       super(HomeState.initial()) {
    on<HomeLoad>(_onLoad);
    add(HomeLoad());
  }

  Future<void> _onLoad(HomeEvent event, Emitter<HomeState> emit) async {
    final detail = await _categoryRepo.fetchCategories();
    emit(state.copyWith(status: HomeStatus.idle, model: detail));
  }
}
