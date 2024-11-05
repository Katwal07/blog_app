import 'package:blog_app/presentation/onboard/bloc/onboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardStateCubit extends Cubit<OnBoardState>{
  OnBoardStateCubit(): super(OnBoardPageChangedState(pageIndex: 0));

  static const String _prefKey = 'has_seen_onboard';

  /// IN STORAGE , IT IS STORED AS
  /// {
  ///  'has_seen_onboard': true/fasle;
  /// }

  Future<void> checkOnBoardStatus() async{
    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnBoarding = prefs.getBool(_prefKey) ?? false;

    if(hasSeenOnBoarding) {
      await Future.delayed(const Duration(seconds: 3));
      emit(OnBoardingComplete());
    }else{
      emit(OnBoardingNotComplete());
    }
  }

  Future<void> completeOnBoarding() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefKey, true);
    await checkOnBoardStatus();
  }

  void updatePage(int index){
    emit(OnBoardPageChangedState(pageIndex: index));
  }
}