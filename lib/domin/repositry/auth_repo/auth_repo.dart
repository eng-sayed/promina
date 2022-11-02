import 'package:flutter/material.dart';
import 'package:promina/domin/models/user/user_model.dart';

import '../../../core/utils/utils.dart';
import '../../../data/sources/api/dio.dart';
import '../../endpoints/endpoint.dart';

class AuthRepository {
  static Future<UserModel?> login({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    final response = await DioHelper.postData(context,
        url: EndPoins.login,
        loading: true,
        isForm: true,
        body: {
          "email": username,
          "password": password,
        });
    if (response != null) {
      Utiles.token = response.data["token"];
      Utiles.name = response.data['user']["name"].toString();
      print(Utiles.token);
      return UserModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
