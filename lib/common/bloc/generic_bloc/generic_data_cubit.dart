import 'package:blog_app/common/bloc/generic_bloc/generic_data_state.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenericDataCubit extends Cubit<GenericDataState>{
  GenericDataCubit(): super(DataInitial());

  void getData<T>(UseCase usecase, {dynamic params}) async{
    emit(DataLoading());
    var returnedData = await usecase.call(params: params);
    returnedData.fold(
      (error){
        emit(FailureLoadData(errorMessage: error));
      },
      (data){
        emit(DataLoaded<T>(data: data));
      }
    );
  }
}