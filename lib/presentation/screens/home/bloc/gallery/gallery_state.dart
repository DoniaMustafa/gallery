part of 'gallery_cubit.dart';

@immutable
abstract class GalleryState {
  final GalleryModel? galleryModel;
  final String? error;

  const GalleryState({this.galleryModel, this.error});
}

class GalleryInitial extends GalleryState {}

class LoadingState extends GalleryState {}

class GallerySuccessState extends GalleryState {
  const GallerySuccessState(final GalleryModel? user) : super(galleryModel: user);
}

class ErrorState extends GalleryState {
  const ErrorState(final String? error) : super(error: error);
}

