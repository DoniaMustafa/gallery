import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:gellary/core/utils/end_pints.dart';
import 'package:gellary/data/datasourse/remote/dio_server.dart';
import 'package:gellary/data/repositories/upload_to_gallery_reop.dart';
import 'package:image_picker/image_picker.dart';

class UploadToGalleryImplement implements UploadToGalleryRepository {
  UploadToGalleryImplement(this.dioHelper);
  final DioHelper dioHelper;
  bool isSelect = false;

  MultipartFile? multipartFile;
  XFile? image;
  List multipartImageList = [];
  List<File>? imgeFile = [];
  ImagePicker? imagePicker = ImagePicker();
  @override
  Future uploadImageCamera({required String pick})async {
    if (pick == 'Camera') {
      image = await imagePicker!.pickImage(source: ImageSource.camera);
      print('img${image!.path}');
    } else {
      image = await imagePicker!.pickImage(source: ImageSource.gallery);
      print('img${image!.path}');
    }

  }
  @override
  Future<Response?> uploadImages({required String toke}) async {

    var formData = FormData.fromMap({
      'img': await MultipartFile.fromFile(image!.path,
      filename: image!.name,
    )
    });
    return await dioHelper.postData(
        url: uploadImageEndPoint, data: formData, token: toke);
  }




}
