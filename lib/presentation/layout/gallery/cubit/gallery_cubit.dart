import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/utils.dart';
import '../../../../data/sources/local/sharedpreferences.dart';
import '../../../../domin/models/gallery/gallery_model.dart';
import '../../../../domin/repositry/gallery_repo/gallery_repo.dart';
import '../../../componants/navigator.dart';
import '../../login/cubit/auth_cubit.dart';
import '../../login/screens/login.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(GalleryInitial());
  static GalleryCubit get(context) => BlocProvider.of(context);
  GalleryModel galleryModel = GalleryModel();

  getImage(context) async {
    emit(GalleryLoading());
    final response = await GalleryRepositry.getImages(context);
    if (response != null) {
      galleryModel = response;
      print(galleryModel.toJson());
      emit(GallerySucsses());
    } else {}
  }

  addImage(context, File image) async {
    emit(AddGalleryLoading());
    final response = await GalleryRepositry.uploadImage(context, image);
    if (response != null) {
      emit(AddGallerySucsses());
      await getImage(context);
      Navigator.pop(context);
    } else {
      emit(AddGalleryFail());
    }
  }

  logout(context) {
    Utiles.token = "";
    Utiles.name = "";
    CacheHelper.sharedPreferences.clear();
    AuthCubit.get(context).isLogin = false;
    navigateReplacement(context: context, route: Login());
  }
}
