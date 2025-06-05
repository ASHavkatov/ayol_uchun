import 'package:json_annotation/json_annotation.dart';
part 'sign_up_model.g.dart';


@JsonSerializable()
class SignUpModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;

  SignUpModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.phoneNumber,
  });
  factory SignUpModel.fromJson(Map<String, dynamic>json)=> _$SignUpModelFromJson(json);
  Map<String,dynamic>toJson()=>_$SignUpModelToJson(this);
}
