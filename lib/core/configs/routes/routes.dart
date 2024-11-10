import 'package:blog_app/domain/category/entity/category.dart';
import 'package:blog_app/domain/tags/entity/tags.dart';
import 'package:blog_app/presentation/auth/choose_auth/pages/choose_auth.dart';
import 'package:blog_app/presentation/auth/login/pages/login.dart';
import 'package:blog_app/presentation/auth/register/pages/signup.dart';
import 'package:blog_app/presentation/category/pages/add_category.dart';
import 'package:blog_app/presentation/category/pages/category.dart';
import 'package:blog_app/presentation/category/pages/update_category.dart';
import 'package:blog_app/presentation/home/pages/home.dart';
import 'package:blog_app/presentation/home/widgets/post_details.dart';
import 'package:blog_app/presentation/navigation_bar/pages/navigation.dart';
import 'package:blog_app/presentation/onboard/pages/onboard.dart';
import 'package:blog_app/presentation/tags/pages/add_tags.dart';
import 'package:blog_app/presentation/tags/pages/tags.dart';
import 'package:flutter/material.dart';
import '../../../domain/post/entity/post.dart';
import '../../../presentation/splash/pages/splash.dart';
import '../../../presentation/tags/pages/update_tags.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case AppRoutesName.onboardScreens:
        return MaterialPageRoute(builder: (context) => OnBoardingScreen());
      case AppRoutesName.authScreen:
        return MaterialPageRoute(builder: (context) => const ChooseAuthScreen());
      case AppRoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case AppRoutesName.signupScreen:
        return MaterialPageRoute(builder: (context) => SignupScreen());
      case AppRoutesName.navigationBar:
        return MaterialPageRoute(builder: (context) =>  const NavigationPage());
      case AppRoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case AppRoutesName.addCategoryScreen:
        return MaterialPageRoute(builder: (context) => AddCategory());
      case AppRoutesName.categoryScreen:
        return MaterialPageRoute(builder: (context) => const CategoryScreen());
      case AppRoutesName.addTagsScreen:
        return MaterialPageRoute(builder: (context) =>  AddTags());
      case AppRoutesName.tagsScreen:
        return MaterialPageRoute(builder: (context) => const TagsScreen());
      case AppRoutesName.updateTag:
      final tagData = settings.arguments as TagsEntity;
        return MaterialPageRoute(builder: (context) => UpdateTagsScreen(tagsEntity: tagData,));
      case AppRoutesName.detailsPost:
      final postData = settings.arguments as PostEntity;
        return MaterialPageRoute(builder: (context) => PostDetails(postEntity: postData));
      case AppRoutesName.updateCategory:
      final categoryData = settings.arguments as CategoryEntity;
        return MaterialPageRoute(builder: (context) => UpdateCategoryScreen(categoryEntity: categoryData,));
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No Route Generated"),
              ),
            );
          },
        );
    }
  }
}
