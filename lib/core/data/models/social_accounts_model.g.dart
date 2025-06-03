// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_accounts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialAccountsModel _$SocialAccountsModelFromJson(Map<String, dynamic> json) =>
    SocialAccountsModel(
      title: json['title'] as String,
      icon: json['icon'] as String,
      id: (json['id'] as num).toInt(),
      link: json['link'] as String,
    );

Map<String, dynamic> _$SocialAccountsModelToJson(
  SocialAccountsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'link': instance.link,
  'icon': instance.icon,
};
