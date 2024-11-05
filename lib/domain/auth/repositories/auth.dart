import 'package:blog_app/data/auth/model/signin_req_params.dart';
import 'package:blog_app/data/auth/model/signup_req_params.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository{
  Future<Either> register(SignupReqParams params);
  Future<Either> login(SigninReqParams params);
}