import 'package:ayol_uchun_exam/core/client.dart';
import 'package:ayol_uchun_exam/core/data/models/courses_model.dart';

class CoursesRepository{
  final ApiClient client;
  CoursesRepository({required this.client});

  Future<List<CoursesModel>>fetchCourses()async{
    final rawCourses = await client.fetchCourses();
    final detail  =  rawCourses.map((e)=> CoursesModel.fromJson(e)).toList();
    return detail;
  }
}