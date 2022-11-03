import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class SignInRepository {

Future<Response?>signIn({required String email,required String pass});
}
