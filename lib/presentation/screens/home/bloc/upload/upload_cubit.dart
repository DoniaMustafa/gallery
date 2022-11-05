import 'dart:io';
import 'package:gellary/core/utils/constant.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:gellary/data/repositories/upload_to_gallery_reop.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';


part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit(this.repository) : super(UploadInitial());

  final UploadToGalleryRepository repository;
  bool isSelect = false;

  MultipartFile? multipartFile;
  XFile? image;
  List multipartImageList = [];
  List<File>? imgeFile = [];
  ImagePicker? imagePicker = ImagePicker();

  selectGallery() {
    isSelect = !isSelect;
    print(isSelect);
    emit(SelectImageState());
  }

  Future uploadImageCamera(String pick) async {
    emit(UploadLoadingState());
    isSelect = false;

  await  repository.uploadImageCamera(pick: pick).then((value) {
      print(value);
      uploadFile();
      emit(UploadSuccessState());
    }).catchError((onError) {
      emit(UploadErrorState());
    });
    // isSelect=false;
    // if(pick =='Camera'){ image = await imagePicker!.pickImage(source: ImageSource.camera);}
    // else{image = await imagePicker!.pickImage(source: ImageSource.gallery);}
    //
    // multipartFile = await   MultipartFile.fromFile(image!.path,
    //   filename: image!.name,contentType: MediaType("image", image!.path.split(".").last));
    // multipartImageList.add(multipartFile!);
    // uploadFile( );
    // upload(image!.name,image!.path);

  }

  Future<Response?> uploadFile() async {
    emit(LoadingImageState());
    return await repository.uploadImages(toke: token!).then((value) {
      print('success');
      emit(SuccessImageState());
    }).catchError((error) {
      print('error : ${error.toString()}');
      emit(ErrorImageState());
    });
  }


}
