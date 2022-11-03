import 'dart:io';
import 'package:dio/dio.dart';
import '../../../data/sources/api/dio.dart';
import '../../endpoints/endpoint.dart';
import '../../../core/utils/utils.dart';
import '../../models/gallery/gallery_model.dart';

class GalleryRepositry {
  static Future<GalleryModel?> getImages(context) async {
    final response = await DioHelper.getData(
      context,
      path: EndPoins.getGallery,
      loading: true,
      token: Utiles.token,
    );
    if (response != null) {
      return GalleryModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  static uploadImage(context, File image) async {
    final response = await DioHelper.postData(context,
        path: EndPoins.uploadImage,
        loading: true,
        body: {
          'img': await MultipartFile.fromFile(image.path,
              filename: image.path.split(Platform.pathSeparator).last)
        },
        isForm: true);
    if (response != null) {
      return response.data;
    } else {
      return null;
    }
  }
}
