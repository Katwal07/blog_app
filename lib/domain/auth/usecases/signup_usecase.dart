import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/data/auth/model/signup_req_params.dart';
import 'package:blog_app/domain/auth/repositories/auth.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';

class SignupUsecase extends UseCase<Either,SignupReqParams>{
  @override
  Future<Either> call({SignupReqParams ? params}) async{
    return await sl<AuthRepository>().register(params!);
  }
}