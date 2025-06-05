import 'package:ayol_uchun_exam/core/data/repositories/courses_repository.dart';
import 'package:ayol_uchun_exam/core/data/repositories/social_account_repository.dart';
import 'package:ayol_uchun_exam/features/course/blocs/course_event.dart';
import 'package:ayol_uchun_exam/features/course/blocs/course_state.dart';
import 'package:bloc/bloc.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CoursesRepository _repo;
  final SocialAccountRepository _social;

  CourseBloc({
    required CoursesRepository repo,
    required SocialAccountRepository social,
  }) : _repo = repo,
       _social = social,
       super(CourseState.initial()) {
    on<CourseLoad>(_onLoad);
    add(CourseLoad());
  }

  Future _onLoad(CourseLoad event, Emitter<CourseState> emit) async {
    final detail = await _repo.fetchCourses();
    final social = await _social.fetchSocialAccount();
    emit(state.copyWith(social: social,course: detail, status: CourseStatus.idle));
  }
}
