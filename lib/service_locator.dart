import 'package:blog_app/core/network/dio_client.dart';
import 'package:blog_app/data/auth/repositories/auth.dart';
import 'package:blog_app/data/auth/sources/auth_api_service.dart';
import 'package:blog_app/data/category/repositories/category.dart';
import 'package:blog_app/data/category/sources/category_api_service.dart';
import 'package:blog_app/data/post/repositories/post.dart';
import 'package:blog_app/data/post/sources/post_api_service.dart';
import 'package:blog_app/data/tags/repositories/tags.dart';
import 'package:blog_app/data/tags/sources/tags_api_service.dart';
import 'package:blog_app/domain/auth/repositories/auth.dart';
import 'package:blog_app/domain/auth/usecases/is_loggedin_usecase.dart';
import 'package:blog_app/domain/auth/usecases/login_usecase.dart';
import 'package:blog_app/domain/auth/usecases/signup_usecase.dart';
import 'package:blog_app/domain/category/repositories/category.dart';
import 'package:blog_app/domain/category/usecase/add_category_usecase.dart';
import 'package:blog_app/domain/category/usecase/delete_category_usecase.dart';
import 'package:blog_app/domain/category/usecase/get_category_usecase.dart';
import 'package:blog_app/domain/category/usecase/update_category_usecase.dart';
import 'package:blog_app/domain/post/repositories/post.dart';
import 'package:blog_app/domain/post/usecase/add_post_usecase.dart';
import 'package:blog_app/domain/post/usecase/get_post_usecase.dart';
import 'package:blog_app/domain/post/usecase/get_user_details_usecase.dart';
import 'package:blog_app/domain/tags/repositories/tags.dart';
import 'package:blog_app/domain/tags/usecases/add_tags_usecase.dart';
import 'package:blog_app/domain/tags/usecases/delete_tags_usecase.dart';
import 'package:blog_app/domain/tags/usecases/get_tags_usecase.dart';
import 'package:blog_app/domain/tags/usecases/update_tags_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  /// DIO Service
  sl.registerSingleton<DioClient>(DioClient());

  /// Api Service
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<CategoryApiService>(CategoryApiServiceImpl());
  sl.registerSingleton<PostApiService>(PostApiServiceImpl());
  sl.registerSingleton<TagsApiService>(TagsApiServiceImpl());

  /// Repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  sl.registerSingleton<PostRepository>(PostRepositoryImpl());
  sl.registerSingleton<TagsRepository>(TagsRepositoryImpl());

  /// UseCases
  sl.registerSingleton<LoginUsecase>(LoginUsecase());
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<GetCategoryUsecase>(GetCategoryUsecase());
  sl.registerSingleton<GetPostUsecase>(GetPostUsecase());
  sl.registerSingleton<IsLoginUsecase>(IsLoginUsecase());
  sl.registerSingleton<AddCategoryUsecase>(AddCategoryUsecase());
  sl.registerSingleton<AddTagsUsecase>(AddTagsUsecase());
  sl.registerSingleton<GetTagsUsecase>(GetTagsUsecase());
  sl.registerSingleton<GetUserDetailsUsecase>(GetUserDetailsUsecase());
  sl.registerSingleton<AddPostUsecase>(AddPostUsecase());
  sl.registerSingleton<DeleteCategoryUsecase>(DeleteCategoryUsecase());
  sl.registerSingleton<UpdateCategoryUsecase>(UpdateCategoryUsecase());
  sl.registerSingleton<UpdateTagsUsecase>(UpdateTagsUsecase());
  sl.registerSingleton<DeleteTagsUsecase>(DeleteTagsUsecase());
}
