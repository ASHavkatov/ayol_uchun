import 'package:ayol_uchun_exam/core/data/models/auth_model/sign_up_model.dart';
import 'package:ayol_uchun_exam/core/interceptor.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://172.20.10.2:8888/api/v1",validateStatus: (status) => true,))
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
    try {
      final response = await dio.post(
        '/auth/login',
        data: {'login': login, 'password': password},
      );
      if (response.statusCode == 200) {
        final data = Map<String, dynamic>.from(response.data);
        final accessToken = data['accessToken'];
        if (accessToken is String) {
          return accessToken;
        } else {
          throw Exception("Token topilmadi");
        }
      } else {
        throw Exception("Login qilishda xatolik: ${response.statusCode}");
      }
    }  catch (e) {
      throw Exception("Tarmoq xatosi: ${e}");
    } catch (e) {
      throw Exception("Noma'lum xatolik: $e");
    }
  }

  Future<bool> signUp(SignUpModel model) async {
    try {
      var response = await dio.post('/auth/register', data: model.toJson());
      print("Client: ${response.statusCode}");
      print("Client2: ${response.data}");
      print("Client3: ${response}");
      if (response.statusCode == 201) {
        return true;
      } else {
        throw Exception("Ro‘yxatdan o‘tishda noma'lum xatolik yuz berdi.");
      }
    } on DioException catch (e) {
      throw Exception("Ro‘yxatdan o‘tishda xatolik: ${e.response?.data ?? e.message}");
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
