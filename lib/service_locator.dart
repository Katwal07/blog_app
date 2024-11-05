import 'package:blog_app/core/network/dio_client.dart';
import 'package:blog_app/data/auth/repositories/auth.dart';
import 'package:blog_app/data/auth/sources/auth_api_service.dart';
import 'package:blog_app/data/category/repositories/category.dart';
import 'package:blog_app/data/category/sources/category_api_service.dart';
import 'package:blog_app/data/post/repositories/post.dart';
import 'package:blog_app/data/post/sources/post_api_service.dart';
import 'package:blog_app/domain/auth/repositories/auth.dart';
import 'package:blog_app/domain/auth/usecases/login_usecase.dart';
import 'package:blog_app/domain/auth/usecases/signup_usecase.dart';
import 'package:blog_app/domain/category/repositories/category.dart';
import 'package:blog_app/domain/category/usecase/get_category_usecase.dart';
import 'package:blog_app/domain/post/repositories/post.dart';
import 'package:blog_app/domain/post/usecase/get_post_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator(){
  /// DIO Service
  sl.registerSingleton<DioClient>(DioClient());

  /// Api Service
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<CategoryApiService>(CategoryApiServiceImpl());
  sl.registerSingleton<PostApiService>(PostApiServiceImpl());


  /// Repository 
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  sl.registerSingleton<PostRepository>(PostRepositoryImpl());



  /// UseCases
  sl.registerSingleton<LoginUsecase>(LoginUsecase());
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<GetCategoryUsecase>(GetCategoryUsecase());
  sl.registerSingleton<GetPostUsecase>(GetPostUsecase());
}