import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable(createToJson: false)
class CategoriesModel {
  final int id;
  final String title;
  final String icon;
  final int totalCourses;

  CategoriesModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.totalCourses,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
}
