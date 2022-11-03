import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina/presentation/layout/gallery/screens/gallery.dart';
import 'package:promina/presentation/layout/login/cubit/auth_state.dart';

import '../../../../core/utils/alerts.dart';
import '../../../../core/utils/utils.dart';
import '../../../../data/sources/local/sharedpreferences.dart';
import '../../../../domin/repositry/auth_repo/auth_repo.dart';
import '../../../componants/navigator.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  bool isLogin = false;
  saveUserData() {
    CacheHelper.saveData(key: "token", value: Utiles.token);
    CacheHelper.saveData(key: "name", value: Utiles.name);
  }

  login(
    context, {
    required String username,
    required String password,
  }) async {
    emit(LoginLoadingState());
    final response = await AuthRepository.login(
      context: context,
      username: username,
      password: password,
    );

    if (response != null) {
      saveUserData();
      navigateReplacement(context: context, route: GalleryScreen());

      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState());
    }
  }

  getUserData(context) async {
    Utiles.token = await CacheHelper.loadData(key: "token") ?? "";
    Utiles.name = CacheHelper.loadData(key: "name") ?? "";
    if (Utiles.token == '') {
      isLogin = false;
    } else {
      isLogin = true;
      navigateReplacement(context: context, route: GalleryScreen());
    }
  }
}
