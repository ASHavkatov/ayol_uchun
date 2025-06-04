import 'package:ayol_uchun_exam/core/data/models/auth_model/sign_up_model.dart';
import 'package:ayol_uchun_exam/core/interceptor.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.9.28:8888/api/v1",validateStatus: (status) => true,))
    ..interceptors.add(AuthInterceptor());

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

  Future<List<dynamic>> fetchInterview() async {
    final response = await dio.get("/interviews/list");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Interviewlarni olib kelishda hatolik bor");
    }
  }

  Future<String> login(String login, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: {'login': login, 'password': password},
    );
    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw Exception("Login qilishda xatolik");
    }

  }

  Future<bool> signUp(SignUpModel model) async {
    var response = await dio.post('/auth/register', data: model.toJson());
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
  Future<dynamic>fetchUser()async{
    final response =await dio.get("/auth/me");
    if(response.statusCode == 200){
      return response.data;
    }else{
      throw Exception("User ni olib kelishda hatolik bor");
    }
  }
}
