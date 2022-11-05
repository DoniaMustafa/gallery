import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:gellary/core/utils/end_pints.dart';
import 'package:gellary/data/datasourse/remote/dio_server.dart';
import 'package:gellary/data/repositories/upload_to_gallery_reop.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

class UploadToGalleryImplement implements UploadToGalleryRepository {
  UploadToGalleryImplement(this.dioHelper);
  final DioHelper dioHelper;
  bool isSelect = false;
  XFile? image;
  File? imageFile;

  ImagePicker? imagePicker = ImagePicker();
  @override
  Future uploadImageCamera({required String pick}) async {
    if (pick == 'Camera') {
      image = await imagePicker!.pickImage(source: ImageSource.camera);
      if(image!=null){
        imageFile = File(image!.path);
      }
    } else {
      image = await imagePicker!.pickImage(source: ImageSource.gallery);
      print('img${image!.path}');
      if(image!=null){
        imageFile = File(image!.path);
      }
    }


  }

  @override
  Future<Response?> uploadImages({required String toke}) async {
    FormData formData = FormData.fromMap({
      'img':  await MultipartFile.fromFile(imageFile!.path, filename: imageFile!.path.split("/").last,
        contentType: MediaType("image", image!.path.split(".").last))

    });

    return await dioHelper
        .postData(url: uploadImageEndPoint, data:formData, token: toke)
        .then((value) {

    }).catchError((error) {

    });
  }


}
