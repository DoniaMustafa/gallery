import 'package:dio/dio.dart';

abstract class UploadToGalleryRepository{

  Future<Response?>uploadImages({required List img,required String toke});
}