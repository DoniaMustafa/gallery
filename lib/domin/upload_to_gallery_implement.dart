import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:gellary/core/utils/end_pints.dart';
import 'package:gellary/data/datasourse/remote/dio_server.dart';
import 'package:gellary/data/repositories/upload_to_gallery_reop.dart';



class UploadToGalleryImplement implements UploadToGalleryRepository{
  UploadToGalleryImplement(this.dioHelper);
  final DioHelper dioHelper;


  @override
  Future<Response?> uploadImages({required List img,required String toke}) async{

    return await dioHelper.postData(url: uploadImageEndPoint, data: {'img':img},token: toke);
  }
}