import 'package:json_annotation/json_annotation.dart';
part 'interview_model.g.dart';


@JsonSerializable()
class InterviewModel {
  final int id;
  final String user;
  final String title;
  final String image;
  final int duration;

  InterviewModel({
    required this.id,
    required this.title,
    required this.user,
    required this.image,
    required this.duration,
  });

  factory InterviewModel.fromJson(Map<String, dynamic>json)=> _$InterviewModelFromJson(json);
}
