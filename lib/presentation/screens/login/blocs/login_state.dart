part of 'login_cubit.dart';

@immutable
abstract class LoginState {
 final UserModel? user;
 final String? error;

 LoginState({this.user, this.error});
}

class LoginInitial extends LoginState {}
class LoadingState extends LoginState {}
class SuccessState extends LoginState {

  SuccessState(final UserModel? user):super(user: user);
}
class ErrorState extends LoginState {
  ErrorState(final String? error):super(error: error);

}
