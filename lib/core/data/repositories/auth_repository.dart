import 'package:ayol_uchun_exam/core/data/models/auth_model/sign_up_model.dart';
import 'package:ayol_uchun_exam/core/data/models/user_model.dart';

import '../../client.dart';
import '../../secure_storege.dart';

class AuthRepository {
  AuthRepository({required this.client});

  final ApiClient client;

  String? jwt;


  Future<bool> login(String login, String password) async {
    jwt = await client.login(login, password);
    await SecureStorage.deleteCredentials();
    await SecureStorage.deleteToken();
    await SecureStorage.saveToken(jwt!);
    await SecureStorage.saveCredentials(login: login, password: password);
    return true;
  }

  Future<void> logout() async {
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
  }

  Future<bool> refreshToken() async {
    var credentials = await SecureStorage.getCredentials();
    if (credentials['login'] == null || credentials['password'] == null) {
      return false;
    }
    jwt = await client.login(credentials['login']!, credentials['password']!);
    await SecureStorage.deleteToken();
    await SecureStorage.saveToken(jwt!);
    return true;
  }

  Future<bool> signUp({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    final result = await client.signUp(
      SignUpModel(firstName: firstName, lastName: lastName, email: email),
    );
    return result;
  }

  Future<UserModel>fetchUser()async{
    final rawUser = await client.fetchUser();
    return UserModel.fromJson(rawUser);
  }

}