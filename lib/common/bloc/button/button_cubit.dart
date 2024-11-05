import 'package:blog_app/common/bloc/button/button_state.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCubit extends Cubit<ButtonState>{
  ButtonCubit(): super(ButtonInitial());

  void execute({required UseCase usecase, dynamic params}) async{
    emit(ButtonLoading());
    await Future.delayed(const Duration(seconds: 3));
    try {
      Either returnedData = await usecase.call(params: params);
      returnedData.fold(
        (error){
          emit(FailureButtonLoad(errorMessage: error));
        }, (data){
          emit(ButtonLoaded());
        });
    } catch (e) {
      emit(FailureButtonLoad(errorMessage: e.toString()));
    }
  }
}