import 'package:json_annotation/json_annotation.dart';

part 'social_accounts_model.g.dart';

@JsonSerializable()
class SocialAccountsModel {
  final int id;
  final String title;
  final String link;
  final String icon;

  SocialAccountsModel({
    required this.title,
    required this.icon,
    required this.id,
    required this.link,
  });

  factory SocialAccountsModel.fromJson(Map<String, dynamic> json) =>
      _$SocialAccountsModelFromJson(json);
}
