// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursesModel _$CoursesModelFromJson(Map<String, dynamic> json) => CoursesModel(
  id: (json['id'] as num).toInt(),
  user: json['user'] as String,
  category: json['category'] as String,
  title: json['title'] as String,
  image: json['image'] as String,
  status: json['status'] as String?,
  price: json['price'] as num,
  rating: json['rating'] as num,
);
