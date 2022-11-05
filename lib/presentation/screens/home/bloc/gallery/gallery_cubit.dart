import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:gellary/data/models/gallery_model.dart';
import 'package:gellary/data/repositories/get_gallery_repository.dart';
import 'package:meta/meta.dart';
part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit(this.repository,)
      : super(GalleryInitial());

  final GetGalleryRepository repository;
  GalleryModel? galleryModel;
  //
  Future<Response?> getGallery(String toke) async {
    emit(LoadingState());
    return await repository.getAllProd(token: toke).then((value) {
      galleryModel = galleryModelFromJson(value.toString());
      print(galleryModel);

      emit(GallerySuccessState(galleryModel));
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorState(onError.toString()));
    });
  }







}
