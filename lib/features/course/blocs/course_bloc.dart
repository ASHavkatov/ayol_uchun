import 'package:ayol_uchun_exam/core/data/repositories/courses_repository.dart';
import 'package:ayol_uchun_exam/features/course/blocs/course_event.dart';
import 'package:ayol_uchun_exam/features/course/blocs/course_state.dart';
import 'package:bloc/bloc.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState>{
  final CoursesRepository _repo;
  CourseBloc({required CoursesRepository repo}):_repo = repo, super(CourseState.initial()){
    on<CourseLoad>(_onLoad);
    add(CourseLoad());
  }
  Future _onLoad(CourseEvent event, Emitter<CourseState>emit)async{
    final detail = await _repo.fetchCourses();
    return CourseState(model: detail, status: CourseStatus.idle);
  }
}