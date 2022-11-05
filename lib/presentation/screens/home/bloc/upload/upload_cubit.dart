import 'package:gellary/core/utils/constant.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:gellary/data/repositories/upload_to_gallery_reop.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit(this.repository) : super(UploadInitial());

  final UploadToGalleryRepository repository;
  bool isSelect = false;

  selectGallery() {
    isSelect = !isSelect;
    print(isSelect);
    emit(SelectImageState());
  }

  uploadImageCamera(String pick) async {
    emit(UploadLoadingState());
    isSelect = false;

    return await repository.uploadImageCamera(pick: pick).then((value) {
      print(pick);
      print(value);
      uploadFile();
      emit(UploadSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(UploadErrorState());
    });
  }

  Future<Response?> uploadFile() async {
    emit(LoadingImageState());
    return await repository.uploadImages(toke: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTE3MTBmNTA4MzFmY2NiNDYwNGExMzY0ODJmNDFiZjU5OTEzY2JkY2ZhZmU2ZDY1OWJmZmQ5OGVkODE1MDk5MTRmNTRmMjZmZDA2NGZjZDIiLCJpYXQiOjE2NjcyODk3ODUuMDMzMTk5LCJuYmYiOjE2NjcyODk3ODUuMDMzMjAzLCJleHAiOjE2OTg4MjU3ODUuMDI2MzI0LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.bWImC0xkzNQe8iKxL1Scg0tGGZGUy3vWsiX1vBzj1gLvynIMJcOqVkEVZc2C3MgSaCHjyqGkN7zWyqYVqLasAaKKFmj9JiQgXozvPcHJPoJCGQQvogt-gnM0DPeFMF-g_CVJPNZ3nUkXpOLl3Os5DhvW53OVT1n5pisoNyvsrEJURWTXxt1EIxwnmoj0An8y9kq2WSX4Zn2RoVGKe3QnL-KOGKksfv2ahj7hG-ZNwVYazI6TXCIxZBCYGoZtfvq9CjTrVUcCBSiGgdyaJzAZi0lNR2c2zcZxWGbBQ_QvfTFDZmmPyogScE5cgy4MGsnYe4Sw7qLmHIrSsrMaJxRgQ_b7xobq9ob1vDhw9O-VcPpiCllEFyjMkdKOFC8UffoYZB3bafp9KZB6Dr3tS7fo6f4ojAKnj-b8g6AigjuFb4FAYlC0vxT76mtvvYFm8MjH1kH2QmJ0HzvhBxv45K9Cdtuvr3DdrwyDaoROR4eZ6S-Xp-LYuCkZ-e4UenLJC4mDUu8u6xoyLHKul3FhNlAUMj-oScKZgJxRUYhbVxzXruHwaycKdlX284-Y6cfSAf3AjIvfaXYeB1ajGuuCtYceBVGM5tDxY4i9I7kthk3DNRjaRQPIl5c8GQlYV3I3p-RItB33Y-ECNiG92U2fgB8fAVw5urOuFX7pIZZ0NEc6VAY')
        .then((value) {
      print('success');
      emit(SuccessImageState());
    }).catchError((error) {
      print('error : ${error.toString()}');
      emit(ErrorImageState());
    });
  }
}
