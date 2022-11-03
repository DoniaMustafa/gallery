import 'package:dio/dio.dart';

abstract class GetGalleryRepository{

  Future<Response?>getAllProd({required String token});
}