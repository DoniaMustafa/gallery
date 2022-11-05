import 'package:dio/dio.dart';

abstract class UploadToGalleryRepository{

  Future<Response?>uploadImages({required String toke});

  Future uploadImageCamera({required String pick});
}