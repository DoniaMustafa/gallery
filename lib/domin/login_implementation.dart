import 'package:dio/src/response.dart';
import 'package:gellary/core/utils/end_pints.dart';
import 'package:gellary/data/datasourse/remote/dio_server.dart';
import 'package:gellary/data/repositories/signIn_repository.dart';

class LoginImplementation implements SignInRepository{

  LoginImplementation(this.dioHelper);
  final DioHelper dioHelper;
  @override
  Future<Response?> signIn({required String email, required String pass}) async{
    return await dioHelper.postData(url: loginEndPoint, data: {
      'email':email,
      'password':pass
    });
  }

}
