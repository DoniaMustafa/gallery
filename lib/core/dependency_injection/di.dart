
import 'package:gellary/data/datasourse/local/cache_helper.dart';
import 'package:gellary/data/datasourse/remote/dio_server.dart';
import 'package:gellary/data/repositories/get_gallery_repository.dart';
import 'package:gellary/data/repositories/signIn_repository.dart';
import 'package:gellary/data/repositories/upload_to_gallery_reop.dart';
import 'package:gellary/domin/get_gallery_implement.dart';
import 'package:gellary/domin/upload_to_gallery_implement.dart';
import 'package:gellary/presentation/screens/home/bloc/gallery/gallery_cubit.dart';
import 'package:gellary/presentation/screens/home/bloc/upload/upload_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domin/login_implementation.dart';
import '../../presentation/screens/login/blocs/login_cubit.dart';


GetIt di = GetIt.I..allowReassignment = true;
Future init() async {
//   //cache helper
  final prefs = await SharedPreferences.getInstance();
  di.registerLazySingleton<SharedPreferences>(() => prefs);
  di.registerLazySingleton<CacheHelper>(
      () => CacheImplement(di<SharedPreferences>()));

//DioHelper
  di.registerLazySingleton<DioHelper>(() => DioImplement());

  //Sign In
  di.registerLazySingleton<SignInRepository>(
      () => LoginImplementation( di<DioHelper>()));
  di.registerLazySingleton<LoginCubit>(
      () => LoginCubit(di<SignInRepository>()));


  //GetGallery
  di.registerLazySingleton<GetGalleryRepository>(
      () => GetGalleryImplement(di<DioHelper>()));


  di.registerLazySingleton<GalleryCubit>(
      () => GalleryCubit(di<GetGalleryRepository>()));

  //upload to gallery
  di.registerLazySingleton<UploadToGalleryRepository>(
          () => UploadToGalleryImplement(di<DioHelper>()));

  di.registerLazySingleton<UploadCubit>(
          () => UploadCubit(di<UploadToGalleryRepository>()));

}
