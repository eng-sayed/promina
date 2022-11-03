part of 'gallery_cubit.dart';

@immutable
abstract class GalleryState {}

class GalleryInitial extends GalleryState {}

class GalleryLoading extends GalleryState {}

class GallerySucsses extends GalleryState {}

class GalleryFail extends GalleryState {}

class AddGalleryLoading extends GalleryState {}

class AddGallerySucsses extends GalleryState {}

class AddGalleryFail extends GalleryState {}
