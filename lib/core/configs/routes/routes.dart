import 'package:blog_app/presentation/auth/choose_auth/pages/choose_auth.dart';
import 'package:blog_app/presentation/auth/login/pages/login.dart';
import 'package:blog_app/presentation/auth/register/pages/signup.dart';
import 'package:blog_app/presentation/choose_category/pages/category.dart';
import 'package:blog_app/presentation/choose_category/pages/loading.dart';
import 'package:blog_app/presentation/home/pages/home.dart';
import 'package:blog_app/presentation/navigation_bar/pages/navigation.dart';
import 'package:blog_app/presentation/onboard/pages/onboard.dart';
import 'package:flutter/material.dart';
import '../../../presentation/splash/pages/splash.dart';
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
      case AppRoutesName.chooseCategoryScreen:
        return MaterialPageRoute(builder: (context) => const ChooseCategoryScreen());
      case AppRoutesName.loadingScreen:
        return MaterialPageRoute(builder: (context) => const LoadingScreen());
      case AppRoutesName.navigationBar:
        return MaterialPageRoute(builder: (context) =>  const NavigationPage());
      case AppRoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
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
