// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterviewModel _$InterviewModelFromJson(Map<String, dynamic> json) =>
    InterviewModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      user: json['user'] as String,
      image: json['image'] as String,
      duration: (json['duration'] as num).toInt(),
    );

Map<String, dynamic> _$InterviewModelToJson(InterviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'title': instance.title,
      'image': instance.image,
      'duration': instance.duration,
    };
