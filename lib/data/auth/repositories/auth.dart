import 'package:blog_app/data/auth/model/signin_req_params.dart';
import 'package:blog_app/data/auth/model/signup_req_params.dart';
import 'package:blog_app/data/auth/sources/auth_api_service.dart';
import 'package:blog_app/domain/auth/repositories/auth.dart';
import 'package:blog_app/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> login(SigninReqParams params) async {
    var returnedData = await sl<AuthApiService>().login(params);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) async{
        final SharedPreferences getPrefs =await SharedPreferences.getInstance();
        getPrefs.setString('token', data['access_token']);
        return Right(data);
      },
    );
  }

  @override
  Future<Either> register(SignupReqParams params) async {
    var returnedData = await sl<AuthApiService>().register(params);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(data);
      },
    );
  }
  
  @override
  Future<bool> isLogin() async{
    try {
      final SharedPreferences getPrefs = await SharedPreferences.getInstance();
      var token = getPrefs.getString('token');
      if(token != null){
        return true;
      }else{
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
