import 'package:blog_app/presentation/auth/login/bloc/checkbox/checkbox_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckBoxCubit extends Cubit<CheckBoxState>{
  CheckBoxCubit(): super(CheckBoxInitial());

  void checkBox(bool isChecked){
    emit(CheckBoxClicked(value: !isChecked));
  }
}