part of 'upload_cubit.dart';

@immutable
abstract class UploadState {}

class UploadInitial extends UploadState {}
class UploadLoadingState extends UploadState {}
class UploadSuccessState extends UploadState {}
 class UploadErrorState extends UploadState {}

class LoadingImageState extends UploadState {}
class SuccessImageState extends UploadState {}
class ErrorImageState extends UploadState {}
class SelectImageState extends UploadState {}

