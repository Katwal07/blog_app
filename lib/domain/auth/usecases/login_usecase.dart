import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/data/auth/model/signin_req_params.dart';
import 'package:blog_app/domain/auth/repositories/auth.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase extends UseCase<Either,SigninReqParams>{
  @override
  Future<Either> call({SigninReqParams ? params,  }) async{
    return await sl<AuthRepository>().login(params!);
  }
}