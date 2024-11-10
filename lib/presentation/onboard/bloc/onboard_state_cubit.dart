import 'package:blog_app/presentation/onboard/bloc/onboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardStateCubit extends Cubit<OnBoardState>{
  OnBoardStateCubit(): super(OnBoardPageChangedState(pageIndex: 0));



  void updatePage(int index){
    emit(OnBoardPageChangedState(pageIndex: index));
  }
}