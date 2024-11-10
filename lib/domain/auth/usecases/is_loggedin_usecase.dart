import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/domain/auth/repositories/auth.dart';
import 'package:blog_app/service_locator.dart';

class IsLoginUsecase extends UseCase<bool,dynamic>{
  @override
  Future<bool> call({params}) async{
    return await sl<AuthRepository>().isLogin();
  }
}