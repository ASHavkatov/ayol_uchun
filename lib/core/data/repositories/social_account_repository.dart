import 'package:ayol_uchun_exam/core/client.dart';
import 'package:ayol_uchun_exam/core/data/models/social_accounts_model.dart';

class SocialAccountRepository{
  final ApiClient client;
  SocialAccountRepository({required this.client});

  Future<List<SocialAccountsModel>>fetchSocialAccount()async{
    final rawSocialAccount = await client.fetchSocialAccount();
    final detail  = rawSocialAccount.map((e)=> SocialAccountsModel.fromJson(e)).toList();
    return detail;
  }
}