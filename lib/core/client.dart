import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.9.28:8888/api/v1"));

  Future<List<dynamic>> fetchCategories() async {
    final response = await dio.get("/categories/list");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Categories ni olib kelishda hatolik bor");
    }
  }

  Future<List<dynamic>> fetchCourses() async {
    final response = await dio.get("/courses/list");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Courses ni olib kelishda hatolik bor");
    }
  }

  Future<List<dynamic>> fetchSocialAccount() async {
    final response = await dio.get("/social-accounts/list");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Social Account larni olib kelishda xatolik bor");
    }
  }
  Future<List<dynamic>>fetchInterview()async{
    final response = await dio.get("/interviews/list");
    if(response.statusCode == 200){
      return response.data;
    }else{
      throw Exception("Interviewlarni olib kelishda hatolik bor");
    }
  }
}
