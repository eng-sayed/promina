import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domin/models/gallery/gallery_model.dart';
import '../../../../domin/repositry/gallery_repo/gallery_repo.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(GalleryInitial());
  static GalleryCubit get(context) => BlocProvider.of(context);
  GalleryModel galleryModel = GalleryModel();

  getImage(context) async {
    emit(GalleryLoading());
    final response = await GalleryRepositry.getImage(context);
    if (response != null) {
      galleryModel = response;
      print(galleryModel.toJson());
      emit(GallerySucsses());
    }
  }
}
