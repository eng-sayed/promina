import '../../../data/sources/api/dio.dart';
import '../../endpoints/endpoint.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';
import '../../models/gallery/gallery_model.dart';

class GalleryRepositry {
  static Future<GalleryModel?> getImage(context) async {
    final response = await DioHelper.getData(
      context,
      url: EndPoins.getGallery,
      loading: true,
      token: Utiles.token,
    );
    if (response != null) {
      print(GalleryModel.fromJson(response.data).data!.images![0]);
      return GalleryModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
