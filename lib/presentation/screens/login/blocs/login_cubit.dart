import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gellary/core/utils/constant.dart';
import 'package:gellary/data/models/uesr_model.dart';
import 'package:gellary/data/repositories/signIn_repository.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repository) : super(LoginInitial());
  final SignInRepository repository;

  final key =GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  UserModel? userData;

  Future<Response?> login() async {
    emit(LoadingState());
    return await repository
        .signIn(email: email.text, pass: pass.text)
        .then((value) {
      userData=userModelFromJson(value.toString());
      print(userData);
      puttoken(userData!.token.toString());
      putname(userData!.user.name);
      emit(SuccessState(userData));
    })
        .catchError((onError) {
          print(onError.toString());
      emit(ErrorState(onError.toString()));
    });
  }
}
