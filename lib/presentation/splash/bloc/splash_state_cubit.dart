import 'package:blog_app/domain/auth/usecases/is_loggedin_usecase.dart';
import 'package:blog_app/presentation/splash/bloc/splash_state.dart';
import 'package:blog_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashStateCubit extends Cubit<SplashState> {
  SplashStateCubit() : super(SplashInitialState());

  static const String _prefKey = 'has_seen_onboard';

  Future<void> checkOnBoardStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnBoarding = prefs.getBool(_prefKey) ?? false;

    if (hasSeenOnBoarding) {
      emit(OnBoardingComplete());
    } else {
      emit(OnBoardingNotComplete());
    }
  }

  Future<void> completeOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefKey, true);
    await checkOnBoardStatus();
  }

  void displayCubit() async {
    await Future.delayed(const Duration(seconds: 3));
    var isLoggedIn = await sl<IsLoginUsecase>().call();

    /// IN STORAGE , IT IS STORED AS
    /// {
    ///  'has_seen_onboard': true/fasle;
    /// }

    if (isLoggedIn) {
      emit(SplashAuthenticatedState());
    } else {
      final splashPref = await SharedPreferences.getInstance();
      final hasSeenOnBoardingScreen = splashPref.getBool(_prefKey) ?? false;

      if(hasSeenOnBoardingScreen){
        emit(SplashUnAuthenticatedOnBoardingCompleteState());
      }else{
        emit(SplashUnAuthenticatedOnUnBoardingUnCompleteState());
      }
    }
  }
}
