import 'package:dio/src/response.dart';
import 'package:gellary/core/utils/end_pints.dart';
import 'package:gellary/data/datasourse/remote/dio_server.dart';
import 'package:gellary/data/repositories/get_gallery_repository.dart';

class GetGalleryImplement implements GetGalleryRepository{

  GetGalleryImplement(this.dioHelper);
  final DioHelper dioHelper;
  @override
  Future<Response?> getAllProd({required String token})async {
    return await dioHelper.getData(url:getMyGalleryEndPoint ,
    token: token,);
  }
}