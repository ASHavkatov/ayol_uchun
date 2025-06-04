import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String? gender;
  final DateTime? birthDate;

  UserModel({
    required this.email,
    required this.lastName,
    required this.phoneNumber,
    required this.firstName,
    required this.id,
    required this.gender,
    required this.birthDate,
  });

factory UserModel.fromJson(Map<String, dynamic>json)=> _$UserModelFromJson(json);
}
