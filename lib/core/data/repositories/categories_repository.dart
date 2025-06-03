import 'package:ayol_uchun_exam/core/client.dart';
import 'package:ayol_uchun_exam/core/data/models/categories_model.dart';

class CategoriesRepository {
  final ApiClient client;

  CategoriesRepository({required this.client});

  Future<List<CategoriesModel>> fetchCategories() async {
    final rawCategories = await client.fetchCategories();
    final detail = rawCategories.map((e) => CategoriesModel.fromJson(e)).toList();
    return detail;
  }
}
