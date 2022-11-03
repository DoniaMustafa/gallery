import 'dart:io';
import 'package:gellary/core/utils/constant.dart';
import 'package:gellary/core/utils/end_pints.dart';
import 'package:http_parser/http_parser.dart';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:gellary/data/repositories/upload_to_gallery_reop.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit(this.repository) : super(UploadInitial());

  final UploadToGalleryRepository repository;
  bool isSelect=false;

  MultipartFile? multipartFile;
  XFile? image;
  List multipartImageList = [];
  List<File>? imgeFile = [];
  ImagePicker? imagePicker = ImagePicker();


 selectGallery(){
  isSelect = !isSelect;
  print(isSelect);
  emit(SelectImageState());
}


  Future uploadImageCamera(String pick) async {
    isSelect=false;
    if(pick =='Camera'){ image = await imagePicker!.pickImage(source: ImageSource.camera);}
    else{image = await imagePicker!.pickImage(source: ImageSource.gallery);}

    multipartFile = await   MultipartFile.fromFile(image!.path,
      filename: image!.name,contentType: MediaType("image", image!.path.split(".").last));
    multipartImageList.add(multipartFile!);
    uploadFile( multipartImageList);
    // upload(image!.name,image!.path);
    emit(UploadImageState());
  }

  Future<Response?> uploadFile(List img) async {
    emit(LoadingImageState());
    return await repository.uploadImages(img:img,toke: token!).then((value) {
      print('success');
      emit(SuccessImageState());
    }).catchError((error) {
      print('error : ${error.toString()}');
      emit(ErrorImageState());
    });
  }


  Future upload(String imageName,String imagePath)async{
    emit(LoadingImageState());

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('$lBaseUrl$uploadImageEndPoint'));
    request.files.add(await http.MultipartFile.fromPath(imageName, imagePath));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    print('dv');
    emit(SuccessImageState());

    }
    else {
    print(response.reasonPhrase);
    emit(ErrorImageState());

    }

  }
}
