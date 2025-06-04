// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  email: json['email'] as String,
  lastName: json['lastName'] as String,
  phoneNumber: json['phoneNumber'] as String,
  firstName: json['firstName'] as String,
  id: (json['id'] as num).toInt(),
  gender: json['gender'] as String?,
  birthDate:
      json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'gender': instance.gender,
  'birthDate': instance.birthDate?.toIso8601String(),
};
