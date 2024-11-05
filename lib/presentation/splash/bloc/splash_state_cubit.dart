import 'package:blog_app/presentation/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashStateCubit extends Cubit<SplashState> {
  SplashStateCubit(): super(SplashInitialState());

  void displayCubit() async{
    await Future.delayed(const Duration(seconds: 4));
    emit(SplashUnAuthenticatedState());
  }
}